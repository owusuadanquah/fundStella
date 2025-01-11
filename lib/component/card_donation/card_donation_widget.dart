import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_donation_model.dart';
export 'card_donation_model.dart';

class CardDonationWidget extends StatefulWidget {
  const CardDonationWidget({super.key});

  @override
  State<CardDonationWidget> createState() => _CardDonationWidgetState();
}

class _CardDonationWidgetState extends State<CardDonationWidget> {
  late CardDonationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardDonationModel());
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, -0.08),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.asset(
                  'assets/images/vnimc_1.png',
                  width: double.infinity,
                  height: 175.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            'Rachel’s Senior High Assistance Fund',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'By Rachel Ellis',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                'Target: \$250.000',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: Color(0xFF303841),
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ].divide(SizedBox(width: 10.0)),
          ),
        ].divide(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
      ),
    );
  }
}
