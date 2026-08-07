import '/components/selection_row/selection_row_widget.dart';
import '/components/switch_component/switch_component_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'form_section4_model.dart';
export 'form_section4_model.dart';

class FormSection4Widget extends StatefulWidget {
  const FormSection4Widget({
    super.key,
    String? title,
  }) : this.title = title ?? 'AUTOMATION';

  final String title;

  @override
  State<FormSection4Widget> createState() => _FormSection4WidgetState();
}

class _FormSection4WidgetState extends State<FormSection4Widget> {
  late FormSection4Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormSection4Model());
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
            'AUTOMATION',
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
                      label: 'Enable Schedule',
                      labelPresent: true,
                      variant: 'Android',
                      active: false,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.selectionRowModel,
                    updateCallback: () => safeSetState(() {}),
                    child: SelectionRowWidget(
                      icon: Icon(
                        Icons.event_repeat_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 20,
                      ),
                      label: 'Frequency',
                      value: 'Weekly',
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
