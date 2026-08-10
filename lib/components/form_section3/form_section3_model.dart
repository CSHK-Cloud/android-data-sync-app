import '/components/selection_row/selection_row_widget.dart';
import '/components/switch_component/switch_component_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'form_section3_widget.dart' show FormSection3Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormSection3Model extends FlutterFlowModel<FormSection3Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for Switch.
  late SwitchComponentModel switchModel;
  // Model for SelectionRow.
  late SelectionRowModel selectionRowModel;

  @override
  void initState(BuildContext context) {
    switchModel = createModel(context, () => SwitchComponentModel());
    selectionRowModel = createModel(context, () => SelectionRowModel());
  }

  @override
  void dispose() {
    switchModel.dispose();
    selectionRowModel.dispose();
  }
}
