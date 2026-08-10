import 'package:flutter/material.dart';
import 'pages/dashboard_widget.dart';
import 'pages/sync_tasks_widget.dart'; // 💡 確保使用複數名稱
import 'pages/local_clean_widget.dart';
import 'pages/logs_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Vault Sync',
      debugShowCheckedModeBanner: false,
      // 使用 Android 14/15 最新推崇的 Material 3 專業深色商務主題
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.teal,
      ),
      // 💡 修正 1：將入口直接改為你的主導航螢幕，一開啟就進入主畫面
      home: const MainNavigationScreen(), 
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  // 💡 修正 2 & 3：移除了外層的 const，並將 SyncTaskWidget 修正為複數的 SyncTasksWidget
  final List<Widget> _pages = [
    const DashboardWidget(),
    const SyncTasksWidget(), // 👈 修正為複數，對齊檔案名稱
    const LocalCleanWidget(),
    const LogsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBranch(child: _pages[_currentIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        indicatorColor: Colors.teal.withOpacity(0.2),
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.dashboard_outlined),
              selectedIcon: Icon(Icons.dashboard),
              label: 'Dashboard'),
          NavigationDestination(
              icon: Icon(Icons.sync_outlined),
              selectedIcon: Icon(Icons.sync),
              label: 'Sync Tasks'),
          NavigationDestination(
              icon: Icon(Icons.delete_sweep_outlined),
              selectedIcon: Icon(Icons.delete_sweep),
              label: 'Local Clean'),
          NavigationDestination(
              icon: Icon(Icons.list_alt_outlined),
              selectedIcon: Icon(Icons.list_alt),
              label: 'Logs'),
        ],
      ),
    );
  }
}

// 讓頁面切換時擁有流暢的漸層動畫，提升商業 App 的質感
class AnimatedBranch extends StatelessWidget {
  final Widget child;
  const AnimatedBranch({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: child,
    );
  }
}
