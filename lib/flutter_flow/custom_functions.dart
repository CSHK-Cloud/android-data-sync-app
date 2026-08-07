import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

// ==========================================
// 模擬 AI 原本需要的資料庫紀錄結構（避免編譯報錯）
// ==========================================
class LogsRecord {
  final String message;
  final String filePath;
  LogsRecord({required this.message, required this.filePath});
}

class SystemMetricsRecord {
  final double localUsed;
  final double localTotal;
  final double nasUsed;
  final double nasTotal;
  final String healthStatus;
  SystemMetricsRecord({
    required this.localUsed, 
    required this.localTotal, 
    required this.nasUsed, 
    required this.nasTotal, 
    required this.healthStatus
  });
}

// ==========================================
// 函式 1：recentLogs (獲取近期 3 條日誌)
// ==========================================
List<LogsRecord> recentLogs(List<LogsRecord> logs) {
  return logs.take(3).toList();
}

// ==========================================
// 函式 2：filteredLogs (根據關鍵字過濾日誌訊息或路徑)
// ==========================================
List<LogsRecord> filteredLogs(
  List<LogsRecord> logs,
  String logSearchQuery,
) {
  final all = logs;
  final q = logSearchQuery.toLowerCase();
  if (q.isEmpty) return all;
  return all.where((l) {
    final msgMatch = l.message.toLowerCase().contains(q);
    final pathMatch = l.filePath.toLowerCase().contains(q);
    return msgMatch || pathMatch;
  }).toList();
}

// ==========================================
// 函式 3：currentMetrics (獲取目前的本機與 NAS 空間指標)
// ==========================================
dynamic currentMetrics(List<SystemMetricsRecord> systemMetrics) {
  if (systemMetrics.isEmpty) {
    return {
      "local_used": 0.0,
      "local_total": 1.0,
      "nas_used": 0.0,
      "nas_total": 1.0,
      "health_status": "operational"
    };
  }
  final first = systemMetrics.first;
  return {
    "local_used": first.localUsed,
    "local_total": first.localTotal,
    "nas_used": first.nasUsed,
    "nas_total": first.nasTotal,
    "health_status": first.healthStatus
  };
}
