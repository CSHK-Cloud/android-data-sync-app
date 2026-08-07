import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'status_badge_model.dart';
export 'status_badge_model.dart';

class StatusBadgeWidget extends StatefulWidget {
  const StatusBadgeWidget({
    super.key,
    String? status,
  }) : this.status = status ?? '';

  final String status;

  @override
  State<StatusBadgeWidget> createState() => _StatusBadgeWidgetState();
}

class _StatusBadgeWidgetState extends State<StatusBadgeWidget> {
  late StatusBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusBadgeModel());
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
          widget!.status == 'operational'
              ? Color(0xFF065F46)
              : Color(0xFF991B1B),
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
                    widget!.status == 'operational'
                        ? Color(0xFF34D399)
                        : Color(0xFFF87171),
                    Color(0x00000000),
                  ),
                  borderRadius: BorderRadius.circular(9999),
                  shape: BoxShape.rectangle,
                ),
              ),
              Text(
                valueOrDefault<String>(
                  widget!.status == 'operational' ? 'Operational' : 'Warning',
                  'ComparisonConditionalValue(\$status == operational ? StringValue(\"Operational\") : StringValue(\"Warning\"))',
                ),
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                      color: valueOrDefault<Color>(
                        widget!.status == 'operational'
                            ? Color(0xFF34D399)
                            : Color(0xFFF87171),
                        Color(0x00000000),
                      ),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      lineHeight: 1.4,
                    ),
              ),
            ].divide(SizedBox(width: 6)),
          ),
        ),
      ),
    );
  }
}
