import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'monthly_pass_checkin_model.dart';
export 'monthly_pass_checkin_model.dart';

class MonthlyPassCheckinWidget extends StatefulWidget {
  const MonthlyPassCheckinWidget({
    super.key,
    this.shiftDoc,
    this.userRef,
    this.appSetting,
    this.passDetails,
    this.partyDetails,
  });

  final dynamic shiftDoc;
  final DocumentReference? userRef;
  final AppSettingsRecord? appSetting;
  final MonthlyPassRecord? passDetails;
  final PartyRecord? partyDetails;

  @override
  State<MonthlyPassCheckinWidget> createState() =>
      _MonthlyPassCheckinWidgetState();
}

class _MonthlyPassCheckinWidgetState extends State<MonthlyPassCheckinWidget> {
  late MonthlyPassCheckinModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MonthlyPassCheckinModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 50.0, 0.0),
          child: StreamBuilder<List<PartyRecord>>(
            stream: queryPartyRecord(
              parent: FFAppState().outletIdRef,
              queryBuilder: (partyRecord) => partyRecord.where(
                'id',
                isEqualTo: widget!.passDetails?.custRef?.id,
              ),
              singleRecord: true,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: SpinKitFadingCircle(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 40.0,
                    ),
                  ),
                );
              }
              List<PartyRecord> containerPartyRecordList = snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final containerPartyRecord = containerPartyRecordList.isNotEmpty
                  ? containerPartyRecordList.first
                  : null;

              return Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.3,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        3.0,
                        6.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 5.0,
                                      buttonSize: 40.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      icon: Icon(
                                        Icons.clear,
                                        color: Color(0xFFFF5963),
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed(
                                          'ParkingCheckIN',
                                          queryParameters: {
                                            'shiftDoc': serializeParam(
                                              widget!.shiftDoc,
                                              ParamType.JSON,
                                            ),
                                            'userRef': serializeParam(
                                              widget!.userRef,
                                              ParamType.DocumentReference,
                                            ),
                                            'appSetting': serializeParam(
                                              widget!.appSetting,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'appSetting': widget!.appSetting,
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                            ),
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 5.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                containerPartyRecord?.name,
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                containerPartyRecord?.vehicleNo,
                                '0000',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                FFAppState().newcount =
                                    FFAppState().newcount + 1;
                                safeSetState(() {});
                                _model.invoiceParty =
                                    await queryPartyRecordOnce(
                                  parent: FFAppState().outletIdRef,
                                  queryBuilder: (partyRecord) =>
                                      partyRecord.where(
                                    'id',
                                    isEqualTo:
                                        widget!.passDetails?.reference.id,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);

                                var invoiceRecordReference =
                                    InvoiceRecord.createDoc(
                                        FFAppState().outletIdRef!);
                                await invoiceRecordReference
                                    .set(createInvoiceRecordData(
                                  party: _model.invoiceParty?.id,
                                  vechicleNo: _model.invoiceParty?.vehicleNo,
                                  vechicleType:
                                      _model.invoiceParty?.vehicleType,
                                  checkInTime: getCurrentTimestamp
                                      .millisecondsSinceEpoch,
                                  invoiceDate: getCurrentTimestamp
                                      .millisecondsSinceEpoch,
                                  orderType: 'MONTHLYPASS',
                                  checkOutTime: 0,
                                  finalBillAmt: 0.0,
                                  billAmt: 0.0,
                                  dayId: functions.getDayId(),
                                  count: FFAppState().newcount,
                                ));
                                _model.invoice =
                                    InvoiceRecord.getDocumentFromData(
                                        createInvoiceRecordData(
                                          party: _model.invoiceParty?.id,
                                          vechicleNo:
                                              _model.invoiceParty?.vehicleNo,
                                          vechicleType:
                                              _model.invoiceParty?.vehicleType,
                                          checkInTime: getCurrentTimestamp
                                              .millisecondsSinceEpoch,
                                          invoiceDate: getCurrentTimestamp
                                              .millisecondsSinceEpoch,
                                          orderType: 'MONTHLYPASS',
                                          checkOutTime: 0,
                                          finalBillAmt: 0.0,
                                          billAmt: 0.0,
                                          dayId: functions.getDayId(),
                                          count: FFAppState().newcount,
                                        ),
                                        invoiceRecordReference);

                                await _model.invoice!.reference
                                    .update(createInvoiceRecordData(
                                  id: _model.invoice?.reference.id,
                                ));
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content: Text('Check-in Successful !'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                Navigator.pop(context);

                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'e5alyz8v' /* SAVE */,
                              ),
                              options: FFButtonOptions(
                                height: 45.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).info,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ].divide(SizedBox(width: 6.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
