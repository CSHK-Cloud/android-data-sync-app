import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'status_badge2_model.dart';
export 'status_badge2_model.dart';

class StatusBadge2Widget extends StatefulWidget {
  const StatusBadge2Widget({
    super.key,
    String? active,
  }) : this.active = active ?? '';

  final String active;

  @override
  State<StatusBadge2Widget> createState() => _StatusBadge2WidgetState();
}

class _StatusBadge2WidgetState extends State<StatusBadge2Widget> {
  late StatusBadge2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusBadge2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget!.active == 'false'
              ? FlutterFlowTheme.of(context).surfaceVariant
              : FlutterFlowTheme.of(context).success15,
          Color(0x00000000),
        ),
        borderRadius: BorderRadius.circular(9999),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: valueOrDefault<Color>(
                    widget!.active == 'false'
                        ? FlutterFlowTheme.of(context).secondaryText
                        : FlutterFlowTheme.of(context).success,
                    Color(0x00000000),
                  ),
                  borderRadius: BorderRadius.circular(9999),
                  shape: BoxShape.rectangle,
                ),
              ),
              Text(
                valueOrDefault<String>(
                  widget!.active == 'false' ? 'Paused' : 'Active',
                  'ComparisonConditionalValue(\$active == false ? StringValue(\"Paused\") : StringValue(\"Active\"))',
                ),
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                      color: valueOrDefault<Color>(
                        widget!.active == 'false'
                            ? FlutterFlowTheme.of(context).secondaryText
                            : FlutterFlowTheme.of(context).success,
                        Color(0x00000000),
                      ),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      lineHeight: 1.4,
                    ),
              ),
            ].divide(SizedBox(width: 4)),
          ),
        ),
      ),
    );
  }
}
