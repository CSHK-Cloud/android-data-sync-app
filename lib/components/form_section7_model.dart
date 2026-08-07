import '/components/checkbox/checkbox_widget.dart';
import '/components/radio/radio_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'form_section7_widget.dart' show FormSection7Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormSection7Model extends FlutterFlowModel<FormSection7Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for Radio.
  late RadioModel radioModel1;
  // Model for Radio.
  late RadioModel radioModel2;
  // Model for Checkbox.
  late CheckboxModel checkboxModel;

  @override
  void initState(BuildContext context) {
    radioModel1 = createModel(context, () => RadioModel());
    radioModel2 = createModel(context, () => RadioModel());
    checkboxModel = createModel(context, () => CheckboxModel());
  }

  @override
  void dispose() {
    radioModel1.dispose();
    radioModel2.dispose();
    checkboxModel.dispose();
  }
}
