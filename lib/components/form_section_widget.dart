import '/components/text_field/text_field_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'form_section_model.dart';
export 'form_section_model.dart';

class FormSectionWidget extends StatefulWidget {
  const FormSectionWidget({
    super.key,
    String? title,
    this.name,
    this.rule,
  }) : this.title = title ?? 'TASK IDENTITY';

  final String title;
  final String? name;
  final String? rule;

  @override
  State<FormSectionWidget> createState() => _FormSectionWidgetState();
}

class _FormSectionWidgetState extends State<FormSectionWidget> {
  late FormSectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormSectionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          valueOrDefault<String>(
            widget!.title,
            'TASK IDENTITY',
          ),
          style: FlutterFlowTheme.of(context).labelMedium.override(
                font: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).primary,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                lineHeight: 1.2,
              ),
        ),
        Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  wrapWithModel(
                    model: _model.textFieldModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: TextFieldWidget(
                      label: 'Rule Name',
                      labelPresent: true,
                      helper: '',
                      helperPresent: false,
                      leadingIconPresent: false,
                      trailingIconPresent: false,
                      hint: 'e.g., Erase temporary downloads',
                      value: widget!.name,
                      onChange: '',
                      onSubmit: '',
                      variant: 'outlined',
                      error: false,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.textFieldModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: TextFieldWidget(
                      label: 'Description',
                      labelPresent: true,
                      helper: '',
                      helperPresent: false,
                      leadingIconPresent: false,
                      trailingIconPresent: false,
                      hint: 'Explain what this rule purges...',
                      value: widget!.rule,
                      onChange: '',
                      onSubmit: '',
                      variant: 'outlined',
                      error: false,
                    ),
                  ),
                ].divide(SizedBox(height: 16)),
              ),
            ),
          ),
        ),
      ].divide(SizedBox(height: 16)),
    );
  }
}
