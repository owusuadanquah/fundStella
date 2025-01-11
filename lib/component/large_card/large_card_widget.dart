import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'large_card_model.dart';
export 'large_card_model.dart';

class LargeCardWidget extends StatefulWidget {
  const LargeCardWidget({super.key});

  @override
  State<LargeCardWidget> createState() => _LargeCardWidgetState();
}

class _LargeCardWidgetState extends State<LargeCardWidget> {
  late LargeCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LargeCardModel());
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
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset(
                'assets/images/vnimc_1.png',
                width: double.infinity,
                height: 135.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          RichText(
            textScaler: MediaQuery.of(context).textScaler,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Education\n',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Nunito Sans',
                        color: Color(0xFF34977D),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        lineHeight: 0.0,
                      ),
                ),
                TextSpan(
                  text:
                      'Let’s help Sophia raise funds needed\nto attend the University of Colorado',
                  style: TextStyle(
                    color: Color(0xFF3E3E3E),
                    fontSize: 16.0,
                    height: 5.0,
                  ),
                )
              ],
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Nunito Sans',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            textAlign: TextAlign.start,
          ),
        ].divide(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
      ),
    );
  }
}
