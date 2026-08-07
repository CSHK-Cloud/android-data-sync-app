import '/components/selection_row/selection_row_widget.dart';
import '/components/slider/slider_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'form_section2_widget.dart' show FormSection2Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormSection2Model extends FlutterFlowModel<FormSection2Widget> {
  ///  Local state fields for this component.

  int? days = 14;

  ///  State fields for stateful widgets in this component.

  // Model for SelectionRow.
  late SelectionRowModel selectionRowModel1;
  // Model for SelectionRow.
  late SelectionRowModel selectionRowModel2;
  // Model for Slider.
  late SliderModel sliderModel;

  @override
  void initState(BuildContext context) {
    selectionRowModel1 = createModel(context, () => SelectionRowModel());
    selectionRowModel2 = createModel(context, () => SelectionRowModel());
    sliderModel = createModel(context, () => SliderModel());
  }

  @override
  void dispose() {
    selectionRowModel1.dispose();
    selectionRowModel2.dispose();
    sliderModel.dispose();
  }
}
