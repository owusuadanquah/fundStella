import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_home_model.dart';
export 'navbar_home_model.dart';

class NavbarHomeWidget extends StatefulWidget {
  const NavbarHomeWidget({
    super.key,
    int? homeTab,
    int? favourited,
    int? bookmark,
    int? profile,
  })  : this.homeTab = homeTab ?? 1,
        this.favourited = favourited ?? 2,
        this.bookmark = bookmark ?? 3,
        this.profile = profile ?? 4;

  final int homeTab;
  final int favourited;
  final int bookmark;
  final int profile;

  @override
  State<NavbarHomeWidget> createState() => _NavbarHomeWidgetState();
}

class _NavbarHomeWidgetState extends State<NavbarHomeWidget> {
  late NavbarHomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarHomeModel());
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
                      'assets/images/solar_home-angle-bold.svg',
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
                      'assets/images/heart-tick.svg',
                      width: 24.0,
                      height: 24.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              }
            },
          ),
          FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: '',
            icon: Icon(
              Icons.add_sharp,
              size: 15.0,
            ),
            options: FFButtonOptions(
              width: 52.0,
              height: 52.0,
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              iconAlignment: IconAlignment.start,
              iconPadding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Nunito Sans',
                    color: Colors.white,
                    letterSpacing: 0.0,
                  ),
              elevation: 0.0,
              borderRadius: BorderRadius.circular(100.0),
            ),
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
                      'assets/images/solar_bookmark-linear.svg',
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
                      'assets/images/profile_(1).svg',
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
