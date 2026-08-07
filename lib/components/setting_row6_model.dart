import '/components/switch_component/switch_component_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'setting_row6_widget.dart' show SettingRow6Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingRow6Model extends FlutterFlowModel<SettingRow6Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for Switch.
  late SwitchComponentModel switchModel;

  @override
  void initState(BuildContext context) {
    switchModel = createModel(context, () => SwitchComponentModel());
  }

  @override
  void dispose() {
    switchModel.dispose();
  }
}
