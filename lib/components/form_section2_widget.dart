import '/components/selection_row/selection_row_widget.dart';
import '/components/slider/slider_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'form_section2_model.dart';
export 'form_section2_model.dart';

class FormSection2Widget extends StatefulWidget {
  const FormSection2Widget({
    super.key,
    String? title,
    this.days,
  }) : this.title = title ?? 'TARGET & FILTERS';

  final String title;
  final int? days;

  @override
  State<FormSection2Widget> createState() => _FormSection2WidgetState();
}

class _FormSection2WidgetState extends State<FormSection2Widget> {
  late FormSection2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormSection2Model());
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
            'TARGET & FILTERS',
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
                    model: _model.selectionRowModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: SelectionRowWidget(
                      icon: Icon(
                        Icons.folder_open_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 20,
                      ),
                      label: 'Source Folder',
                      value: '/Downloads',
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
                    model: _model.selectionRowModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: SelectionRowWidget(
                      icon: Icon(
                        Icons.description_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 20,
                      ),
                      label: 'File Types',
                      value: 'All Files',
                    ),
                  ),
                  Divider(
                    height: 16,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'File Age Threshold',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                  lineHeight: 1.5,
                                ),
                          ),
                          Text(
                            '${_model.days?.toString()} Days',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                  lineHeight: 1.5,
                                ),
                          ),
                        ],
                      ),
                      wrapWithModel(
                        model: _model.sliderModel,
                        updateCallback: () => safeSetState(() {}),
                        child: SliderWidget(
                          label: '',
                          labelPresent: false,
                          description: '',
                          descriptionPresent: false,
                          valueLabel: '',
                          valueLabelPresent: false,
                          step: 0.0,
                          divisions: 0,
                          valuePercentage: widget!.days?.toDouble(),
                          color: FlutterFlowTheme.of(context).primary,
                          variant: 'Material',
                          disabled: false,
                          showTicks: true,
                        ),
                      ),
                    ].divide(SizedBox(height: 8)),
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
