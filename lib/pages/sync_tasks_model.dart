
import '/components/bottom_nav3/bottom_nav3_widget.dart';
import '/components/sync_task_card/sync_task_card_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import '../index.dart';
import 'sync_tasks_widget.dart' show SyncTasksWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SyncTasksModel extends FlutterFlowModel<SyncTasksWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BottomNav.
  late BottomNav3Model bottomNavModel;

  @override
  void initState(BuildContext context) {
    bottomNavModel = createModel(context, () => BottomNav3Model());
  }

  @override
  void dispose() {
    bottomNavModel.dispose();
  }
}
