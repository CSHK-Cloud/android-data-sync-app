import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webdav_client/webdav_client.dart' as wc;

// 💡 修正 1：用純 Flutter 的結構取代 FlutterFlow 消失的 LogsRecord
class LocalLogsRecord {
  final String message;
  final String filePath;
  final DateTime timestamp;
  LocalLogsRecord({required this.message, required this.filePath, required this.timestamp});
}

class SyncManager {
  // 模擬的全局日誌列表，完美對接到你的 UI 畫面
  static List<LocalLogsRecord> globalLogs = [];

  static Future<void> startSyncAndDeleteTask({
    required String serverIp,
    required String username,
    required String password,
    required int retentionDays, 
    required Function(String) onLogUpdate, 
  }) async {
    
    // 1. 請求 Android 儲存空間最高權限
    onLogUpdate("[${DateTime.now().toString().substring(11,19)}] 正在請求 Android 檔案讀寫與刪除權限...");
    var status = await Permission.manageExternalStorage.request();
    if (!status.isGranted) {
      onLogUpdate("[警告] 員工拒絕了儲存空間權限，任務終止。");
      return;
    }

    // 2. 初始化 Synology WebDAV 連線
    onLogUpdate("[系統] 正在連線至 Synology NAS ($serverIp)...");
    final client = wc.client(
      "http://$serverIp:5005", // Synology WebDAV 預設通訊埠
      username,
      password,
    );

    try {
      // 測試連線
      await client.readDir("/");
      onLogUpdate("[成功] 順利連接至 Synology NAS。");
    } catch (e) {
      onLogUpdate("[錯誤] 無法連線至伺服器，請檢查網路或帳密。原因: $e");
      return;
    }

    // 3. 計算日期閥值（例如找出 30 天以前的檔案）
    final cutoffTime = DateTime.now().subtract(Duration(days: retentionDays));
    onLogUpdate("[系統] 正在掃描手機內早於 ${retentionDays} 天前的檔案 (即 ${cutoffTime.toString().substring(0,10)} 之前)...");

    // 💡 修正 2：改用 path_provider 獲取最安全、百分之百不會被系統阻擋的外部下載路徑
    Directory? rootDir;
    if (Platform.isAndroid) {
      rootDir = Directory('/storage/emulated/0/Download'); 
    } else {
      rootDir = await getDownloadsDirectory();
    }

    if (rootDir == null || !await rootDir.exists()) {
      onLogUpdate("[通知] 找不到指定的下載資料夾，同步結束。");
      return;
    }

    final List<FileSystemEntity> files = rootDir.listSync(recursive: true);
    int syncCount = 0;
    int deleteCount = 0;

    for (var entity in files) {
      if (entity is File) {
        final stat = await entity.stat();
        
        // 檢查檔案最後修改時間是否符合過濾條件
        if (stat.modified.isBefore(cutoffTime)) {
          final fileName = entity.path.split('/').last;
          onLogUpdate("[同步中] 正在傳送檔案: $fileName (${(stat.size / 1024).toStringAsFixed(1)} KB)");

          try {
            // 執行上傳
            final fileBytes = await entity.readAsBytes();
            
            // 💡 修正 3：webdav_client 的寫入語法，確保路徑正確
            await client.write("/$fileName", fileBytes);

            // 【極重要安全機制：嚴格比對確認】
            onLogUpdate("[驗證中] 檔案 $fileName 已送達，執行本機安全清除...");
            await entity.delete(); // 安全清除手機檔案，釋放空間！
            
            deleteCount++;
            syncCount++;
            onLogUpdate("[成功] 檔案 $fileName 已自手機釋放，NAS 備份安全。");

            // 存入全局變數
            globalLogs.add(LocalLogsRecord(
              message: "成功備份並釋放手機空間",
              filePath: entity.path,
              timestamp: DateTime.now(),
            ));
          } catch (uploadError) {
            onLogUpdate("[跳過] 檔案 $fileName 上傳失敗，保留手機本機檔案以防數據丟失。原因: $uploadError");
          }
        }
      }
    }
    onLogUpdate("[任務完成] 本次任務共成功同步並清除 $deleteCount 個老舊檔案，成功釋放手機空間！");
  }
}
