
import '/components/button/button_widget.dart';
import '/components/form_section5/form_section5_widget.dart';
import '/components/form_section6/form_section6_widget.dart';
import '/components/form_section7/form_section7_widget.dart';
import '/components/form_section8/form_section8_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'add_sync_task_model.dart';
export 'add_sync_task_model.dart';

class AddSyncTaskWidget extends StatefulWidget {
  const AddSyncTaskWidget({super.key});

  static String routeName = 'AddSyncTask';
  static String routePath = '/addSyncTask';

  @override
  State<AddSyncTaskWidget> createState() => _AddSyncTaskWidgetState();
}

class _AddSyncTaskWidgetState extends State<AddSyncTaskWidget> {
  late AddSyncTaskModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddSyncTaskModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 0,
                height: 0,
              ),
              Container(
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.rectangle,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24, 32, 24, 24),
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'New Sync Task',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                font:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w800,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w800,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                                lineHeight: 1.3,
                                              ),
                                        ),
                                        Text(
                                          'Configure automated data replication',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                                lineHeight: 1.6,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 4)),
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 8,
                                      buttonSize: 40,
                                      fillColor: Colors.transparent,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24,
                                      ),
                                      onPressed: () async {
                                        context.pop();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 1,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                shape: BoxShape.rectangle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            wrapWithModel(
                              model: _model.formSectionModel,
                              updateCallback: () => safeSetState(() {}),
                              child: FormSection5Widget(
                                title: 'General Information',
                                name: _model.name,
                              ),
                            ),
                            wrapWithModel(
                              model: _model.formSectionModel,
                              updateCallback: () => safeSetState(() {}),
                              child: FormSection6Widget(
                                title: 'Connection Path',
                                source: _model.source,
                                destination: _model.destination,
                              ),
                            ),
                            wrapWithModel(
                              model: _model.formSectionModel,
                              updateCallback: () => safeSetState(() {}),
                              child: FormSection7Widget(
                                title: 'Replication Strategy',
                              ),
                            ),
                            wrapWithModel(
                              model: _model.formSectionModel,
                              updateCallback: () => safeSetState(() {}),
                              child: FormSection8Widget(
                                title: 'Schedule',
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                              child: Container(
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.all(24),
                                    child: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.name == null ||
                                                  _model.name == '') {
                                                _model.error =
                                                    '\"Task name is required\"';
                                                safeSetState(() {});
                                                return;
                                              }
                                              _model.error = '\"\"';
                                              safeSetState(() {});

                                              await SyncJobsRecord.collection
                                                  .doc()
                                                  .set(createSyncJobsRecordData(
                                                    title: _model.name,
                                                    destination: 'Remote NAS',
                                                    sourcePath: _model.source,
                                                    destinationPath:
                                                        _model.destination,
                                                    status: 'Paused',
                                                    icon: 'sync_rounded',
                                                    progress: 0.0,
                                                    throughput: '0 KB/s',
                                                    wifiOnly: true,
                                                    originalQuality: true,
                                                    autoCleanup: false,
                                                    schedule:
                                                        'Daily at 02:00 AM',
                                                  ));
                                              context.pop();
                                            },
                                            child: wrapWithModel(
                                              model: _model.buttonModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: ButtonWidget(
                                                icon: Icon(
                                                  Icons.add_task_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24,
                                                ),
                                                iconPresent: true,
                                                iconEndPresent: false,
                                                content: 'Create Sync Task',
                                                variant: 'primary',
                                                size: 'medium',
                                                fullWidth: true,
                                                loading: false,
                                                disabled: false,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pop();
                                            },
                                            child: wrapWithModel(
                                              model: _model.buttonModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: ButtonWidget(
                                                iconPresent: false,
                                                iconEndPresent: false,
                                                content: 'Cancel',
                                                variant: 'ghost',
                                                size: 'medium',
                                                fullWidth: true,
                                                loading: false,
                                                disabled: false,
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 16)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 32)),
                        ),
                      ),
                      Container(
                        height: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
