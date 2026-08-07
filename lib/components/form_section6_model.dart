import '/components/button/button_widget.dart';
import '/components/source_selector/source_selector_widget.dart';
import '/components/text_field/text_field_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'form_section6_widget.dart' show FormSection6Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormSection6Model extends FlutterFlowModel<FormSection6Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for SourceSelector.
  late SourceSelectorModel sourceSelectorModel1;
  // Model for SourceSelector.
  late SourceSelectorModel sourceSelectorModel2;
  // Model for TextField.
  late TextFieldModel textFieldModel1;
  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for TextField.
  late TextFieldModel textFieldModel2;
  // Model for Button.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    sourceSelectorModel1 = createModel(context, () => SourceSelectorModel());
    sourceSelectorModel2 = createModel(context, () => SourceSelectorModel());
    textFieldModel1 = createModel(context, () => TextFieldModel());
    buttonModel1 = createModel(context, () => ButtonModel());
    textFieldModel2 = createModel(context, () => TextFieldModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    sourceSelectorModel1.dispose();
    sourceSelectorModel2.dispose();
    textFieldModel1.dispose();
    buttonModel1.dispose();
    textFieldModel2.dispose();
    buttonModel2.dispose();
  }
}
