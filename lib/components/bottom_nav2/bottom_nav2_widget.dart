import '/components/nav_item/nav_item_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'bottom_nav2_model.dart';
export 'bottom_nav2_model.dart';

class BottomNav2Widget extends StatefulWidget {
  const BottomNav2Widget({super.key});

  @override
  State<BottomNav2Widget> createState() => _BottomNav2WidgetState();
}

class _BottomNav2WidgetState extends State<BottomNav2Widget> {
  late BottomNav2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNav2Model());
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
                      selected: true,
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
                      selected: false,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navItemModel3,
                    updateCallback: () => safeSetState(() {}),
                    child: NavItemWidget(
                      label: 'Local Clean',
                      icon: Icon(
                        Icons.delete_sweep_rounded,
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
                        Icons.history_rounded,
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
