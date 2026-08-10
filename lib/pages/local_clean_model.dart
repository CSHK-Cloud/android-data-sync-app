
import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/cleanup_card/cleanup_card_widget.dart';
import '/components/tab_group/tab_group_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'local_clean_widget.dart' show LocalCleanWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LocalCleanModel extends FlutterFlowModel<LocalCleanWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TabGroup.
  late TabGroupModel tabGroupModel;
  // Model for BottomNav.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    tabGroupModel = createModel(context, () => TabGroupModel());
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    tabGroupModel.dispose();
    bottomNavModel.dispose();
  }
}
