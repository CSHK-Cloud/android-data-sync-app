
import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/button/button_widget.dart';
import '/components/form_section/form_section_widget.dart';
import '/components/form_section2/form_section2_widget.dart';
import '/components/form_section3/form_section3_widget.dart';
import '/components/form_section4/form_section4_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'add_clean_task_widget.dart' show AddCleanTaskWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCleanTaskModel extends FlutterFlowModel<AddCleanTaskWidget> {
  ///  Local state fields for this page.

  String? name;

  String? rule;

  int? days = 14;

  String? error;

  ///  State fields for stateful widgets in this page.

  // Model for FormSection.
  late FormSectionModel formSectionModel;
  // Model for FormSection.
  late FormSection2Model formSectionModel;
  // Model for FormSection.
  late FormSection3Model formSectionModel;
  // Model for FormSection.
  late FormSection4Model formSectionModel;
  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for Button.
  late ButtonModel buttonModel2;
  // Model for BottomNav.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    formSectionModel = createModel(context, () => FormSectionModel());
    formSectionModel = createModel(context, () => FormSection2Model());
    formSectionModel = createModel(context, () => FormSection3Model());
    formSectionModel = createModel(context, () => FormSection4Model());
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    formSectionModel.dispose();
    formSectionModel.dispose();
    formSectionModel.dispose();
    formSectionModel.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
    bottomNavModel.dispose();
  }
}
