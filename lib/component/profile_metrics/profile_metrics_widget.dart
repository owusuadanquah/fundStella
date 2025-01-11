import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_metrics_model.dart';
export 'profile_metrics_model.dart';

class ProfileMetricsWidget extends StatefulWidget {
  const ProfileMetricsWidget({super.key});

  @override
  State<ProfileMetricsWidget> createState() => _ProfileMetricsWidgetState();
}

class _ProfileMetricsWidgetState extends State<ProfileMetricsWidget> {
  late ProfileMetricsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileMetricsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 75.0,
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: 100.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Color(0x30000000),
          width: 0.1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                '3',
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Nunito Sans',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'Submitted',
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Nunito Sans',
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ].addToStart(SizedBox(height: 23.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                '1.2k',
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Nunito Sans',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'Followers',
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Nunito Sans',
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ].addToStart(SizedBox(height: 23.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                '22',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito Sans',
                      color: Color(0xFF3E3E3E),
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'Following',
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Nunito Sans',
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ].addToStart(SizedBox(height: 23.0)),
          ),
        ],
      ),
    );
  }
}
