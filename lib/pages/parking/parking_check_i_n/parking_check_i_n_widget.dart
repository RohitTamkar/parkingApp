import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'parking_check_i_n_model.dart';
export 'parking_check_i_n_model.dart';

class ParkingCheckINWidget extends StatefulWidget {
  const ParkingCheckINWidget({
    super.key,
    this.shiftDoc,
    this.userRef,
    this.appSetting,
  });

  final dynamic shiftDoc;
  final DocumentReference? userRef;
  final AppSettingsRecord? appSetting;

  @override
  State<ParkingCheckINWidget> createState() => _ParkingCheckINWidgetState();
}

class _ParkingCheckINWidgetState extends State<ParkingCheckINWidget> {
  late ParkingCheckINModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ParkingCheckINModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!functions.isPrinterSelected(FFAppState().printerDevice)!) {
        _model.resDevice2Copy = await actions.scanPrinter(
          FFAppState().posMode,
        );
      }
      await actions.connectDevice(
        FFAppState().printerDevice,
        FFAppState().printerIndex,
      );
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.advanceAmtTextController ??= TextEditingController();
    _model.advanceAmtFocusNode ??= FocusNode();

    _model.discountAmtTextController ??= TextEditingController();
    _model.discountAmtFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'ParkingCheckIN',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Color(0x2712191C),
              body: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          safeSetState(() {});
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.85,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderRadius: 5.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: Icon(
                                          Icons.settings_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .parkingPrimary,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          context.goNamed(
                                            'PrintersettingCar',
                                            queryParameters: {
                                              'appSetting': serializeParam(
                                                widget!.appSetting,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'appSetting': widget!.appSetting,
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .rightToLeft,
                                              ),
                                            },
                                          );
                                        },
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: Icon(
                                          Icons.camera_alt,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.goNamed(
                                            'NumberPlateScanner',
                                            queryParameters: {
                                              'appSetting': serializeParam(
                                                widget!.appSetting,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'appSetting': widget!.appSetting,
                                            },
                                          );
                                        },
                                      ),
                                      if (false)
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          icon: Icon(
                                            Icons.discount,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            FFAppState().showDiscount = false;
                                            FFAppState().update(() {});
                                          },
                                        ),
                                      if (false)
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          icon: Icon(
                                            Icons.person,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            FFAppState().showDiscount = false;
                                            FFAppState().update(() {});
                                          },
                                        ),
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: Icon(
                                          Icons.qr_code_scanner,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          _model.qrResult =
                                              await FlutterBarcodeScanner
                                                  .scanBarcode(
                                            '#C62828', // scanning line color
                                            FFLocalizations.of(context).getText(
                                              'zqkor18t' /* Cancel */,
                                            ), // cancel button text
                                            true, // whether to show the flash icon
                                            ScanMode.QR,
                                          );

                                          _model.getinvout =
                                              await queryMonthlyPassRecordOnce(
                                            parent: FFAppState().outletIdRef,
                                            queryBuilder: (monthlyPassRecord) =>
                                                monthlyPassRecord.where(
                                              'id',
                                              isEqualTo: _model.qrResult,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          if (getCurrentTimestamp
                                                  .millisecondsSinceEpoch <=
                                              _model.getinvout!.passEndDate) {
                                            FFAppState().newcount =
                                                FFAppState().newcount + 1;
                                            safeSetState(() {});
                                            _model.invoiceParty =
                                                await queryPartyRecordOnce(
                                              parent: FFAppState().outletIdRef,
                                              queryBuilder: (partyRecord) =>
                                                  partyRecord.where(
                                                'id',
                                                isEqualTo: _model
                                                    .getinvout?.custRef?.id,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);

                                            var invoiceRecordReference =
                                                InvoiceRecord.createDoc(
                                                    FFAppState().outletIdRef!);
                                            await invoiceRecordReference
                                                .set(createInvoiceRecordData(
                                              party: _model.invoiceParty?.id,
                                              vechicleNo: _model
                                                  .invoiceParty?.vehicleNo,
                                              vechicleType: _model
                                                  .invoiceParty?.vehicleType,
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
                                            _model.invoice = InvoiceRecord
                                                .getDocumentFromData(
                                                    createInvoiceRecordData(
                                                      party: _model
                                                          .invoiceParty?.id,
                                                      vechicleNo: _model
                                                          .invoiceParty
                                                          ?.vehicleNo,
                                                      vechicleType: _model
                                                          .invoiceParty
                                                          ?.vehicleType,
                                                      checkInTime:
                                                          getCurrentTimestamp
                                                              .millisecondsSinceEpoch,
                                                      invoiceDate:
                                                          getCurrentTimestamp
                                                              .millisecondsSinceEpoch,
                                                      orderType: 'MONTHLYPASS',
                                                      checkOutTime: 0,
                                                      finalBillAmt: 0.0,
                                                      billAmt: 0.0,
                                                      dayId:
                                                          functions.getDayId(),
                                                      count:
                                                          FFAppState().newcount,
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
                                                  content: Text(
                                                      'Check-in Successful !'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            Navigator.pop(context);

                                            context.goNamed(
                                              'VehicleEntry',
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
                                                'appSetting':
                                                    widget!.appSetting,
                                              },
                                            );
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content:
                                                      Text('Pass is expired !'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }

                                          safeSetState(() {});
                                        },
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderRadius: 5.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              icon: Icon(
                                                Icons.clear,
                                                color: Color(0xFFFF5963),
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                context.goNamed(
                                                  'VehicleEntry',
                                                  queryParameters: {
                                                    'shiftDoc': serializeParam(
                                                      widget!.shiftDoc,
                                                      ParamType.JSON,
                                                    ),
                                                    'userRef': serializeParam(
                                                      widget!.userRef,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'appSetting':
                                                        serializeParam(
                                                      widget!.appSetting,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'appSetting':
                                                        widget!.appSetting,
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .rightToLeft,
                                                    ),
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
                                  ),
                                ),
                                if (!FFAppState().showDiscount)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child:
                                              StreamBuilder<List<PartyRecord>>(
                                            stream: queryPartyRecord(
                                              parent: FFAppState().outletIdRef,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    child: SpinKitFadingCircle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<PartyRecord>
                                                  dropDowncustomerPartyRecordList =
                                                  snapshot.data!;

                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .dropDowncustomerValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options:
                                                    dropDowncustomerPartyRecordList
                                                        .map((e) => e.name)
                                                        .toList(),
                                                onChanged: (val) async {
                                                  safeSetState(() => _model
                                                          .dropDowncustomerValue =
                                                      val);
                                                  _model.prd5456 =
                                                      await queryPartyRecordOnce(
                                                    parent: FFAppState()
                                                        .outletIdRef,
                                                    queryBuilder:
                                                        (partyRecord) =>
                                                            partyRecord.where(
                                                      'name',
                                                      isEqualTo: _model
                                                          .dropDowncustomerValue,
                                                    ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                  FFAppState().setCustRef =
                                                      _model.prd5456?.reference;
                                                  FFAppState().isCustListShown =
                                                      true;
                                                  FFAppState().update(() {});
                                                  safeSetState(() {
                                                    _model.textController1
                                                            ?.text =
                                                        _model
                                                            .prd5456!.vehicleNo;
                                                  });
                                                  safeSetState(() {
                                                    _model.dropDownvechicleValueController
                                                            ?.value =
                                                        _model.prd5456!
                                                            .vehicleType;
                                                  });

                                                  safeSetState(() {});
                                                },
                                                width: 300.0,
                                                searchHintTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                searchTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '2ga110kw' /* Customer */,
                                                ),
                                                searchHintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '7iphsy5c' /* Search here... */,
                                                ),
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                borderWidth: 2.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 4.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                isOverButton: true,
                                                isSearchable: true,
                                                isMultiSelect: false,
                                              );
                                            },
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          icon: Icon(
                                            Icons.person_add_alt_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            context.pushNamed('addCustomer1');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child:
                                            StreamBuilder<List<ProductRecord>>(
                                          stream: queryProductRecord(
                                            parent: FFAppState().outletIdRef,
                                            queryBuilder: (productRecord) =>
                                                productRecord.where(
                                              'isDeleted',
                                              isEqualTo: false,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  child: SpinKitFadingCircle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ProductRecord>
                                                dropDownvechicleProductRecordList =
                                                snapshot.data!;

                                            return FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownvechicleValueController ??=
                                                  FormFieldController<String>(
                                                _model.dropDownvechicleValue ??=
                                                    _model.vehicleType,
                                              ),
                                              options:
                                                  dropDownvechicleProductRecordList
                                                      .map((e) => e.name)
                                                      .toList(),
                                              onChanged: (val) async {
                                                safeSetState(() => _model
                                                        .dropDownvechicleValue =
                                                    val);
                                                _model.prd =
                                                    await queryProductRecordOnce(
                                                  parent:
                                                      FFAppState().outletIdRef,
                                                  queryBuilder:
                                                      (productRecord) =>
                                                          productRecord.where(
                                                    'name',
                                                    isEqualTo: _model
                                                        .dropDownvechicleValue,
                                                  ),
                                                  singleRecord: true,
                                                ).then((s) => s.firstOrNull);
                                                FFAppState().parkingCharges =
                                                    0.0;
                                                safeSetState(() {});
                                                FFAppState().parkingCharges =
                                                    valueOrDefault<double>(
                                                  _model.prd?.sellingPrice,
                                                  0.0,
                                                );
                                                safeSetState(() {});

                                                safeSetState(() {});
                                              },
                                              width: 300.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'y3wrbbhj' /* Vehicle Type */,
                                              ),
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isOverButton: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Stack(
                                  children: [
                                    if (FFAppState().showNumber)
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: TextFormField(
                                            controller: _model.textController1,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.characters,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'yg371ws7' /* Vehicle Number */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent3,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily,
                                                  letterSpacing: 1.5,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmallFamily),
                                                ),
                                            textAlign: TextAlign.center,
                                            maxLength: 10,
                                            maxLengthEnforcement:
                                                MaxLengthEnforcement.enforced,
                                            buildCounter: (context,
                                                    {required currentLength,
                                                    required isFocused,
                                                    maxLength}) =>
                                                null,
                                            validator: _model
                                                .textController1Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    if (!FFAppState().showNumber)
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.06,
                                        decoration: BoxDecoration(),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            safeSetState(() {
                                              _model.textController1?.text =
                                                  FFAppState().resultText;
                                            });
                                            FFAppState().showNumber = true;
                                            safeSetState(() {});
                                          },
                                          child: Text(
                                            FFAppState().resultText,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                if (widget!.appSetting?.settingList
                                        ?.where((e) =>
                                            e.title == 'enablePaymentMode')
                                        .toList()
                                        ?.firstOrNull
                                        ?.value ??
                                    true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: StreamBuilder<
                                              List<PaymentModeRecord>>(
                                            stream: queryPaymentModeRecord(),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    child: SpinKitFadingCircle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<PaymentModeRecord>
                                                  dropDownPaymentModePaymentModeRecordList =
                                                  snapshot.data!;

                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .dropDownPaymentModeValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options:
                                                    dropDownPaymentModePaymentModeRecordList
                                                        .map((e) => e.name)
                                                        .toList(),
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                            .dropDownPaymentModeValue =
                                                        val),
                                                width: 300.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily),
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'iwj46d94' /* Payment Mode */,
                                                ),
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                borderWidth: 2.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 4.0, 5.0, 4.0),
                                                hidesUnderline: true,
                                                isOverButton: true,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (false)
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 30.0),
                                          child: TextFormField(
                                            controller:
                                                _model.advanceAmtTextController,
                                            focusNode:
                                                _model.advanceAmtFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'acc6fkb9' /* Advance Amount */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent3,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily,
                                                  letterSpacing: 1.5,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumFamily),
                                                ),
                                            textAlign: TextAlign.center,
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            validator: _model
                                                .advanceAmtTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                if (false)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 30.0),
                                          child: TextFormField(
                                            controller: _model
                                                .discountAmtTextController,
                                            focusNode:
                                                _model.discountAmtFocusNode,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '9bo31vnp' /* Discount  Amount */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent3,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 15.0,
                                                  letterSpacing: 1.5,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                            textAlign: TextAlign.start,
                                            validator: _model
                                                .discountAmtTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        var _shouldSetState = false;
                                        if ((_model.textController1.text !=
                                                    null &&
                                                _model.textController1.text !=
                                                    '') &&
                                            (_model.dropDownvechicleValue !=
                                                    null &&
                                                _model.dropDownvechicleValue !=
                                                    '')) {
                                          _model.countdatagetPRINT =
                                              await queryInvoiceRecordOnce(
                                            parent: FFAppState().outletIdRef,
                                            queryBuilder: (invoiceRecord) =>
                                                invoiceRecord.orderBy(
                                                    'invoiceDate',
                                                    descending: true),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          _shouldSetState = true;
                                          if (_model.countdatagetPRINT !=
                                              null) {
                                            FFAppState().newcount =
                                                _model.countdatagetPRINT!.count;
                                            safeSetState(() {});
                                          } else {
                                            FFAppState().newcount = 0;
                                            safeSetState(() {});
                                          }

                                          FFAppState().count =
                                              valueOrDefault<int>(
                                            _model.countdatagetPRINT?.count,
                                            1,
                                          );
                                          safeSetState(() {});
                                          if (getJsonField(
                                            widget!.shiftDoc,
                                            r'''$.shiftExists''',
                                          )) {
                                            FFAppState().count =
                                                FFAppState().count + 1;
                                            FFAppState().newcount =
                                                FFAppState().newcount + 1;
                                            FFAppState().billcount =
                                                FFAppState().billcount + 1;
                                            safeSetState(() {});
                                          } else {
                                            FFAppState().count =
                                                FFAppState().count + 1;
                                            FFAppState().newcount =
                                                FFAppState().newcount + 1;
                                            FFAppState().billcount =
                                                FFAppState().billcount + 1;
                                            safeSetState(() {});
                                          }

                                          FFAppState()
                                              .addToListCars(SelItemListStruct(
                                            name: functions.toCapitalLetter(
                                                _model.textController1.text),
                                            price: FFAppState().parkingCharges,
                                            categoryP:
                                                _model.dropDowncustomerValue,
                                          ));
                                          safeSetState(() {});

                                          var invoiceRecordReference =
                                              InvoiceRecord.createDoc(
                                                  FFAppState().outletIdRef!);
                                          await invoiceRecordReference.set({
                                            ...createInvoiceRecordData(
                                              invoice: functions.genInvoiceNum(
                                                  FFAppState().newcount,
                                                  FFAppState().shiftCount),
                                              invoiceDate:
                                                  functions.timestampToMili(
                                                      getCurrentTimestamp),
                                              dayId: functions.getDayId(),
                                              paymentMode: _model
                                                  .dropDownPaymentModeValue,
                                              discountAmt: double.tryParse(
                                                  _model
                                                      .discountAmtTextController
                                                      .text),
                                              discountPer:
                                                  valueOrDefault<double>(
                                                FFAppState().disPer,
                                                0.0,
                                              ),
                                              taxAmt: 0.0,
                                              billAmt: widget!
                                                      .appSetting!.settingList
                                                      .where((e) =>
                                                          e.title ==
                                                          'parkingChargeZero')
                                                      .toList()
                                                      .firstOrNull!
                                                      .value
                                                  ? 0.0
                                                  : FFAppState().parkingCharges,
                                              finalBillAmt: widget!
                                                      .appSetting!.settingList
                                                      .where((e) =>
                                                          e.title ==
                                                          'parkingChargeZero')
                                                      .toList()
                                                      .firstOrNull!
                                                      .value
                                                  ? 0.0
                                                  : FFAppState().parkingCharges,
                                              roundOff: 0.0,
                                              shiftId: getJsonField(
                                                widget!.shiftDoc,
                                                r'''$.shiftId''',
                                              ).toString(),
                                              vechicleNo: functions
                                                  .toCapitalLetter(_model
                                                      .textController1.text),
                                              checkInTime: valueOrDefault<int>(
                                                getCurrentTimestamp
                                                    .millisecondsSinceEpoch,
                                                0,
                                              ),
                                              advancePaid: double.tryParse(
                                                  _model
                                                      .advanceAmtTextController
                                                      .text),
                                              vechicleType:
                                                  _model.dropDownvechicleValue,
                                              count: FFAppState().newcount,
                                              checkOutTime: 0,
                                              checkInTerminal:
                                                  FFAppState().terminalNo,
                                              checkOutTerminal: '0',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'productList':
                                                    getSelItemListListFirestoreData(
                                                  FFAppState().listCars,
                                                ),
                                              },
                                            ),
                                          });
                                          _model.docInvoicecars = InvoiceRecord
                                              .getDocumentFromData({
                                            ...createInvoiceRecordData(
                                              invoice: functions.genInvoiceNum(
                                                  FFAppState().newcount,
                                                  FFAppState().shiftCount),
                                              invoiceDate:
                                                  functions.timestampToMili(
                                                      getCurrentTimestamp),
                                              dayId: functions.getDayId(),
                                              paymentMode: _model
                                                  .dropDownPaymentModeValue,
                                              discountAmt: double.tryParse(
                                                  _model
                                                      .discountAmtTextController
                                                      .text),
                                              discountPer:
                                                  valueOrDefault<double>(
                                                FFAppState().disPer,
                                                0.0,
                                              ),
                                              taxAmt: 0.0,
                                              billAmt: widget!
                                                      .appSetting!.settingList
                                                      .where((e) =>
                                                          e.title ==
                                                          'parkingChargeZero')
                                                      .toList()
                                                      .firstOrNull!
                                                      .value
                                                  ? 0.0
                                                  : FFAppState().parkingCharges,
                                              finalBillAmt: widget!
                                                      .appSetting!.settingList
                                                      .where((e) =>
                                                          e.title ==
                                                          'parkingChargeZero')
                                                      .toList()
                                                      .firstOrNull!
                                                      .value
                                                  ? 0.0
                                                  : FFAppState().parkingCharges,
                                              roundOff: 0.0,
                                              shiftId: getJsonField(
                                                widget!.shiftDoc,
                                                r'''$.shiftId''',
                                              ).toString(),
                                              vechicleNo: functions
                                                  .toCapitalLetter(_model
                                                      .textController1.text),
                                              checkInTime: valueOrDefault<int>(
                                                getCurrentTimestamp
                                                    .millisecondsSinceEpoch,
                                                0,
                                              ),
                                              advancePaid: double.tryParse(
                                                  _model
                                                      .advanceAmtTextController
                                                      .text),
                                              vechicleType:
                                                  _model.dropDownvechicleValue,
                                              count: FFAppState().newcount,
                                              checkOutTime: 0,
                                              checkInTerminal:
                                                  FFAppState().terminalNo,
                                              checkOutTerminal: '0',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'productList':
                                                    getSelItemListListFirestoreData(
                                                  FFAppState().listCars,
                                                ),
                                              },
                                            ),
                                          }, invoiceRecordReference);
                                          _shouldSetState = true;

                                          await _model.docInvoicecars!.reference
                                              .update(createInvoiceRecordData(
                                            id: _model
                                                .docInvoicecars?.reference.id,
                                          ));
                                          if (getJsonField(
                                            widget!.shiftDoc,
                                            r'''$.shiftExists''',
                                          )) {
                                            _model.shiftSummarRkiosk =
                                                await actions.calShiftSummary(
                                              _model.docInvoicecars!,
                                              widget!.shiftDoc!,
                                            );
                                            _shouldSetState = true;
                                            _model.shiftref =
                                                await queryShiftRecordOnce(
                                              parent: FFAppState().outletIdRef,
                                              queryBuilder: (shiftRecord) =>
                                                  shiftRecord.where(
                                                'shiftId',
                                                isEqualTo:
                                                    valueOrDefault<String>(
                                                  getJsonField(
                                                    _model.shiftSummarRkiosk,
                                                    r'''$.shiftId''',
                                                  )?.toString(),
                                                  '0',
                                                ),
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _shouldSetState = true;

                                            await _model.shiftref!.reference
                                                .update(createShiftRecordData(
                                              billCount: valueOrDefault<int>(
                                                FFAppState().billcount,
                                                0,
                                              ),
                                              totalSale: valueOrDefault<double>(
                                                getJsonField(
                                                  _model.shiftSummarRkiosk,
                                                  r'''$.totalSale''',
                                                ),
                                                0.0,
                                              ),
                                              deliveryCharges:
                                                  valueOrDefault<double>(
                                                getJsonField(
                                                  _model.shiftSummarRkiosk,
                                                  r'''$.deliveryCharges''',
                                                ),
                                                0.0,
                                              ),
                                              lastBillNo:
                                                  valueOrDefault<String>(
                                                getJsonField(
                                                  _model.shiftSummarRkiosk,
                                                  r'''$.lastBillNo''',
                                                )?.toString(),
                                                '0',
                                              ),
                                              discount: getJsonField(
                                                _model.shiftSummarRkiosk,
                                                r'''$.discount''',
                                              ),
                                              lastBillTime:
                                                  functions.timestampToMili(
                                                      getCurrentTimestamp),
                                              cashSale: valueOrDefault<double>(
                                                getJsonField(
                                                  _model.shiftSummarRkiosk,
                                                  r'''$.cashSale''',
                                                ),
                                                0.0,
                                              ),
                                              paymentJson:
                                                  valueOrDefault<String>(
                                                getJsonField(
                                                  _model.shiftSummarRkiosk,
                                                  r'''$.paymentJson''',
                                                )?.toString(),
                                                '0',
                                              ),
                                            ));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Login again to start Shift ',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0x00000000),
                                              ),
                                            );
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }

                                          if (!functions.isPrinterSelected(
                                              FFAppState().printerDevice)!) {
                                            _model.resDevice2 =
                                                await actions.scanPrinter(
                                              FFAppState().posMode,
                                            );
                                            _shouldSetState = true;
                                          }
                                          await actions.connectDevice(
                                            FFAppState().printerDevice,
                                            FFAppState().printerIndex,
                                          );
                                          if (FFAppState().printerName !=
                                                  null &&
                                              FFAppState().printerName != '') {
                                            FFAppState().lastBill =
                                                FFAppState().finalAmt;
                                            FFAppState().update(() {});
                                            _model.returnedList2kiosk =
                                                await actions.selectBillPrint(
                                              FFAppState().selBill.toString(),
                                              FFAppState()
                                                  .allBillsList
                                                  .toList(),
                                            );
                                            _shouldSetState = true;
                                            _model.device =
                                                await actions.newCustomAction(
                                              FFAppState().printerIndex,
                                            );
                                            _shouldSetState = true;
                                            _model.outletdoc =
                                                await queryOutletRecordOnce(
                                              queryBuilder: (outletRecord) =>
                                                  outletRecord.where(
                                                'id',
                                                isEqualTo: FFAppState()
                                                    .outletIdRef
                                                    ?.id,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _shouldSetState = true;
                                            await actions.printBillParking(
                                              _model.device!.toList(),
                                              FFAppState().isPrinterConnected,
                                              FFAppState().printerName,
                                              getJsonField(
                                                functions.outletDocToJson(
                                                    _model.outletdoc!),
                                                r'''$''',
                                              ),
                                              _model.docInvoicecars!,
                                              FFAppState().paperSize,
                                            );
                                            await actions.removeFromAllBillList(
                                              FFAppState().selBill,
                                            );
                                            await actions.clearValue();
                                            FFAppState().subTotal = 0.0;
                                            FFAppState().listCars = [];
                                            FFAppState().update(() {});
                                            FFAppState().finalAmt = 0.0;
                                            FFAppState().billAmt = 0.0;
                                            FFAppState().count =
                                                FFAppState().count;
                                            FFAppState().cartItem = [];
                                            FFAppState().shiftDetailsNEw =
                                                _model.shiftSummarRkiosk!;
                                            FFAppState().update(() {});
                                            safeSetState(() {
                                              _model.textController1?.clear();
                                            });
                                            safeSetState(() {
                                              _model
                                                  .dropDownvechicleValueController
                                                  ?.value = _model.vehicleType!;
                                            });
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'printer connection'),
                                                  content: Text(
                                                      'printer not connected'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text(
                                                    'Add Vechicle No & Vehicle Type'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'vhfst6ta' /* PRINT */,
                                      ),
                                      icon: Icon(
                                        Icons.print_outlined,
                                        size: 18.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 45.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .parkingSecondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        var _shouldSetState = false;
                                        if ((_model.textController1.text !=
                                                    null &&
                                                _model.textController1.text !=
                                                    '') &&
                                            (_model.dropDownvechicleValue !=
                                                    null &&
                                                _model.dropDownvechicleValue !=
                                                    '')) {
                                          _model.countdataget =
                                              await queryInvoiceRecordOnce(
                                            parent: FFAppState().outletIdRef,
                                            queryBuilder: (invoiceRecord) =>
                                                invoiceRecord.orderBy(
                                                    'invoiceDate',
                                                    descending: true),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          _shouldSetState = true;
                                          if (_model.countdataget != null) {
                                            FFAppState().newcount =
                                                _model.countdataget!.count;
                                            safeSetState(() {});
                                          } else {
                                            FFAppState().newcount = 0;
                                            safeSetState(() {});
                                          }

                                          FFAppState().count =
                                              _model.countdataget!.count;
                                          safeSetState(() {});
                                          if (getJsonField(
                                            widget!.shiftDoc,
                                            r'''$.shiftExists''',
                                          )) {
                                            FFAppState().count =
                                                FFAppState().count + 1;
                                            FFAppState().newcount =
                                                FFAppState().newcount + 1;
                                            FFAppState().billcount =
                                                FFAppState().billcount + 1;
                                            safeSetState(() {});
                                          } else {
                                            FFAppState().count =
                                                FFAppState().count + 1;
                                            FFAppState().newcount =
                                                FFAppState().newcount + 1;
                                            FFAppState().billcount =
                                                FFAppState().billcount + 1;
                                            safeSetState(() {});
                                          }

                                          FFAppState()
                                              .addToListCars(SelItemListStruct(
                                            name: functions.toCapitalLetter(
                                                _model.textController1.text),
                                            price: FFAppState().parkingCharges,
                                            categoryP:
                                                _model.dropDowncustomerValue,
                                          ));
                                          safeSetState(() {});

                                          var invoiceRecordReference =
                                              InvoiceRecord.createDoc(
                                                  FFAppState().outletIdRef!);
                                          await invoiceRecordReference.set({
                                            ...createInvoiceRecordData(
                                              invoice: functions.genInvoiceNum(
                                                  FFAppState().newcount,
                                                  FFAppState().shiftCount),
                                              invoiceDate:
                                                  functions.timestampToMili(
                                                      getCurrentTimestamp),
                                              dayId: functions.getDayId(),
                                              paymentMode: _model
                                                  .dropDownPaymentModeValue,
                                              discountAmt: double.tryParse(
                                                  _model
                                                      .discountAmtTextController
                                                      .text),
                                              discountPer:
                                                  valueOrDefault<double>(
                                                FFAppState().disPer,
                                                0.0,
                                              ),
                                              taxAmt: 0.0,
                                              billAmt: widget!
                                                      .appSetting!.settingList
                                                      .where((e) =>
                                                          e.title ==
                                                          'parkingChargeZero')
                                                      .toList()
                                                      .firstOrNull!
                                                      .value
                                                  ? 0.0
                                                  : FFAppState().parkingCharges,
                                              finalBillAmt: widget!
                                                      .appSetting!.settingList
                                                      .where((e) =>
                                                          e.title ==
                                                          'parkingChargeZero')
                                                      .toList()
                                                      .firstOrNull!
                                                      .value
                                                  ? 0.0
                                                  : FFAppState().parkingCharges,
                                              roundOff: 0.0,
                                              shiftId: getJsonField(
                                                widget!.shiftDoc,
                                                r'''$.shiftId''',
                                              ).toString(),
                                              vechicleNo: functions
                                                  .toCapitalLetter(_model
                                                      .textController1.text),
                                              checkInTime: valueOrDefault<int>(
                                                getCurrentTimestamp
                                                    .millisecondsSinceEpoch,
                                                0,
                                              ),
                                              advancePaid: double.tryParse(
                                                  _model
                                                      .advanceAmtTextController
                                                      .text),
                                              vechicleType:
                                                  _model.dropDownvechicleValue,
                                              count: FFAppState().newcount,
                                              checkOutTime: 0,
                                              checkInTerminal:
                                                  FFAppState().terminalNo,
                                              checkOutTerminal: '0',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'productList':
                                                    getSelItemListListFirestoreData(
                                                  FFAppState().listCars,
                                                ),
                                              },
                                            ),
                                          });
                                          _model.docInvoicecars2 = InvoiceRecord
                                              .getDocumentFromData({
                                            ...createInvoiceRecordData(
                                              invoice: functions.genInvoiceNum(
                                                  FFAppState().newcount,
                                                  FFAppState().shiftCount),
                                              invoiceDate:
                                                  functions.timestampToMili(
                                                      getCurrentTimestamp),
                                              dayId: functions.getDayId(),
                                              paymentMode: _model
                                                  .dropDownPaymentModeValue,
                                              discountAmt: double.tryParse(
                                                  _model
                                                      .discountAmtTextController
                                                      .text),
                                              discountPer:
                                                  valueOrDefault<double>(
                                                FFAppState().disPer,
                                                0.0,
                                              ),
                                              taxAmt: 0.0,
                                              billAmt: widget!
                                                      .appSetting!.settingList
                                                      .where((e) =>
                                                          e.title ==
                                                          'parkingChargeZero')
                                                      .toList()
                                                      .firstOrNull!
                                                      .value
                                                  ? 0.0
                                                  : FFAppState().parkingCharges,
                                              finalBillAmt: widget!
                                                      .appSetting!.settingList
                                                      .where((e) =>
                                                          e.title ==
                                                          'parkingChargeZero')
                                                      .toList()
                                                      .firstOrNull!
                                                      .value
                                                  ? 0.0
                                                  : FFAppState().parkingCharges,
                                              roundOff: 0.0,
                                              shiftId: getJsonField(
                                                widget!.shiftDoc,
                                                r'''$.shiftId''',
                                              ).toString(),
                                              vechicleNo: functions
                                                  .toCapitalLetter(_model
                                                      .textController1.text),
                                              checkInTime: valueOrDefault<int>(
                                                getCurrentTimestamp
                                                    .millisecondsSinceEpoch,
                                                0,
                                              ),
                                              advancePaid: double.tryParse(
                                                  _model
                                                      .advanceAmtTextController
                                                      .text),
                                              vechicleType:
                                                  _model.dropDownvechicleValue,
                                              count: FFAppState().newcount,
                                              checkOutTime: 0,
                                              checkInTerminal:
                                                  FFAppState().terminalNo,
                                              checkOutTerminal: '0',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'productList':
                                                    getSelItemListListFirestoreData(
                                                  FFAppState().listCars,
                                                ),
                                              },
                                            ),
                                          }, invoiceRecordReference);
                                          _shouldSetState = true;

                                          await _model
                                              .docInvoicecars2!.reference
                                              .update(createInvoiceRecordData(
                                            id: _model
                                                .docInvoicecars2?.reference.id,
                                          ));
                                          if (getJsonField(
                                            widget!.shiftDoc,
                                            r'''$.shiftExists''',
                                          )) {
                                            _model.shiftSummarRkiosk2 =
                                                await actions.calShiftSummary(
                                              _model.docInvoicecars2!,
                                              widget!.shiftDoc!,
                                            );
                                            _shouldSetState = true;
                                            _model.shiftref2 =
                                                await queryShiftRecordOnce(
                                              parent: FFAppState().outletIdRef,
                                              queryBuilder: (shiftRecord) =>
                                                  shiftRecord.where(
                                                'shiftId',
                                                isEqualTo: getJsonField(
                                                  _model.shiftSummarRkiosk2,
                                                  r'''$.shiftId''',
                                                ).toString(),
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _shouldSetState = true;

                                            await _model.shiftref2!.reference
                                                .update(createShiftRecordData(
                                              billCount: valueOrDefault<int>(
                                                FFAppState().billcount,
                                                0,
                                              ),
                                              totalSale: getJsonField(
                                                _model.shiftSummarRkiosk2,
                                                r'''$.totalSale''',
                                              ),
                                              deliveryCharges: getJsonField(
                                                _model.shiftSummarRkiosk2,
                                                r'''$.deliveryCharges''',
                                              ),
                                              lastBillNo: getJsonField(
                                                _model.shiftSummarRkiosk2,
                                                r'''$.lastBillNo''',
                                              ).toString(),
                                              discount: getJsonField(
                                                _model.shiftSummarRkiosk,
                                                r'''$.discount''',
                                              ),
                                              lastBillTime:
                                                  functions.timestampToMili(
                                                      getCurrentTimestamp),
                                              cashSale: getJsonField(
                                                _model.shiftSummarRkiosk2,
                                                r'''$.cashSale''',
                                              ),
                                              paymentJson: getJsonField(
                                                _model.shiftSummarRkiosk2,
                                                r'''$.paymentJson''',
                                              ).toString(),
                                            ));
                                            await actions.removeFromAllBillList(
                                              FFAppState().selBill,
                                            );
                                            await actions.clearValue();
                                            FFAppState().subTotal = 0.0;
                                            FFAppState().listCars = [];
                                            FFAppState().update(() {});
                                            FFAppState().finalAmt = 0.0;
                                            FFAppState().billAmt = 0.0;
                                            FFAppState().count =
                                                FFAppState().count;
                                            FFAppState().cartItem = [];
                                            FFAppState().shiftDetailsNEw =
                                                _model.shiftSummarRkiosk2!;
                                            FFAppState().update(() {});
                                            safeSetState(() {
                                              _model.textController1?.clear();
                                            });
                                            safeSetState(() {
                                              _model
                                                  .dropDownvechicleValueController
                                                  ?.value = _model.vehicleType!;
                                            });
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Login again to start Shift ',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0x00000000),
                                              ),
                                            );
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text(
                                                    'Add Vechicle No & Vehicle Type'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '22edrqc0' /* SAVE */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 45.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 6.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
