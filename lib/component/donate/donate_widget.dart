import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'donate_model.dart';
export 'donate_model.dart';

class DonateWidget extends StatefulWidget {
  const DonateWidget({
    super.key,
    required this.campaignRef,
  });

  final DocumentReference? campaignRef;

  @override
  State<DonateWidget> createState() => _DonateWidgetState();
}

class _DonateWidgetState extends State<DonateWidget> {
  late DonateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DonateModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CampaignRecord>(
      stream: CampaignRecord.getDocument(widget!.campaignRef!),
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

        final columnCampaignRecord = snapshot.data!;

        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              height: 467.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'How much wanna donate?',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.end,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.antiAlias,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            _model.amount = 50.0;
                            safeSetState(() {});
                          },
                          text: '\$50',
                          options: FFButtonOptions(
                            width: 153.0,
                            height: 65.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: valueOrDefault<Color>(
                              _model.amount == 50.0
                                  ? Color(0x3234977D)
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            _model.amount = 100.0;
                            safeSetState(() {});
                          },
                          text: '\$100',
                          options: FFButtonOptions(
                            width: 153.0,
                            height: 65.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: valueOrDefault<Color>(
                              _model.amount == 100.0
                                  ? Color(0x3234977D)
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            _model.amount = 150.0;
                            safeSetState(() {});
                          },
                          text: '\$150',
                          options: FFButtonOptions(
                            width: 153.0,
                            height: 65.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: valueOrDefault<Color>(
                              _model.amount == 150.0
                                  ? Color(0x3234977D)
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            _model.amount = 200.0;
                            safeSetState(() {});
                          },
                          text: '\$200',
                          options: FFButtonOptions(
                            width: 153.0,
                            height: 65.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: valueOrDefault<Color>(
                              _model.amount == 200.0
                                  ? Color(0x3234977D)
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: valueOrDefault<Color>(
                                    _model.amount == 200.0
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context).primary,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'or',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              Duration(milliseconds: 2000),
                              () async {
                                _model.amount =
                                    double.tryParse(_model.textController.text);
                                safeSetState(() {});
                              },
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Enter price manually',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF5F5F5),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 20.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            textAlign: TextAlign.center,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            final paymentResponse = await processStripePayment(
                              context,
                              amount: ((_model.amount!) * 100).round(),
                              currency: 'USD',
                              customerEmail: currentUserEmail,
                              customerName: currentUserDisplayName,
                              description:
                                  'Donation for: ${columnCampaignRecord.campaignName}under the category of: ${columnCampaignRecord.category}',
                              allowGooglePay: false,
                              allowApplePay: false,
                              buttonColor: FlutterFlowTheme.of(context).primary,
                              buttonTextColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            );
                            if (paymentResponse.paymentId == null &&
                                paymentResponse.errorMessage != null) {
                              showSnackbar(
                                context,
                                'Error: ${paymentResponse.errorMessage}',
                              );
                            }
                            _model.paymentId = paymentResponse.paymentId ?? '';

                            if (_model.paymentId != null &&
                                _model.paymentId != '') {
                              var transactionRecordReference =
                                  TransactionRecord.collection.doc();
                              await transactionRecordReference
                                  .set(createTransactionRecordData(
                                transactionId: _model.paymentId,
                                donatorRef: currentUserReference,
                                campaignRef: widget!.campaignRef,
                                amount: ((_model.amount!) * 0.75),
                                status: 'Completed',
                                createdAt: getCurrentTimestamp,
                                recipientRef: columnCampaignRecord.creatorId,
                              ));
                              _model.transaction =
                                  TransactionRecord.getDocumentFromData(
                                      createTransactionRecordData(
                                        transactionId: _model.paymentId,
                                        donatorRef: currentUserReference,
                                        campaignRef: widget!.campaignRef,
                                        amount: ((_model.amount!) * 0.75),
                                        status: 'Completed',
                                        createdAt: getCurrentTimestamp,
                                        recipientRef:
                                            columnCampaignRecord.creatorId,
                                      ),
                                      transactionRecordReference);
                              _model.userQuery = await queryUsersRecordOnce(
                                queryBuilder: (usersRecord) =>
                                    usersRecord.where(
                                  'uid',
                                  isEqualTo: columnCampaignRecord.creatorId?.id,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              _model.walletId = await queryWalletRecordOnce(
                                queryBuilder: (walletRecord) =>
                                    walletRecord.where(
                                  'seller_id',
                                  isEqualTo: columnCampaignRecord.creatorId,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              if (_model.walletId?.reference == null) {
                                var walletRecordReference =
                                    WalletRecord.collection.doc();
                                await walletRecordReference.set({
                                  ...createWalletRecordData(
                                    walletBalance: _model.transaction?.amount,
                                    sellerId: _model.userQuery?.reference,
                                    createdAt: getCurrentTimestamp,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'traction_id': [
                                        _model.transaction?.reference
                                      ],
                                      'transaction_amount': [
                                        _model.transaction?.amount
                                      ],
                                    },
                                  ),
                                });
                                _model.newwallet =
                                    WalletRecord.getDocumentFromData({
                                  ...createWalletRecordData(
                                    walletBalance: _model.transaction?.amount,
                                    sellerId: _model.userQuery?.reference,
                                    createdAt: getCurrentTimestamp,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'traction_id': [
                                        _model.transaction?.reference
                                      ],
                                      'transaction_amount': [
                                        _model.transaction?.amount
                                      ],
                                    },
                                  ),
                                }, walletRecordReference);

                                await _model.userQuery!.reference
                                    .update(createUsersRecordData(
                                  walletId: _model.newwallet?.reference,
                                ));

                                await columnCampaignRecord.reference
                                    .update(createCampaignRecordData(
                                  amountRaised:
                                      columnCampaignRecord.amountRaised +
                                          _model.transaction!.amount,
                                ));
                              } else {
                                await _model.walletId!.reference.update({
                                  ...createWalletRecordData(
                                    walletBalance:
                                        _model.walletId!.walletBalance +
                                            _model.transaction!.amount,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'traction_id': FieldValue.arrayUnion(
                                          [_model.transaction?.reference]),
                                      'transaction_amount':
                                          FieldValue.arrayUnion(
                                              [_model.transaction?.amount]),
                                    },
                                  ),
                                });

                                await widget!.campaignRef!.update({
                                  ...createCampaignRecordData(
                                    amountRaised:
                                        columnCampaignRecord.amountRaised +
                                            _model.transaction!.amount,
                                    campaignId: '',
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'donor_list': FieldValue.arrayUnion([
                                        getDonorListFirestoreData(
                                          updateDonorListStruct(
                                            DonorListStruct(
                                              userId: currentUserReference,
                                              amount: _model.amount,
                                              createAt: getCurrentTimestamp,
                                            ),
                                            clearUnsetFields: false,
                                          ),
                                          true,
                                        )
                                      ]),
                                    },
                                  ),
                                });
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'An error ocurr can\'t donate at this time...',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                            }

                            Navigator.pop(context);

                            safeSetState(() {});
                          },
                          text: 'Continue',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 65.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 1.0,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ].divide(SizedBox(height: 36.0)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
