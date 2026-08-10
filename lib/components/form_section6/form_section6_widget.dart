import '/components/button/button_widget.dart';
import '/components/source_selector/source_selector_widget.dart';
import '/components/text_field/text_field_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'form_section6_model.dart';
export 'form_section6_model.dart';

class FormSection6Widget extends StatefulWidget {
  const FormSection6Widget({
    super.key,
    String? title,
    this.source,
    this.destination,
  }) : this.title = title ?? 'Connection Path';

  final String title;
  final String? source;
  final String? destination;

  @override
  State<FormSection6Widget> createState() => _FormSection6WidgetState();
}

class _FormSection6WidgetState extends State<FormSection6Widget> {
  late FormSection6Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormSection6Model());
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
            'Connection Path',
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
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: wrapWithModel(
                    model: _model.sourceSelectorModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: SourceSelectorWidget(
                      selected: true,
                      icon: Icon(
                        Icons.smartphone_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20,
                      ),
                      label: 'Local Storage',
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: wrapWithModel(
                    model: _model.sourceSelectorModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: SourceSelectorWidget(
                      selected: false,
                      icon: Icon(
                        Icons.dns_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20,
                      ),
                      label: 'Remote NAS',
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 16)),
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.folder_open_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24,
                          ),
                          Expanded(
                            flex: 1,
                            child: wrapWithModel(
                              model: _model.textFieldModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: TextFieldWidget(
                                label: 'Source Path',
                                labelPresent: true,
                                helper: '',
                                helperPresent: false,
                                leadingIconPresent: false,
                                trailingIconPresent: false,
                                hint: 'Type here...',
                                value: widget!.source,
                                onChange: '',
                                onSubmit: '',
                                variant: 'ghost',
                                error: false,
                              ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.buttonModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: ButtonWidget(
                              iconPresent: false,
                              iconEndPresent: false,
                              content: 'Browse',
                              variant: 'ghost',
                              size: 'small',
                              fullWidth: false,
                              loading: false,
                              disabled: false,
                            ),
                          ),
                        ].divide(SizedBox(width: 16)),
                      ),
                      Divider(
                        height: 16,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload_rounded,
                            color: FlutterFlowTheme.of(context).tertiary,
                            size: 24,
                          ),
                          Expanded(
                            flex: 1,
                            child: wrapWithModel(
                              model: _model.textFieldModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: TextFieldWidget(
                                label: 'Destination Path',
                                labelPresent: true,
                                helper: '',
                                helperPresent: false,
                                leadingIconPresent: false,
                                trailingIconPresent: false,
                                hint: 'Type here...',
                                value: widget!.destination,
                                onChange: '',
                                onSubmit: '',
                                variant: 'ghost',
                                error: false,
                              ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.buttonModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: ButtonWidget(
                              iconPresent: false,
                              iconEndPresent: false,
                              content: 'Browse',
                              variant: 'ghost',
                              size: 'small',
                              fullWidth: false,
                              loading: false,
                              disabled: false,
                            ),
                          ),
                        ].divide(SizedBox(width: 16)),
                      ),
                    ].divide(SizedBox(height: 16)),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 16)),
        ),
      ].divide(SizedBox(height: 16)),
    );
  }
}
