import '/components/selection_row/selection_row_widget.dart';
import '/components/switch_component/switch_component_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'form_section3_model.dart';
export 'form_section3_model.dart';

class FormSection3Widget extends StatefulWidget {
  const FormSection3Widget({
    super.key,
    String? title,
  }) : this.title = title ?? 'SYNC DEPENDENCY';

  final String title;

  @override
  State<FormSection3Widget> createState() => _FormSection3WidgetState();
}

class _FormSection3WidgetState extends State<FormSection3Widget> {
  late FormSection3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormSection3Model());
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
            'SYNC DEPENDENCY',
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
                    model: _model.switchModel,
                    updateCallback: () => safeSetState(() {}),
                    child: SwitchComponentWidget(
                      label: 'Only erase if backed up',
                      labelPresent: true,
                      variant: 'Android',
                      active: true,
                    ),
                  ),
                  Text(
                    'Files will only be deleted if they exist on the remote vault.',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                          lineHeight: 1.4,
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
                    model: _model.selectionRowModel,
                    updateCallback: () => safeSetState(() {}),
                    child: SelectionRowWidget(
                      icon: Icon(
                        Icons.sync_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 20,
                      ),
                      label: 'Linked Sync Task',
                      value: 'Photo Backup',
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
