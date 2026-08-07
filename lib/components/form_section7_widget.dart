import '/components/checkbox/checkbox_widget.dart';
import '/components/radio/radio_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'form_section7_model.dart';
export 'form_section7_model.dart';

class FormSection7Widget extends StatefulWidget {
  const FormSection7Widget({
    super.key,
    String? title,
  }) : this.title = title ?? 'Replication Strategy';

  final String title;

  @override
  State<FormSection7Widget> createState() => _FormSection7WidgetState();
}

class _FormSection7WidgetState extends State<FormSection7Widget> {
  late FormSection7Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormSection7Model());
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
            'Replication Strategy',
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
            padding: EdgeInsets.all(16),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  wrapWithModel(
                    model: _model.radioModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: RadioWidget(
                      label: 'Mirror (Two-way)',
                      subtitle: 'Keep both locations identical',
                      color: FlutterFlowTheme.of(context).primary,
                      isSelected: true,
                      hasSubtitle: true,
                      disabled: false,
                    ),
                  ),
                  Divider(
                    height: 16,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  wrapWithModel(
                    model: _model.radioModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: RadioWidget(
                      label: 'One-way Backup',
                      subtitle: 'Only copy from source to destination',
                      color: FlutterFlowTheme.of(context).primary,
                      isSelected: false,
                      hasSubtitle: true,
                      disabled: false,
                    ),
                  ),
                  Divider(
                    height: 16,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  wrapWithModel(
                    model: _model.checkboxModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CheckboxWidget(
                      label: 'Delete source after sync',
                      subtitle: 'Free up local space automatically',
                      color: FlutterFlowTheme.of(context).primary,
                      isChecked: false,
                      hasSubtitle: true,
                      disabled: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ].divide(SizedBox(height: 16)),
    );
  }
}
