package com.cshk.datavault

import android.Manifest
import android.content.ActivityNotFoundException
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.Environment
import android.provider.Settings
import android.util.Base64
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.NavigationBar
import androidx.compose.material3.NavigationBarItem
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.darkColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateListOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.unit.dp
import androidx.compose.ui.graphics.Color
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleEventObserver
import androidx.lifecycle.compose.LocalLifecycleOwner
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File
import java.net.HttpURLConnection
import java.net.URL
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

object Colors {
	val teal = Color(0xFF14B8A6)
}

private const val REQUEST_CODE_READ_STORAGE = 1001
data class SyncProfile(
	val serverIp: String,
	val username: String,
	val password: String,
	val remoteDir: String,
	val daysThreshold: Int
) {
	val baseUrl: String
		get() = "http://$serverIp:5005"
}

enum class AppTab(val label: String) {
	Dashboard("Dashboard"),
	SyncTasks("Sync Tasks"),
	LocalClean("Local Clean"),
	Logs("Logs")
}

class MainActivity : ComponentActivity() {

	override fun onCreate(savedInstanceState: Bundle?) {
		super.onCreate(savedInstanceState)
		setContent {
			DataVaultApp(activity = this)
		}
	}
}

@Composable
private fun DataVaultApp(activity: ComponentActivity) {
	val colorScheme = darkColorScheme(
		primary = Colors.teal,
		secondary = Color(0xFF2DD4BF),
		tertiary = Color(0xFF0EA5A4),
		background = Color(0xFF0A1111),
		surface = Color(0xFF101A1A),
		onPrimary = Color(0xFF00201C),
		onBackground = Color(0xFFE7FFFA),
		onSurface = Color(0xFFE7FFFA)
	)

	var selectedTab by rememberSaveable { mutableStateOf(AppTab.Dashboard) }
	var permissionGranted by remember { mutableStateOf(hasStoragePermission(activity)) }
	var profile by remember { mutableStateOf<SyncProfile?>(null) }
	var isSyncing by remember { mutableStateOf(false) }
	val logs = remember { mutableStateListOf<String>() }
	val manager = remember { WebDavSyncManager(activity.applicationContext) }
	val scope = rememberCoroutineScope()

	val lifecycleOwner = LocalLifecycleOwner.current
	DisposableEffect(lifecycleOwner) {
		val observer = LifecycleEventObserver { _, event ->
			if (event == Lifecycle.Event.ON_RESUME) {
				permissionGranted = hasStoragePermission(activity)
			}
		}
		lifecycleOwner.lifecycle.addObserver(observer)
		onDispose { lifecycleOwner.lifecycle.removeObserver(observer) }
	}

	MaterialTheme(colorScheme = colorScheme) {
		Surface(modifier = Modifier.fillMaxSize()) {
			Scaffold(
				bottomBar = {
					NavigationBar {
						AppTab.entries.forEach { tab ->
							NavigationBarItem(
								selected = selectedTab == tab,
								onClick = { selectedTab = tab },
								icon = { Text(text = tab.label.take(1)) },
								label = { Text(text = tab.label) }
							)
						}
					}
				}
			) { innerPadding ->
				when (selectedTab) {
					AppTab.Dashboard -> DashboardScreen(
						innerPadding = innerPadding,
						permissionGranted = permissionGranted,
						profile = profile,
						onRequestPermission = { requestManageExternalStoragePermission(activity) }
					)

					AppTab.SyncTasks -> SyncTasksScreen(
						innerPadding = innerPadding,
						permissionGranted = permissionGranted,
						isSyncing = isSyncing,
						onRequestPermission = { requestManageExternalStoragePermission(activity) },
						onProfileUpdated = { newProfile ->
							profile = newProfile
							logs.add(0, "${timestampNow()} 已建立/更新 NAS 設定: ${newProfile.baseUrl}")
						},
						onStartSync = {
							if (isSyncing) return@SyncTasksScreen
							val activeProfile = profile
							if (activeProfile == null) {
								logs.add(0, "${timestampNow()} 請先建立 Sync Profile")
								return@SyncTasksScreen
							}
							if (!permissionGranted) {
								logs.add(0, "${timestampNow()} 需要 MANAGE_EXTERNAL_STORAGE 權限")
								return@SyncTasksScreen
							}

							isSyncing = true
							scope.launch {
								manager.syncDownloadFolder(activeProfile) { line ->
									logs.add(0, line)
								}
								isSyncing = false
							}
						}
					)

					AppTab.LocalClean -> LocalCleanScreen(
						innerPadding = innerPadding,
						permissionGranted = permissionGranted,
						onRequestPermission = { requestManageExternalStoragePermission(activity) },
						onRunLocalClean = { days ->
							if (!permissionGranted) {
								logs.add(0, "${timestampNow()} 請先授權檔案管理權限")
								return@LocalCleanScreen
							}
							scope.launch {
								manager.cleanLocalOldFiles(days) { line ->
									logs.add(0, line)
								}
							}
						}
					)

					AppTab.Logs -> LogsScreen(
						innerPadding = innerPadding,
						logs = logs,
						onClear = { logs.clear() }
					)
				}
			}
		}
	}
}

@Composable
private fun DashboardScreen(
	innerPadding: PaddingValues,
	permissionGranted: Boolean,
	profile: SyncProfile?,
	onRequestPermission: () -> Unit
) {
	Column(
		modifier = Modifier
			.fillMaxSize()
			.padding(innerPadding)
			.padding(16.dp),
		verticalArrangement = Arrangement.spacedBy(12.dp)
	) {
		Card(colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)) {
			Column(modifier = Modifier.padding(16.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
				Text("DataVault Dashboard", style = MaterialTheme.typography.headlineSmall)
				Text(
					text = if (permissionGranted) {
						"Storage 權限狀態: 已授權"
					} else {
						"Storage 權限狀態: 未授權"
					}
				)
				Text(
					text = profile?.let {
						"NAS 目標: ${it.baseUrl}/${it.remoteDir.trim('/')}"
					} ?: "NAS 目標: 尚未設定"
				)
				if (!permissionGranted) {
					Button(onClick = onRequestPermission) {
						Text("授權 MANAGE_EXTERNAL_STORAGE")
					}
				}
			}
		}

		Card(colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)) {
			Column(modifier = Modifier.padding(16.dp), verticalArrangement = Arrangement.spacedBy(6.dp)) {
				Text("同步流程", style = MaterialTheme.typography.titleMedium)
				Text("1. 掃描 /storage/emulated/0/Download")
				Text("2. 上傳超過 X 天的檔案到 Synology WebDAV")
				Text("3. 驗證雲端檔案大小")
				Text("4. 刪除本地原檔")
				Text("5. 即時串流日誌到 Logs 分頁")
			}
		}
	}
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun SyncTasksScreen(
	innerPadding: PaddingValues,
	permissionGranted: Boolean,
	isSyncing: Boolean,
	onRequestPermission: () -> Unit,
	onProfileUpdated: (SyncProfile) -> Unit,
	onStartSync: () -> Unit
) {
	var serverIp by rememberSaveable { mutableStateOf("192.168.1.2") }
	var username by rememberSaveable { mutableStateOf("admin") }
	var password by rememberSaveable { mutableStateOf("") }
	var remoteDir by rememberSaveable { mutableStateOf("webdav/DataVault") }
	var daysText by rememberSaveable { mutableStateOf("7") }

	Column(
		modifier = Modifier
			.fillMaxSize()
			.padding(innerPadding)
			.padding(16.dp),
		verticalArrangement = Arrangement.spacedBy(10.dp)
	) {
		Text("Sync Tasks", style = MaterialTheme.typography.headlineSmall)

		OutlinedTextField(
			value = serverIp,
			onValueChange = { serverIp = it.trim() },
			modifier = Modifier.fillMaxWidth(),
			label = { Text("Synology Server IP") },
			supportingText = { Text("將連線至 http://serverIp:5005") }
		)
		OutlinedTextField(
			value = username,
			onValueChange = { username = it },
			modifier = Modifier.fillMaxWidth(),
			label = { Text("WebDAV Username") }
		)
		OutlinedTextField(
			value = password,
			onValueChange = { password = it },
			modifier = Modifier.fillMaxWidth(),
			visualTransformation = PasswordVisualTransformation(),
			label = { Text("WebDAV Password") }
		)
		OutlinedTextField(
			value = remoteDir,
			onValueChange = { remoteDir = it.trim('/') },
			modifier = Modifier.fillMaxWidth(),
			label = { Text("Remote Directory") }
		)
		OutlinedTextField(
			value = daysText,
			onValueChange = { daysText = it.filter { ch -> ch.isDigit() } },
			modifier = Modifier.fillMaxWidth(),
			label = { Text("Upload files older than X days") }
		)

		Row(horizontalArrangement = Arrangement.spacedBy(10.dp)) {
			Button(onClick = {
				val parsedDays = daysText.toIntOrNull()?.coerceAtLeast(1) ?: 7
				if (serverIp.isNotBlank() && username.isNotBlank() && password.isNotBlank()) {
					onProfileUpdated(
						SyncProfile(
							serverIp = serverIp,
							username = username,
							password = password,
							remoteDir = remoteDir.ifBlank { "webdav/DataVault" },
							daysThreshold = parsedDays
						)
					)
				}
			}) {
				Text("建立/更新 Profile")
			}

			Button(onClick = onStartSync, enabled = !isSyncing) {
				Text(if (isSyncing) "同步中..." else "開始同步")
			}
		}

		if (!permissionGranted) {
			Button(onClick = onRequestPermission) {
				Text("授權檔案管理權限")
			}
		}
	}
}

@Composable
private fun LocalCleanScreen(
	innerPadding: PaddingValues,
	permissionGranted: Boolean,
	onRequestPermission: () -> Unit,
	onRunLocalClean: (Int) -> Unit
) {
	var daysText by rememberSaveable { mutableStateOf("30") }
	Column(
		modifier = Modifier
			.fillMaxSize()
			.padding(innerPadding)
			.padding(16.dp),
		verticalArrangement = Arrangement.spacedBy(12.dp)
	) {
		Text("Local Clean", style = MaterialTheme.typography.headlineSmall)
		Text("可單獨清理 Download 目錄內超過 X 天的檔案（不經上傳）。")

		OutlinedTextField(
			value = daysText,
			onValueChange = { daysText = it.filter { ch -> ch.isDigit() } },
			modifier = Modifier.fillMaxWidth(),
			label = { Text("Delete files older than X days") }
		)

		Button(onClick = {
			val days = daysText.toIntOrNull()?.coerceAtLeast(1) ?: 30
			onRunLocalClean(days)
		}) {
			Text("執行本地清理")
		}

		if (!permissionGranted) {
			Button(onClick = onRequestPermission) {
				Text("授權 MANAGE_EXTERNAL_STORAGE")
			}
		}
	}
}

@Composable
private fun LogsScreen(innerPadding: PaddingValues, logs: List<String>, onClear: () -> Unit) {
	Column(
		modifier = Modifier
			.fillMaxSize()
			.padding(innerPadding)
			.padding(16.dp)
	) {
		Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
			Text("Logs", style = MaterialTheme.typography.headlineSmall)
			Button(onClick = onClear) {
				Text("清除")
			}
		}

		Spacer(modifier = Modifier.height(12.dp))

		Card(
			modifier = Modifier.fillMaxSize(),
			colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
		) {
			if (logs.isEmpty()) {
				Text(
					text = "尚無日誌",
					modifier = Modifier.padding(16.dp)
				)
			} else {
				LazyColumn(modifier = Modifier.fillMaxSize().padding(12.dp)) {
					items(logs) { line ->
						Text(text = line)
						Spacer(modifier = Modifier.height(6.dp))
					}
				}
			}
		}
	}
}

private class WebDavSyncManager(private val context: Context) {

	private val downloadDir = File("/storage/emulated/0/Download")
	private val timeFormatter = SimpleDateFormat("HH:mm:ss", Locale.getDefault())

	suspend fun syncDownloadFolder(profile: SyncProfile, onLog: (String) -> Unit) {
		withContext(Dispatchers.IO) {
			log(onLog, "開始同步，目標: ${profile.baseUrl}/${profile.remoteDir.trim('/')}")

			if (!downloadDir.exists() || !downloadDir.isDirectory) {
				log(onLog, "找不到 Download 目錄: ${downloadDir.absolutePath}")
				return@withContext
			}

			val cutoff = System.currentTimeMillis() - profile.daysThreshold * 24L * 60L * 60L * 1000L
			val candidates = downloadDir.listFiles()
				?.filter { it.isFile && it.lastModified() < cutoff }
				?.sortedBy { it.lastModified() }
				.orEmpty()

			if (candidates.isEmpty()) {
				log(onLog, "沒有符合條件的檔案（>${profile.daysThreshold} 天）")
				return@withContext
			}

			log(onLog, "掃描完成，符合條件檔案數: ${candidates.size}")

			var successCount = 0
			candidates.forEach { file ->
				val uploaded = uploadFile(profile, file, onLog)
				if (!uploaded) {
					log(onLog, "上傳失敗，略過刪除: ${file.name}")
					return@forEach
				}

				val verified = verifyUploadedFile(profile, file, onLog)
				if (!verified) {
					log(onLog, "驗證失敗，保留本地檔案: ${file.name}")
					return@forEach
				}

				val deleted = file.delete()
				if (deleted) {
					successCount++
					log(onLog, "已刪除本地檔案: ${file.absolutePath}")
				} else {
					log(onLog, "無法刪除本地檔案: ${file.absolutePath}")
				}
			}

			log(onLog, "同步完成，成功處理檔案數: $successCount / ${candidates.size}")
		}
	}

	suspend fun cleanLocalOldFiles(days: Int, onLog: (String) -> Unit) {
		withContext(Dispatchers.IO) {
			log(onLog, "開始本地清理，門檻: $days 天")

			if (!downloadDir.exists() || !downloadDir.isDirectory) {
				log(onLog, "找不到 Download 目錄: ${downloadDir.absolutePath}")
				return@withContext
			}

			val cutoff = System.currentTimeMillis() - days * 24L * 60L * 60L * 1000L
			val files = downloadDir.listFiles()
				?.filter { it.isFile && it.lastModified() < cutoff }
				.orEmpty()

			if (files.isEmpty()) {
				log(onLog, "沒有可清理的舊檔")
				return@withContext
			}

			var deleted = 0
			files.forEach { file ->
				if (file.delete()) {
					deleted++
					log(onLog, "已刪除: ${file.name}")
				} else {
					log(onLog, "刪除失敗: ${file.name}")
				}
			}

			log(onLog, "本地清理完成，刪除數: $deleted / ${files.size}")
		}
	}

	private suspend fun uploadFile(profile: SyncProfile, file: File, onLog: (String) -> Unit): Boolean {
		return withContext(Dispatchers.IO) {
			try {
				val url = buildRemoteFileUrl(profile, file.name)
				log(onLog, "上傳中: ${file.name} -> $url")

				val connection = (url.openConnection() as HttpURLConnection).apply {
					requestMethod = "PUT"
					connectTimeout = 20_000
					readTimeout = 30_000
					doOutput = true
					setRequestProperty("Authorization", basicAuth(profile.username, profile.password))
					setRequestProperty("Content-Type", "application/octet-stream")
					setFixedLengthStreamingMode(file.length())
				}

				file.inputStream().use { input ->
					connection.outputStream.use { output ->
						input.copyTo(output)
					}
				}

				val code = connection.responseCode
				connection.disconnect()

				if (code in 200..299) {
					log(onLog, "上傳成功: ${file.name} (HTTP $code)")
					true
				} else {
					log(onLog, "上傳失敗: ${file.name} (HTTP $code)")
					false
				}
			} catch (e: Exception) {
				log(onLog, "上傳例外: ${file.name} (${e.message})")
				false
			}
		}
	}

	private suspend fun verifyUploadedFile(profile: SyncProfile, file: File, onLog: (String) -> Unit): Boolean {
		return withContext(Dispatchers.IO) {
			try {
				val url = buildRemoteFileUrl(profile, file.name)
				val connection = (url.openConnection() as HttpURLConnection).apply {
					requestMethod = "HEAD"
					connectTimeout = 15_000
					readTimeout = 15_000
					setRequestProperty("Authorization", basicAuth(profile.username, profile.password))
				}

				val code = connection.responseCode
				val remoteLength = connection.contentLengthLong
				connection.disconnect()

				if (code !in 200..299) {
					log(onLog, "驗證失敗: ${file.name} (HTTP $code)")
					return@withContext false
				}

				val localLength = file.length()
				val passed = remoteLength <= 0L || remoteLength == localLength
				if (passed) {
					log(onLog, "驗證成功: ${file.name} (remote=$remoteLength, local=$localLength)")
				} else {
					log(onLog, "驗證失敗: ${file.name} (remote=$remoteLength, local=$localLength)")
				}
				passed
			} catch (e: Exception) {
				log(onLog, "驗證例外: ${file.name} (${e.message})")
				false
			}
		}
	}

	private fun buildRemoteFileUrl(profile: SyncProfile, fileName: String): URL {
		val encodedName = Uri.encode(fileName)
		val dir = profile.remoteDir.trim().trim('/')
		val remotePath = if (dir.isBlank()) encodedName else "$dir/$encodedName"
		return URL("${profile.baseUrl}/$remotePath")
	}

	private suspend fun log(onLog: (String) -> Unit, message: String) {
		withContext(Dispatchers.Main) {
			onLog("${timestampNow(timeFormatter)} $message")
		}
	}
}

private fun hasStoragePermission(context: Context): Boolean {
	return when {
		Build.VERSION.SDK_INT >= Build.VERSION_CODES.R -> Environment.isExternalStorageManager()
		else -> ContextCompat.checkSelfPermission(
			context, Manifest.permission.READ_EXTERNAL_STORAGE
		) == PackageManager.PERMISSION_GRANTED
	}
}

private fun requestManageExternalStoragePermission(activity: ComponentActivity) {
	if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
		try {
			val intent = Intent(
				Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION,
				Uri.parse("package:${activity.packageName}")
			)
			activity.startActivity(intent)
		} catch (_: ActivityNotFoundException) {
			val intent = Intent(Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION)
			activity.startActivity(intent)
		}
	} else {
		// API 26–29: request READ_EXTERNAL_STORAGE at runtime
		ActivityCompat.requestPermissions(
			activity,
			arrayOf(Manifest.permission.READ_EXTERNAL_STORAGE),
			REQUEST_CODE_READ_STORAGE
		)
	}
}

private fun basicAuth(username: String, password: String): String {
	val creds = "$username:$password"
	val encoded = Base64.encodeToString(creds.toByteArray(Charsets.UTF_8), Base64.NO_WRAP)
	return "Basic $encoded"
}

private fun timestampNow(formatter: SimpleDateFormat = SimpleDateFormat("HH:mm:ss", Locale.getDefault())): String {
	return formatter.format(Date())
}
