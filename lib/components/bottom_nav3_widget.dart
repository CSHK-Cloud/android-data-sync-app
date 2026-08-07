import '/components/nav_item/nav_item_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'bottom_nav3_model.dart';
export 'bottom_nav3_model.dart';

class BottomNav3Widget extends StatefulWidget {
  const BottomNav3Widget({super.key});

  @override
  State<BottomNav3Widget> createState() => _BottomNav3WidgetState();
}

class _BottomNav3WidgetState extends State<BottomNav3Widget> {
  late BottomNav3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNav3Model());
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
        color: FlutterFlowTheme.of(context).secondaryBackground,
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  wrapWithModel(
                    model: _model.navItemModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: NavItemWidget(
                      label: 'Dashboard',
                      icon: Icon(
                        Icons.dashboard_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24,
                      ),
                      target: 'dashboard',
                      selected: false,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navItemModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: NavItemWidget(
                      label: 'Sync Tasks',
                      icon: Icon(
                        Icons.sync_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24,
                      ),
                      target: 'sync_tasks',
                      selected: true,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navItemModel3,
                    updateCallback: () => safeSetState(() {}),
                    child: NavItemWidget(
                      label: 'Local Clean',
                      icon: Icon(
                        Icons.auto_fix_high_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24,
                      ),
                      target: 'local_clean',
                      selected: false,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navItemModel4,
                    updateCallback: () => safeSetState(() {}),
                    child: NavItemWidget(
                      label: 'Logs',
                      icon: Icon(
                        Icons.list_alt_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24,
                      ),
                      target: 'logs',
                      selected: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
