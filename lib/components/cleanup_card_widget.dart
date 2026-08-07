
import '/components/button/button_widget.dart';
import '/components/status_badge2/status_badge2_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import '../index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'cleanup_card_model.dart';
export 'cleanup_card_model.dart';

class CleanupCardWidget extends StatefulWidget {
  const CleanupCardWidget({
    super.key,
    this.icon,
    String? title,
    String? subtitle,
    String? isActive,
    String? rule,
    String? taskId,
    this.task_id,
  })  : this.title = title ?? '',
        this.subtitle = subtitle ?? '',
        this.isActive = isActive ?? '',
        this.rule = rule ?? '',
        this.taskId = taskId ?? '';

  final Widget? icon;
  final String title;
  final String subtitle;
  final String isActive;
  final String rule;
  final String taskId;
  final String? task_id;

  @override
  State<CleanupCardWidget> createState() => _CleanupCardWidgetState();
}

class _CleanupCardWidgetState extends State<CleanupCardWidget> {
  late CleanupCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CleanupCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CleanJobsRecord>(
      stream: CleanJobsRecord.getDocument('clean_jobs/${widget!.task_id}'.ref),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),
          );
        }

        final cleanupCardCleanJobsRecord = snapshot.data!;

        return Container(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                          shape: BoxShape.rectangle,
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: widget!.icon!,
                      ),
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
                          ].divide(SizedBox(height: 4)),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.statusBadge4b480b40Model,
                        updateCallback: () => safeSetState(() {}),
                        child: StatusBadge2Widget(
                          active: widget!.isActive,
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
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Retention Rule:',
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
                                    color: FlutterFlowTheme.of(context).accent3,
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
                            Text(
                              widget!.rule,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                    lineHeight: 1.6,
                                  ),
                            ),
                          ].divide(SizedBox(height: 4)),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          // ff_lite_route_params:task_id:"$task_id"

                          context.goNamed(
                            TaskConfigurationWidget.routeName,
                            queryParameters: {
                              'taskId': serializeParam(
                                '\$task_id',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: wrapWithModel(
                          model: _model.buttonModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: ButtonWidget(
                            icon: Icon(
                              Icons.settings_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24,
                            ),
                            iconPresent: true,
                            iconEndPresent: false,
                            content: 'Config',
                            variant: 'outline',
                            size: 'small',
                            fullWidth: false,
                            loading: false,
                            disabled: false,
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 8)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      wrapWithModel(
                        model: _model.buttonModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: ButtonWidget(
                          icon: Icon(
                            Icons.play_arrow_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24,
                          ),
                          iconPresent: true,
                          iconEndPresent: false,
                          content: 'Start Now',
                          variant: 'primary',
                          size: 'small',
                          fullWidth: false,
                          loading: false,
                          disabled: false,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.buttonModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: ButtonWidget(
                          icon: Icon(
                            Icons.stop_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24,
                          ),
                          iconPresent: true,
                          iconEndPresent: false,
                          content: 'Stop',
                          variant: 'secondary',
                          size: 'small',
                          fullWidth: false,
                          loading: false,
                          disabled: false,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          // ff_lite_doc_locals:task

                          await 'sync_jobs/${"$task_id"}'
                              .ref
                              .update(createSyncJobsRecordData(
                                status: task.status == "active"
                                    ? 'Paused'
                                    : 'active',
                              ));
                        },
                        child: wrapWithModel(
                          model: _model.buttonModel4,
                          updateCallback: () => safeSetState(() {}),
                          child: ButtonWidget(
                            icon: Icon(
                              Icons.block_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24,
                            ),
                            iconPresent: true,
                            iconEndPresent: false,
                            content: 'Disable',
                            variant: 'ghost',
                            size: 'small',
                            fullWidth: false,
                            loading: false,
                            disabled: false,
                          ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 8,
                        buttonSize: 40,
                        fillColor: Colors.transparent,
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          color: FlutterFlowTheme.of(context).error,
                          size: 20,
                        ),
                        onPressed: () async {
                          await cleanupCardCleanJobsRecord.reference.delete();
                        },
                      ),
                    ].divide(SizedBox(width: 8)),
                  ),
                ].divide(SizedBox(height: 16)),
              ),
            ),
          ),
        );
      },
    );
  }
}
