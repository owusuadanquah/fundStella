import '/backend/backend.dart';
import '/component/hero/hero_widget.dart';
import '/component/small_card/small_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'search_widget.dart' show SearchWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for hero dynamic component.
  late FlutterFlowDynamicModels<HeroModel> heroModels;
  // Models for SmallCard dynamic component.
  late FlutterFlowDynamicModels<SmallCardModel> smallCardModels;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<CampaignRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    heroModels = FlutterFlowDynamicModels(() => HeroModel());
    smallCardModels = FlutterFlowDynamicModels(() => SmallCardModel());
  }

  @override
  void dispose() {
    heroModels.dispose();
    smallCardModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
