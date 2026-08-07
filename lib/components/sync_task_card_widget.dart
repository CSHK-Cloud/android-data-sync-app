import '/components/action_btn/action_btn_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import 'sync_task_card_model.dart';
export 'sync_task_card_model.dart';

class SyncTaskCardWidget extends StatefulWidget {
  const SyncTaskCardWidget({
    super.key,
    String? title,
    String? subtitle,
    String? status,
    this.icon,
    double? progress,
    String? progressText,
  })  : this.title = title ?? '',
        this.subtitle = subtitle ?? '',
        this.status = status ?? '',
        this.progress = progress ?? 0.0,
        this.progressText = progressText ?? '';

  final String title;
  final String subtitle;
  final String status;
  final Widget? icon;
  final double progress;
  final String progressText;

  @override
  State<SyncTaskCardWidget> createState() => _SyncTaskCardWidgetState();
}

class _SyncTaskCardWidgetState extends State<SyncTaskCardWidget> {
  late SyncTaskCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SyncTaskCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: Container(
        child: Container(
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget!.title,
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                    lineHeight: 1.45,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              widget!.subtitle,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
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
                      Container(
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            widget!.status == 'active'
                                ? Color(0x00000000)
                                : FlutterFlowTheme.of(context).surfaceVariant,
                            Color(0x00000000),
                          ),
                          borderRadius: BorderRadius.circular(9999),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                          child: Container(
                            child: Text(
                              widget!.status,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    color: valueOrDefault<Color>(
                                      widget!.status == 'active'
                                          ? Color(0x00000000)
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      Color(0x00000000),
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                    lineHeight: 1.4,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      widget!.icon!,
                      Expanded(
                        flex: 1,
                        child: LinearPercentIndicator(
                          percent: valueOrDefault<double>(
                            widget!.progress,
                            0.0,
                          ),
                          lineHeight: 8,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: FlutterFlowTheme.of(context).primary,
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          barRadius: Radius.circular(4),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      Text(
                        '${widget!.progressText}',
                        style: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      wrapWithModel(
                        model: _model.actionBtnModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: ActionBtnWidget(
                          tapAction: 'app.start_sync(\"\$task_id\")',
                          icon: Icon(
                            Icons.sync_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24,
                          ),
                          label: 'Sync',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.actionBtnModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: ActionBtnWidget(
                          tapAction: 'app.stop_sync(\"\$task_id\")',
                          icon: Icon(
                            Icons.stop_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24,
                          ),
                          label: 'Stop',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.actionBtnModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: ActionBtnWidget(
                          tapAction: 'app.toggle_task_active(\"\$task_id\")',
                          icon: Icon(
                            Icons.block_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24,
                          ),
                          label: 'Disable',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.actionBtnModel4,
                        updateCallback: () => safeSetState(() {}),
                        child: ActionBtnWidget(
                          tapAction:
                              'navigate(task_configuration, {task_id: \"\$task_id\"})',
                          icon: Icon(
                            Icons.settings_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24,
                          ),
                          label: 'Config',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.actionBtnModel5,
                        updateCallback: () => safeSetState(() {}),
                        child: ActionBtnWidget(
                          tapAction: 'app.delete_sync_job(\"\$task_id\")',
                          icon: Icon(
                            Icons.delete_outline_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24,
                          ),
                          label: 'Remove',
                        ),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 16)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
