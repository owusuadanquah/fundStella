import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/emptylistplaceholder/emptylistplaceholder_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'users_campaigns_list_screen_model.dart';
export 'users_campaigns_list_screen_model.dart';

class UsersCampaignsListScreenWidget extends StatefulWidget {
  const UsersCampaignsListScreenWidget({super.key});

  @override
  State<UsersCampaignsListScreenWidget> createState() =>
      _UsersCampaignsListScreenWidgetState();
}

class _UsersCampaignsListScreenWidgetState
    extends State<UsersCampaignsListScreenWidget> {
  late UsersCampaignsListScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsersCampaignsListScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                  Text(
                    'My Campaigns',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Nunito Sans',
                          color: Color(0xFF3E3E3E),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              FlutterFlowIconButton(
                borderRadius: 20.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.add,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed('CreateCampaignScreen');
                },
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
          child: StreamBuilder<List<CampaignRecord>>(
            stream: queryCampaignRecord(
              queryBuilder: (campaignRecord) => campaignRecord
                  .where(
                    'creator_id',
                    isEqualTo: currentUserReference,
                  )
                  .orderBy('created_at', descending: true),
            ),
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
              List<CampaignRecord> listViewCampaignRecordList = snapshot.data!;
              if (listViewCampaignRecordList.isEmpty) {
                return Center(
                  child: EmptylistplaceholderWidget(
                    content:
                        'It seems like there are no campaigns here at the moment. Check back later or start creating your own campaign to get started.',
                    maintext: 'No Campaigns Yet!',
                    callback: () async {
                      context.pushNamed('CreateCampaignScreen');
                    },
                  ),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: listViewCampaignRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewCampaignRecord =
                      listViewCampaignRecordList[listViewIndex];
                  return Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: OctoImage(
                                      placeholderBuilder: (_) =>
                                          SizedBox.expand(
                                        child: Image(
                                          image: BlurHashImage(
                                              listViewCampaignRecord.blurHash),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      image: NetworkImage(
                                        valueOrDefault<String>(
                                          listViewCampaignRecord
                                              .campaignImageUrl,
                                          'https://images.unsplash.com/photo-1629652487139-ac8fcc8c5548?w=500&h=500',
                                        ),
                                      ),
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            listViewCampaignRecord.campaignName
                                                .maybeHandleOverflow(
                                              maxChars: 22,
                                              replacement: '…',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 8.0, 4.0, 8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: () {
                                                  if (listViewCampaignRecord
                                                          .status ==
                                                      'Active') {
                                                    return Color(0xFFE8F5E9);
                                                  } else if (listViewCampaignRecord
                                                          .status ==
                                                      'Pending') {
                                                    return Color(0xFFFFE5B4);
                                                  } else {
                                                    return Color(0xFFFFB6B6);
                                                  }
                                                }(),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  listViewCampaignRecord.status,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: () {
                                                          if (listViewCampaignRecord
                                                                  .status ==
                                                              'Active') {
                                                            return Color(
                                                                0xFF2E7D32);
                                                          } else if (listViewCampaignRecord
                                                                  .status ==
                                                              'Pending') {
                                                            return Color(
                                                                0xFFFFA500);
                                                          } else {
                                                            return Color(
                                                                0xFFFF0000);
                                                          }
                                                        }(),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '${formatNumber(
                                          listViewCampaignRecord.amountRaised,
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.automatic,
                                          currency: '\$',
                                        )} of ${formatNumber(
                                          listViewCampaignRecord.targetAmount,
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.automatic,
                                          currency: '\$',
                                        )} raised',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Container(
                                        width: 255.0,
                                        height: 4.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE0E0E0),
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                        ),
                                        child: LinearPercentIndicator(
                                          percent: valueOrDefault<double>(
                                            functions.newCustomFunction(
                                                listViewCampaignRecord
                                                    .targetAmount,
                                                listViewCampaignRecord
                                                    .amountRaised),
                                            0.0,
                                          ),
                                          width: 255.0,
                                          lineHeight: 12.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          backgroundColor: Color(0xFFE8F5E9),
                                          barRadius: Radius.circular(20.0),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ].divide(SizedBox(width: 16.0)),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'campaing_detail',
                                  queryParameters: {
                                    'campaign': serializeParam(
                                      listViewCampaignRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'View Details',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 36.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
