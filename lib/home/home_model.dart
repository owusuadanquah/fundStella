import '/auth/firebase_auth/auth_util.dart';
import '/component/card_donation/card_donation_widget.dart';
import '/component/navbar_home/navbar_home_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for card_donation component.
  late CardDonationModel cardDonationModel1;
  // Model for card_donation component.
  late CardDonationModel cardDonationModel2;
  // Model for navbar_home component.
  late NavbarHomeModel navbarHomeModel;

  @override
  void initState(BuildContext context) {
    cardDonationModel1 = createModel(context, () => CardDonationModel());
    cardDonationModel2 = createModel(context, () => CardDonationModel());
    navbarHomeModel = createModel(context, () => NavbarHomeModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    cardDonationModel1.dispose();
    cardDonationModel2.dispose();
    navbarHomeModel.dispose();
  }
}
