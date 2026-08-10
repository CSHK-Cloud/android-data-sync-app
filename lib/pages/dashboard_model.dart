
import '/components/activity_item/activity_item_widget.dart';
import '/components/bottom_nav2/bottom_nav2_widget.dart';
import '/components/button/button_widget.dart';
import '/components/metric_card/metric_card_widget.dart';
import '/components/status_badge/status_badge_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '../index.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for StatusBadge.
  late StatusBadgeModel statusBadgeModel;
  // Model for MetricCard.
  late MetricCardModel metricCardModel1;
  // Model for MetricCard.
  late MetricCardModel metricCardModel2;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for BottomNav.
  late BottomNav2Model bottomNavModel;

  @override
  void initState(BuildContext context) {
    statusBadgeModel = createModel(context, () => StatusBadgeModel());
    metricCardModel1 = createModel(context, () => MetricCardModel());
    metricCardModel2 = createModel(context, () => MetricCardModel());
    buttonModel = createModel(context, () => ButtonModel());
    bottomNavModel = createModel(context, () => BottomNav2Model());
  }

  @override
  void dispose() {
    statusBadgeModel.dispose();
    metricCardModel1.dispose();
    metricCardModel2.dispose();
    buttonModel.dispose();
    bottomNavModel.dispose();
  }
}
