import '/components/text_field/text_field_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'form_section5_model.dart';
export 'form_section5_model.dart';

class FormSection5Widget extends StatefulWidget {
  const FormSection5Widget({
    super.key,
    String? title,
    this.name,
  }) : this.title = title ?? 'General Information';

  final String title;
  final String? name;

  @override
  State<FormSection5Widget> createState() => _FormSection5WidgetState();
}

class _FormSection5WidgetState extends State<FormSection5Widget> {
  late FormSection5Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormSection5Model());
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
            'General Information',
          ),
          style: FlutterFlowTheme.of(context).titleSmall.override(
                font: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).secondaryText,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                lineHeight: 1.5,
              ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            wrapWithModel(
              model: _model.textFieldModel,
              updateCallback: () => safeSetState(() {}),
              child: TextFieldWidget(
                label: 'Task Name',
                labelPresent: true,
                helper: '',
                helperPresent: false,
                leadingIcon: Icon(
                  Icons.edit_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24,
                ),
                leadingIconPresent: true,
                trailingIconPresent: false,
                hint: 'e.g., Weekly NAS Backup',
                value: widget!.name,
                onChange: '',
                onSubmit: '',
                variant: 'outlined',
                error: false,
              ),
            ),
            Text(
              _model.error!,
              style: FlutterFlowTheme.of(context).labelSmall.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).labelSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).error,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).labelSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    lineHeight: 1.4,
                  ),
            ),
          ].divide(SizedBox(height: 16)),
        ),
      ].divide(SizedBox(height: 16)),
    );
  }
}
