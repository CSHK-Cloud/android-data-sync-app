import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'action_btn_model.dart';
export 'action_btn_model.dart';

class ActionBtnWidget extends StatefulWidget {
  const ActionBtnWidget({
    super.key,
    String? tapAction,
    this.icon,
    String? label,
  })  : this.tapAction = tapAction ?? '',
        this.label = label ?? 'Sync';

  final String tapAction;
  final Widget? icon;
  final String label;

  @override
  State<ActionBtnWidget> createState() => _ActionBtnWidgetState();
}

class _ActionBtnWidgetState extends State<ActionBtnWidget> {
  late ActionBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActionBtnModel());
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FlutterFlowIconButton(
          borderRadius: 8,
          buttonSize: 40,
          fillColor: FlutterFlowTheme.of(context).surfaceVariant,
          icon: Icon(
            Icons.sync_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 20,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        Text(
          valueOrDefault<String>(
            widget!.label,
            'Sync',
          ),
          style: FlutterFlowTheme.of(context).labelSmall.override(
                font: GoogleFonts.inter(
                  fontWeight:
                      FlutterFlowTheme.of(context).labelSmall.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).secondaryText,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                lineHeight: 1.4,
              ),
        ),
      ].divide(SizedBox(height: 4)),
    );
  }
}
