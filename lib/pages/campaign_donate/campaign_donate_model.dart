import '/component/donate/donate_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'campaign_donate_widget.dart' show CampaignDonateWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CampaignDonateModel extends FlutterFlowModel<CampaignDonateWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for donate component.
  late DonateModel donateModel;

  @override
  void initState(BuildContext context) {
    donateModel = createModel(context, () => DonateModel());
  }

  @override
  void dispose() {
    donateModel.dispose();
  }
}
