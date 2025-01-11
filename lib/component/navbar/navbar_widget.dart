import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    super.key,
    int? exploreTab,
    int? history,
    int? notification,
    int? profile,
  })  : this.exploreTab = exploreTab ?? 1,
        this.history = history ?? 2,
        this.notification = notification ?? 3,
        this.profile = profile ?? 4;

  final int exploreTab;
  final int history;
  final int notification;
  final int profile;

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 66.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Builder(
            builder: (context) {
              if (FFAppState().explore == true) {
                return Text(
                  'Explore',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                );
              } else {
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('HomePage');

                    FFAppState().explore = true;
                    FFAppState().history = false;
                    FFAppState().notification = false;
                    FFAppState().profile = false;
                    safeSetState(() {});
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SvgPicture.asset(
                      'assets/images/Discovery.svg',
                      width: 24.0,
                      height: 24.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              }
            },
          ),
          Builder(
            builder: (context) {
              if (FFAppState().history == true) {
                return Text(
                  'History',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                );
              } else {
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('History');

                    FFAppState().explore = false;
                    FFAppState().history = true;
                    FFAppState().notification = false;
                    FFAppState().profile = false;
                    safeSetState(() {});
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SvgPicture.asset(
                      'assets/images/Paper.svg',
                      width: 24.0,
                      height: 24.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              }
            },
          ),
          Builder(
            builder: (context) {
              if (FFAppState().notification == true) {
                return Text(
                  'Notification',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                );
              } else {
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('inbox');

                    FFAppState().explore = false;
                    FFAppState().history = false;
                    FFAppState().notification = true;
                    FFAppState().profile = false;
                    safeSetState(() {});
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SvgPicture.asset(
                      'assets/images/Message.svg',
                      width: 24.0,
                      height: 24.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              }
            },
          ),
          Builder(
            builder: (context) {
              if (FFAppState().profile == true) {
                return Text(
                  'Profile',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                );
              } else {
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('profile_page');

                    FFAppState().explore = false;
                    FFAppState().history = false;
                    FFAppState().notification = false;
                    FFAppState().profile = true;
                    safeSetState(() {});
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SvgPicture.asset(
                      'assets/images/Profile.svg',
                      width: 24.0,
                      height: 24.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
