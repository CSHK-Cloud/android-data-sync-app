import '/components/nav_item/nav_item_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'bottom_nav2_widget.dart' show BottomNav2Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BottomNav2Model extends FlutterFlowModel<BottomNav2Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for NavItem.
  late NavItemModel navItemModel1;
  // Model for NavItem.
  late NavItemModel navItemModel2;
  // Model for NavItem.
  late NavItemModel navItemModel3;
  // Model for NavItem.
  late NavItemModel navItemModel4;

  @override
  void initState(BuildContext context) {
    navItemModel1 = createModel(context, () => NavItemModel());
    navItemModel2 = createModel(context, () => NavItemModel());
    navItemModel3 = createModel(context, () => NavItemModel());
    navItemModel4 = createModel(context, () => NavItemModel());
  }

  @override
  void dispose() {
    navItemModel1.dispose();
    navItemModel2.dispose();
    navItemModel3.dispose();
    navItemModel4.dispose();
  }
}
