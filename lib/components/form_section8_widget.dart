import '/components/switch_component/switch_component_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'form_section8_model.dart';
export 'form_section8_model.dart';

class FormSection8Widget extends StatefulWidget {
  const FormSection8Widget({
    super.key,
    String? title,
  }) : this.title = title ?? 'Schedule';

  final String title;

  @override
  State<FormSection8Widget> createState() => _FormSection8WidgetState();
}

class _FormSection8WidgetState extends State<FormSection8Widget> {
  late FormSection8Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormSection8Model());
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
            'Schedule',
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
            padding: EdgeInsets.all(24),
            child: Container(
              child: Column(
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
                        'Automated Sync',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                              lineHeight: 1.5,
                            ),
                      ),
                      wrapWithModel(
                        model: _model.switchModel,
                        updateCallback: () => safeSetState(() {}),
                        child: SwitchComponentWidget(
                          label: '',
                          labelPresent: false,
                          variant: 'Android',
                          active: true,
                        ),
                      ),
                    ],
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
                      Expanded(
                        flex: 1,
                        child: FlutterFlowDropDown<String>(
                          controller: _model.dropdownValueController ??=
                              FormFieldController<String>(
                            _model.dropdownValue ??= 'Daily',
                          ),
                          options: ['Hourly', 'Daily', 'Weekly', 'Monthly'],
                          onChanged: (val) =>
                              safeSetState(() => _model.dropdownValue = val),
                          width: 200,
                          height: 40,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                          hintText: 'Hourly',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          elevation: 2,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 1,
                          borderRadius: 8,
                          margin: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                          labelText: 'Frequency',
                          labelTextStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                    lineHeight: 1.4,
                                  ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: wrapWithModel(
                          model: _model.textFieldModel,
                          updateCallback: () => safeSetState(() {}),
                          child: TextFieldWidget(
                            label: 'Start Time',
                            labelPresent: true,
                            helper: '',
                            helperPresent: false,
                            leadingIcon: Icon(
                              Icons.schedule_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24,
                            ),
                            leadingIconPresent: true,
                            trailingIconPresent: false,
                            hint: 'Type here...',
                            value: '02:00 AM',
                            onChange: '',
                            onSubmit: '',
                            variant: 'outlined',
                            error: false,
                          ),
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
    );
  }
}
