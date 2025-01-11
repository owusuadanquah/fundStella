import '/backend/backend.dart';
import '/component/emptylistplaceholder/emptylistplaceholder_widget.dart';
import '/component/hero/hero_widget.dart';
import '/component/navbar/navbar_widget.dart';
import '/component/small_card/small_card_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for hero dynamic component.
  late FlutterFlowDynamicModels<HeroModel> heroModels1;
  // Models for hero dynamic component.
  late FlutterFlowDynamicModels<HeroModel> heroModels2;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for SmallCard dynamic component.
  late FlutterFlowDynamicModels<SmallCardModel> smallCardModels1;
  // Models for SmallCard dynamic component.
  late FlutterFlowDynamicModels<SmallCardModel> smallCardModels2;
  // Models for SmallCard dynamic component.
  late FlutterFlowDynamicModels<SmallCardModel> smallCardModels3;
  // Models for SmallCard dynamic component.
  late FlutterFlowDynamicModels<SmallCardModel> smallCardModels4;
  // Models for SmallCard dynamic component.
  late FlutterFlowDynamicModels<SmallCardModel> smallCardModels5;
  // Models for SmallCard dynamic component.
  late FlutterFlowDynamicModels<SmallCardModel> smallCardModels6;
  // Models for SmallCard dynamic component.
  late FlutterFlowDynamicModels<SmallCardModel> smallCardModels7;
  // Models for SmallCard dynamic component.
  late FlutterFlowDynamicModels<SmallCardModel> smallCardModels8;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    heroModels1 = FlutterFlowDynamicModels(() => HeroModel());
    heroModels2 = FlutterFlowDynamicModels(() => HeroModel());
    smallCardModels1 = FlutterFlowDynamicModels(() => SmallCardModel());
    smallCardModels2 = FlutterFlowDynamicModels(() => SmallCardModel());
    smallCardModels3 = FlutterFlowDynamicModels(() => SmallCardModel());
    smallCardModels4 = FlutterFlowDynamicModels(() => SmallCardModel());
    smallCardModels5 = FlutterFlowDynamicModels(() => SmallCardModel());
    smallCardModels6 = FlutterFlowDynamicModels(() => SmallCardModel());
    smallCardModels7 = FlutterFlowDynamicModels(() => SmallCardModel());
    smallCardModels8 = FlutterFlowDynamicModels(() => SmallCardModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    heroModels1.dispose();
    heroModels2.dispose();
    tabBarController?.dispose();
    smallCardModels1.dispose();
    smallCardModels2.dispose();
    smallCardModels3.dispose();
    smallCardModels4.dispose();
    smallCardModels5.dispose();
    smallCardModels6.dispose();
    smallCardModels7.dispose();
    smallCardModels8.dispose();
    navbarModel.dispose();
  }
}
