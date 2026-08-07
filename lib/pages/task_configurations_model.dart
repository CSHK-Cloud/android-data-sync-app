
import '/components/action_pill/action_pill_widget.dart';
import '/components/button/button_widget.dart';
import '/components/setting_row/setting_row_widget.dart';
import '/components/setting_row2/setting_row2_widget.dart';
import '/components/setting_row3/setting_row3_widget.dart';
import '/components/setting_row4/setting_row4_widget.dart';
import '/components/setting_row5/setting_row5_widget.dart';
import '/components/setting_row6/setting_row6_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'task_configuration_widget.dart' show TaskConfigurationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskConfigurationModel extends FlutterFlowModel<TaskConfigurationWidget> {
  ///  Local state fields for this page.

  String? taskName;

  bool? wifiOnly = true;

  bool? originalQuality = true;

  bool? autoCleanup = false;

  String? error;

  ///  State fields for stateful widgets in this page.

  // Model for SettingRow.
  late SettingRowModel settingRowModel;
  // Model for SettingRow.
  late SettingRow2Model settingRowModel;
  // Model for SettingRow.
  late SettingRow3Model settingRowModel;
  // Model for SettingRow.
  late SettingRow4Model settingRowModel;
  // Model for SettingRow.
  late SettingRow5Model settingRowModel;
  // Model for SettingRow.
  late SettingRow6Model settingRowModel;
  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for ActionPill.
  late ActionPillModel actionPillModel1;
  // Model for ActionPill.
  late ActionPillModel actionPillModel2;
  // Model for ActionPill.
  late ActionPillModel actionPillModel3;
  // Model for ActionPill.
  late ActionPillModel actionPillModel4;
  // Model for Button.
  late ButtonModel buttonModel2;
  // Model for Button.
  late ButtonModel buttonModel3;

  @override
  void initState(BuildContext context) {
    settingRowModel = createModel(context, () => SettingRowModel());
    settingRowModel = createModel(context, () => SettingRow2Model());
    settingRowModel = createModel(context, () => SettingRow3Model());
    settingRowModel = createModel(context, () => SettingRow4Model());
    settingRowModel = createModel(context, () => SettingRow5Model());
    settingRowModel = createModel(context, () => SettingRow6Model());
    buttonModel1 = createModel(context, () => ButtonModel());
    actionPillModel1 = createModel(context, () => ActionPillModel());
    actionPillModel2 = createModel(context, () => ActionPillModel());
    actionPillModel3 = createModel(context, () => ActionPillModel());
    actionPillModel4 = createModel(context, () => ActionPillModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    buttonModel3 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    settingRowModel.dispose();
    settingRowModel.dispose();
    settingRowModel.dispose();
    settingRowModel.dispose();
    settingRowModel.dispose();
    settingRowModel.dispose();
    buttonModel1.dispose();
    actionPillModel1.dispose();
    actionPillModel2.dispose();
    actionPillModel3.dispose();
    actionPillModel4.dispose();
    buttonModel2.dispose();
    buttonModel3.dispose();
  }
}
