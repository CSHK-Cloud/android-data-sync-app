import '/components/action_btn/action_btn_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'sync_task_card_widget.dart' show SyncTaskCardWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class SyncTaskCardModel extends FlutterFlowModel<SyncTaskCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ActionBtn.
  late ActionBtnModel actionBtnModel1;
  // Model for ActionBtn.
  late ActionBtnModel actionBtnModel2;
  // Model for ActionBtn.
  late ActionBtnModel actionBtnModel3;
  // Model for ActionBtn.
  late ActionBtnModel actionBtnModel4;
  // Model for ActionBtn.
  late ActionBtnModel actionBtnModel5;

  @override
  void initState(BuildContext context) {
    actionBtnModel1 = createModel(context, () => ActionBtnModel());
    actionBtnModel2 = createModel(context, () => ActionBtnModel());
    actionBtnModel3 = createModel(context, () => ActionBtnModel());
    actionBtnModel4 = createModel(context, () => ActionBtnModel());
    actionBtnModel5 = createModel(context, () => ActionBtnModel());
  }

  @override
  void dispose() {
    actionBtnModel1.dispose();
    actionBtnModel2.dispose();
    actionBtnModel3.dispose();
    actionBtnModel4.dispose();
    actionBtnModel5.dispose();
  }
}
