import '/components/switch_component/switch_component_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'form_section8_widget.dart' show FormSection8Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormSection8Model extends FlutterFlowModel<FormSection8Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for Switch.
  late SwitchComponentModel switchModel;
  // State field(s) for Dropdown widget.
  String? dropdownValue;
  FormFieldController<String>? dropdownValueController;
  // Model for TextField.
  late TextFieldModel textFieldModel;

  @override
  void initState(BuildContext context) {
    switchModel = createModel(context, () => SwitchComponentModel());
    textFieldModel = createModel(context, () => TextFieldModel());
  }

  @override
  void dispose() {
    switchModel.dispose();
    textFieldModel.dispose();
  }
}
