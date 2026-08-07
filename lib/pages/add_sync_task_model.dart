
import '/components/button/button_widget.dart';
import '/components/form_section5/form_section5_widget.dart';
import '/components/form_section6/form_section6_widget.dart';
import '/components/form_section7/form_section7_widget.dart';
import '/components/form_section8/form_section8_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'add_sync_task_widget.dart' show AddSyncTaskWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddSyncTaskModel extends FlutterFlowModel<AddSyncTaskWidget> {
  ///  Local state fields for this page.

  String? name;

  String? source = '/InternalStorage/DCIM/Photos';

  String? destination = 'synology_nas/backups/mobile_photos';

  String? error;

  ///  State fields for stateful widgets in this page.

  // Model for FormSection.
  late FormSection5Model formSectionModel;
  // Model for FormSection.
  late FormSection6Model formSectionModel;
  // Model for FormSection.
  late FormSection7Model formSectionModel;
  // Model for FormSection.
  late FormSection8Model formSectionModel;
  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for Button.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    formSectionModel = createModel(context, () => FormSection5Model());
    formSectionModel = createModel(context, () => FormSection6Model());
    formSectionModel = createModel(context, () => FormSection7Model());
    formSectionModel = createModel(context, () => FormSection8Model());
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    formSectionModel.dispose();
    formSectionModel.dispose();
    formSectionModel.dispose();
    formSectionModel.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
  }
}
