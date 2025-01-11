import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/msgsmall_card/msgsmall_card_widget.dart';
import '/component/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'inbox_widget.dart' show InboxWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InboxModel extends FlutterFlowModel<InboxWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for msgsmall_card dynamic component.
  late FlutterFlowDynamicModels<MsgsmallCardModel> msgsmallCardModels;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    msgsmallCardModels = FlutterFlowDynamicModels(() => MsgsmallCardModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    msgsmallCardModels.dispose();
    navbarModel.dispose();
  }
}
