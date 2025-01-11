import '/backend/backend.dart';
import '/component/histsmall_card/histsmall_card_widget.dart';
import '/component/navbar/navbar_widget.dart';
import '/components/donation_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'history_widget.dart' show HistoryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoryModel extends FlutterFlowModel<HistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for histsmall_card dynamic component.
  late FlutterFlowDynamicModels<HistsmallCardModel> histsmallCardModels;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    histsmallCardModels = FlutterFlowDynamicModels(() => HistsmallCardModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    histsmallCardModels.dispose();
    navbarModel.dispose();
  }
}
