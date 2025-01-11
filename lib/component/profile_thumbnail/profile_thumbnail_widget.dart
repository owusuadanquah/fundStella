import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_thumbnail_model.dart';
export 'profile_thumbnail_model.dart';

class ProfileThumbnailWidget extends StatefulWidget {
  const ProfileThumbnailWidget({super.key});

  @override
  State<ProfileThumbnailWidget> createState() => _ProfileThumbnailWidgetState();
}

class _ProfileThumbnailWidgetState extends State<ProfileThumbnailWidget> {
  late ProfileThumbnailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileThumbnailModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Image.asset(
                'assets/images/medium_-_2.png',
                width: 46.0,
                height: 46.0,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Nunito Sans',
                        color: Color(0xFFCACACA),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Christina Williams',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 5.0)).around(SizedBox(height: 5.0)),
            ),
            Container(
              constraints: BoxConstraints(
                minWidth: 40.0,
                minHeight: 40.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                border: Border.all(
                  color: Color(0xFFDADDDD),
                ),
              ),
              child: Container(
                width: 20.0,
                height: 20.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/images/Search.svg',
                  fit: BoxFit.none,
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                minWidth: 40.0,
                minHeight: 40.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                border: Border.all(
                  color: Color(0xFFDADDDD),
                ),
              ),
              child: Container(
                width: 20.0,
                height: 20.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/images/solar_bell-linear.svg',
                  fit: BoxFit.none,
                ),
              ),
            ),
          ].divide(SizedBox(width: 15.0)),
        ),
      ),
    );
  }
}
