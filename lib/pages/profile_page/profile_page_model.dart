import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/navbar/navbar_widget.dart';
import '/component/profile_metrics/profile_metrics_widget.dart';
import '/components/set_goals_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in profile_page widget.
  List<CampaignRecord>? campaignQueryCount;
  // Model for profile_metrics component.
  late ProfileMetricsModel profileMetricsModel;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    profileMetricsModel = createModel(context, () => ProfileMetricsModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    profileMetricsModel.dispose();
    navbarModel.dispose();
  }
}
