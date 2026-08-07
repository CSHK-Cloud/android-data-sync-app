import '/components/switch_component/switch_component_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'setting_row5_model.dart';
export 'setting_row5_model.dart';

class SettingRow5Widget extends StatefulWidget {
  const SettingRow5Widget({
    super.key,
    this.icon,
    String? label,
    String? sub,
    this.originalQuality,
  })  : this.label = label ?? 'Original Quality',
        this.sub = sub ?? 'Upload full resolution RAW files';

  final Widget? icon;
  final String label;
  final String sub;
  final bool? originalQuality;

  @override
  State<SettingRow5Widget> createState() => _SettingRow5WidgetState();
}

class _SettingRow5WidgetState extends State<SettingRow5Widget> {
  late SettingRow5Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingRow5Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 16),
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget!.icon!,
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget!.label,
                        'Original Quality',
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                            lineHeight: 1.5,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget!.sub,
                        'Upload full resolution RAW files',
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                            lineHeight: 1.6,
                          ),
                    ),
                  ],
                ),
              ),
              wrapWithModel(
                model: _model.switchModel,
                updateCallback: () => safeSetState(() {}),
                child: SwitchComponentWidget(
                  label: '',
                  labelPresent: false,
                  variant: 'Android',
                  active: widget!.originalQuality,
                ),
              ),
            ].divide(SizedBox(width: 16)),
          ),
        ),
      ),
    );
  }
}
