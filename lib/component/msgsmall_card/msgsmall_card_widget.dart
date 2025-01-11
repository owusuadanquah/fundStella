import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'msgsmall_card_model.dart';
export 'msgsmall_card_model.dart';

class MsgsmallCardWidget extends StatefulWidget {
  const MsgsmallCardWidget({
    super.key,
    required this.transaction,
  });

  final TransactionRecord? transaction;

  @override
  State<MsgsmallCardWidget> createState() => _MsgsmallCardWidgetState();
}

class _MsgsmallCardWidgetState extends State<MsgsmallCardWidget> {
  late MsgsmallCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MsgsmallCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget!.transaction!.donatorRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }

        final cardUsersRecord = snapshot.data!;

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
                  child: Image.network(
                    valueOrDefault<String>(
                      cardUsersRecord.photoUrl,
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/donation-app-1cfwip/assets/li202a9b44uu/medium_-_2.png',
                    ),
                    width: 46.0,
                    height: 46.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cardUsersRecord.displayName.maybeHandleOverflow(
                              maxChars: 20,
                              replacement: '…',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 0.0, 0.0, 0.0),
                              child: Text(
                                dateTimeFormat(
                                    "MMMEd", widget!.transaction!.createdAt!),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFFCACACA),
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'You received a donation of ${formatNumber(
                          widget!.transaction?.amount,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                          currency: '\$',
                        )} from ${cardUsersRecord.displayName}! 🎉 Thank you for your efforts.'
                            .maybeHandleOverflow(
                          maxChars: 100,
                          replacement: '…',
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Nunito Sans',
                              color: Color(0xFF969696),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ]
                        .divide(SizedBox(height: 5.0))
                        .around(SizedBox(height: 5.0)),
                  ),
                ),
              ].divide(SizedBox(width: 15.0)),
            ),
          ),
        );
      },
    );
  }
}
