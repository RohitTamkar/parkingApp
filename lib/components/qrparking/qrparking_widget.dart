import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/payment_mode/payment_mode_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'qrparking_model.dart';
export 'qrparking_model.dart';

class QrparkingWidget extends StatefulWidget {
  const QrparkingWidget({
    super.key,
    this.usrref,
    this.invdoc,
    required this.shiftdoc,
    this.settings,
    this.productDoc,
  });

  final DocumentReference? usrref;
  final InvoiceRecord? invdoc;
  final dynamic shiftdoc;
  final AppSettingsRecord? settings;
  final ProductRecord? productDoc;

  @override
  State<QrparkingWidget> createState() => _QrparkingWidgetState();
}

class _QrparkingWidgetState extends State<QrparkingWidget> {
  late QrparkingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QrparkingModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.95,
              height: MediaQuery.sizeOf(context).height * 0.5,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 35.0,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget!.invdoc?.vechicleNo,
                          '0000',
                        ),
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineSmallFamily,
                                  fontSize: 26.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineSmallFamily),
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                      child: Text(
                        '${functions.calculateHour(widget!.invdoc?.checkInTime, getCurrentTimestamp.millisecondsSinceEpoch).toString()}Hr',
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineLargeFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineLargeFamily),
                                ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'jq2zdpw8' /* Final Cost */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineSmallFamily,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily),
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 3.0, 0.0),
                                child: Text(
                                  '₹ ${widget!.invdoc?.orderType == 'MONTHLYPASS' ? '0' : valueOrDefault<String>(
                                      functions
                                          .calculateRemainingAmount(
                                              widget!.settings!.settingList
                                                      .where((e) =>
                                                          e.title ==
                                                          'calculateHourlyCharges')
                                                      .toList()
                                                      .firstOrNull!
                                                      .value
                                                  ? functions
                                                      .calculateParkingCharges2(
                                                          widget!.invdoc
                                                              ?.vechicleType,
                                                          widget!.invdoc
                                                              ?.checkInTime,
                                                          getCurrentTimestamp
                                                              .millisecondsSinceEpoch,
                                                          VehicleBillStruct(
                                                            baseRate: widget!
                                                                .productDoc
                                                                ?.parkingCharges
                                                                ?.baseRate,
                                                            baseDuration: widget!
                                                                .productDoc
                                                                ?.parkingCharges
                                                                ?.baseDuration,
                                                            hourlyRate: widget!
                                                                .productDoc
                                                                ?.parkingCharges
                                                                ?.hourlyRate,
                                                            freeMinutes: widget!
                                                                .productDoc
                                                                ?.parkingCharges
                                                                ?.freeMinutes,
                                                          ))
                                                  : functions.calculateParkingCharges12hours(
                                                      widget!
                                                          .invdoc?.vechicleType,
                                                      widget!
                                                          .invdoc?.checkInTime,
                                                      getCurrentTimestamp
                                                          .millisecondsSinceEpoch),
                                              widget!.invdoc?.advancePaid)
                                          .toString(),
                                      '1',
                                    )}',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .displayMediumFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .displayMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (false)
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 3.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '0rqgotkq' /* Remaining Cost */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily),
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 3.0, 0.0),
                                  child: Text(
                                    '₹ ${functions.calRemainingamount(functions.calculateParkingCharges(widget!.invdoc?.billAmt, widget!.invdoc?.checkInTime, getCurrentTimestamp.millisecondsSinceEpoch), widget!.invdoc?.advancePaid, widget!.invdoc?.discountAmt).toString()}',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .displayMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .displayMediumFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .displayMediumFamily),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    if (widget!.settings?.settingList
                            ?.where((e) => e.title == 'enablePaymentMode')
                            .toList()
                            ?.firstOrNull
                            ?.value ??
                        true)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StreamBuilder<List<PaymentModeRecord>>(
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
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              List<PaymentModeRecord>
                                  paymentModePaymentModeRecordList =
                                  snapshot.data!;

                              return wrapWithModel(
                                model: _model.paymentModeModel,
                                updateCallback: () => safeSetState(() {}),
                                child: PaymentModeWidget(),
                              );
                            },
                          ),
                        ],
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            var _shouldSetState = false;
                            if (widget!.invdoc?.orderType == 'MONTHLYPASS') {
                              await widget!.invdoc!.reference
                                  .update(createInvoiceRecordData(
                                checkOutTime:
                                    getCurrentTimestamp.millisecondsSinceEpoch,
                                billAmt: 0.0,
                                finalBillAmt: 0.0,
                                duration: valueOrDefault<double>(
                                  functions.calculateHour(
                                      widget!.invdoc?.checkInTime,
                                      getCurrentTimestamp
                                          .millisecondsSinceEpoch),
                                  0.0,
                                ),
                                checkOutTerminal: FFAppState().terminalNo,
                              ));
                              _model.docinvqr = await queryInvoiceRecordOnce(
                                parent: FFAppState().outletIdRef,
                                queryBuilder: (invoiceRecord) =>
                                    invoiceRecord.where(
                                  'id',
                                  isEqualTo: widget!.invdoc?.id,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              _shouldSetState = true;
                              if (!functions.isPrinterSelected(
                                  FFAppState().printerDevice)!) {
                                _model.resDevice2qr = await actions.scanPrinter(
                                  FFAppState().posMode,
                                );
                                _shouldSetState = true;
                              }
                              _model.connectdeviceqr =
                                  await actions.connectDevice(
                                FFAppState().printerDevice,
                                FFAppState().printerIndex,
                              );
                              _shouldSetState = true;
                              if (FFAppState().printerName != null &&
                                  FFAppState().printerName != '') {
                                _model.returnedList2qr2 =
                                    await actions.selectBillPrint(
                                  FFAppState().selBill.toString(),
                                  FFAppState().allBillsList.toList(),
                                );
                                _shouldSetState = true;
                                _model.deviceqr = await actions.newCustomAction(
                                  FFAppState().printerIndex,
                                );
                                _shouldSetState = true;
                                _model.outletdocqr =
                                    await queryOutletRecordOnce(
                                  queryBuilder: (outletRecord) =>
                                      outletRecord.where(
                                    'id',
                                    isEqualTo: FFAppState().outletIdRef?.id,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                _shouldSetState = true;
                                await actions.printBillParking(
                                  _model.deviceqr!.toList(),
                                  FFAppState().isPrinterConnected,
                                  FFAppState().printerName,
                                  getJsonField(
                                    functions
                                        .outletDocToJson(_model.outletdocqr!),
                                    r'''$''',
                                  ),
                                  _model.docinvqr!,
                                  FFAppState().paperSize,
                                );
                                await actions.removeFromAllBillList(
                                  FFAppState().selBill,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Check Out SuccessFull!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                                Navigator.pop(context);

                                context.goNamed(
                                  'VehicleEntry',
                                  queryParameters: {
                                    'shiftDoc': serializeParam(
                                      widget!.shiftdoc,
                                      ParamType.JSON,
                                    ),
                                    'userRef': serializeParam(
                                      widget!.usrref,
                                      ParamType.DocumentReference,
                                    ),
                                    'appSetting': serializeParam(
                                      widget!.settings,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'appSetting': widget!.settings,
                                  },
                                );

                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('printer connection'),
                                      content: Text('printer not connected'),
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
                              }
                            } else {
                              await widget!.invdoc!.reference
                                  .update(createInvoiceRecordData(
                                checkOutTime:
                                    getCurrentTimestamp.millisecondsSinceEpoch,
                                billAmt: widget!.settings!.settingList
                                        .where((e) =>
                                            e.title == 'calculateHourlyCharges')
                                        .toList()
                                        .firstOrNull!
                                        .value
                                    ? functions.calculateParkingCharges2(
                                        widget!.invdoc?.vechicleType,
                                        widget!.invdoc?.checkInTime,
                                        getCurrentTimestamp
                                            .millisecondsSinceEpoch,
                                        VehicleBillStruct(
                                          baseRate: widget!.productDoc
                                              ?.parkingCharges?.baseRate,
                                          baseDuration: widget!.productDoc
                                              ?.parkingCharges?.baseDuration,
                                          hourlyRate: widget!.productDoc
                                              ?.parkingCharges?.hourlyRate,
                                          freeMinutes: widget!.productDoc
                                              ?.parkingCharges?.freeMinutes,
                                        ))
                                    : functions.calculateParkingCharges12hours(
                                        widget!.invdoc?.vechicleType,
                                        widget!.invdoc?.checkInTime,
                                        getCurrentTimestamp
                                            .millisecondsSinceEpoch),
                                finalBillAmt: widget!.settings!.settingList
                                        .where((e) =>
                                            e.title == 'calculateHourlyCharges')
                                        .toList()
                                        .firstOrNull!
                                        .value
                                    ? functions.calculateParkingCharges2(
                                        widget!.invdoc?.vechicleType,
                                        widget!.invdoc?.checkInTime,
                                        getCurrentTimestamp
                                            .millisecondsSinceEpoch,
                                        VehicleBillStruct(
                                          baseRate: widget!.productDoc
                                              ?.parkingCharges?.baseRate,
                                          baseDuration: widget!.productDoc
                                              ?.parkingCharges?.baseDuration,
                                          hourlyRate: widget!.productDoc
                                              ?.parkingCharges?.hourlyRate,
                                          freeMinutes: widget!.productDoc
                                              ?.parkingCharges?.freeMinutes,
                                        ))
                                    : functions.calculateParkingCharges12hours(
                                        widget!.invdoc?.vechicleType,
                                        widget!.invdoc?.checkInTime,
                                        getCurrentTimestamp
                                            .millisecondsSinceEpoch),
                                duration: valueOrDefault<double>(
                                  functions.calculateHour(
                                      widget!.invdoc?.checkInTime,
                                      getCurrentTimestamp
                                          .millisecondsSinceEpoch),
                                  0.0,
                                ),
                                checkOutTerminal: FFAppState().terminalNo,
                              ));
                              _model.docinvqr2 = await queryInvoiceRecordOnce(
                                parent: FFAppState().outletIdRef,
                                queryBuilder: (invoiceRecord) =>
                                    invoiceRecord.where(
                                  'id',
                                  isEqualTo: widget!.invdoc?.id,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              _shouldSetState = true;
                              if (getJsonField(
                                widget!.shiftdoc,
                                r'''$.shiftExists''',
                              )) {
                                if (widget!.settings!.settingList
                                    .where(
                                        (e) => e.title == 'enablePaymentMode')
                                    .toList()
                                    .firstOrNull!
                                    .value) {
                                  if (_model.paymentModeModel.dropDownValue ==
                                      'COMPLEMENTARY') {
                                    _model.shiftfierbase =
                                        await queryShiftRecordOnce(
                                      parent: FFAppState().outletIdRef,
                                      queryBuilder: (shiftRecord) =>
                                          shiftRecord.where(
                                        'shiftId',
                                        isEqualTo: widget!.invdoc?.shiftId,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    _shouldSetState = true;
                                    _model.shiftDetailsNewcar =
                                        await actions.shiftDetailNewpark2(
                                      _model.shiftfierbase,
                                    );
                                    _shouldSetState = true;
                                    _model.shiftSummarRkiosk23 =
                                        await actions.calShiftSummary2(
                                      widget!.invdoc!,
                                      _model.shiftDetailsNewcar!,
                                      widget!.invdoc!.finalBillAmt,
                                      _model.paymentModeModel.dropDownValue!,
                                    );
                                    _shouldSetState = true;

                                    await _model.shiftfierbase!.reference
                                        .update(createShiftRecordData(
                                      billCount: valueOrDefault<int>(
                                        FFAppState().billcount,
                                        0,
                                      ),
                                      totalSale: getJsonField(
                                        _model.shiftSummarRkiosk23,
                                        r'''$.totalSale''',
                                      ),
                                      deliveryCharges: getJsonField(
                                        _model.shiftSummarRkiosk23,
                                        r'''$.deliveryCharges''',
                                      ),
                                      lastBillNo: getJsonField(
                                        _model.shiftSummarRkiosk23,
                                        r'''$.lastBillNo''',
                                      ).toString(),
                                      discount: getJsonField(
                                        _model.shiftSummarRkiosk23,
                                        r'''$.discount''',
                                      ),
                                      lastBillTime: functions
                                          .timestampToMili(getCurrentTimestamp),
                                      cashSale: getJsonField(
                                        _model.shiftSummarRkiosk23,
                                        r'''$.cashSale''',
                                      ),
                                      paymentJson: getJsonField(
                                        _model.shiftSummarRkiosk23,
                                        r'''$.paymentJson''',
                                      ).toString(),
                                    ));
                                    if (!functions.isPrinterSelected(
                                        FFAppState().printerDevice)!) {
                                      _model.resDevice2qr22 =
                                          await actions.scanPrinter(
                                        FFAppState().posMode,
                                      );
                                      _shouldSetState = true;
                                    }
                                    _model.connectdeviceqr22 =
                                        await actions.connectDevice(
                                      FFAppState().printerDevice,
                                      FFAppState().printerIndex,
                                    );
                                    _shouldSetState = true;
                                    if (FFAppState().printerName != null &&
                                        FFAppState().printerName != '') {
                                      _model.returnedList2qr223 =
                                          await actions.selectBillPrint(
                                        FFAppState().selBill.toString(),
                                        FFAppState().allBillsList.toList(),
                                      );
                                      _shouldSetState = true;
                                      _model.deviceqr23 =
                                          await actions.newCustomAction(
                                        FFAppState().printerIndex,
                                      );
                                      _shouldSetState = true;
                                      _model.outletdocqr23 =
                                          await queryOutletRecordOnce(
                                        queryBuilder: (outletRecord) =>
                                            outletRecord.where(
                                          'id',
                                          isEqualTo:
                                              FFAppState().outletIdRef?.id,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _shouldSetState = true;
                                      await actions.printBillParking(
                                        _model.deviceqr23!.toList(),
                                        FFAppState().isPrinterConnected,
                                        FFAppState().printerName,
                                        getJsonField(
                                          functions.outletDocToJson(
                                              _model.outletdocqr23!),
                                          r'''$''',
                                        ),
                                        _model.docinvqr2!,
                                        FFAppState().paperSize,
                                      );
                                      await actions.removeFromAllBillList(
                                        FFAppState().selBill,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Check Out SuccessFull!',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      Navigator.pop(context);

                                      context.goNamed(
                                        'VehicleEntry',
                                        queryParameters: {
                                          'shiftDoc': serializeParam(
                                            widget!.shiftdoc,
                                            ParamType.JSON,
                                          ),
                                          'userRef': serializeParam(
                                            widget!.usrref,
                                            ParamType.DocumentReference,
                                          ),
                                          'appSetting': serializeParam(
                                            widget!.settings,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'appSetting': widget!.settings,
                                        },
                                      );

                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('printer connection'),
                                            content:
                                                Text('printer not connected'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  } else {
                                    _model.shiftupdatenew =
                                        await actions.calShiftSummary2(
                                      _model.docinvqr2!,
                                      widget!.shiftdoc!,
                                      widget!.invdoc!.finalBillAmt,
                                      _model.paymentModeModel.dropDownValue!,
                                    );
                                    _shouldSetState = true;
                                    _model.shiftref2new =
                                        await queryShiftRecordOnce(
                                      parent: FFAppState().outletIdRef,
                                      queryBuilder: (shiftRecord) =>
                                          shiftRecord.where(
                                        'shiftId',
                                        isEqualTo: getJsonField(
                                          widget!.shiftdoc,
                                          r'''$.shiftId''',
                                        ).toString(),
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    _shouldSetState = true;

                                    await _model.shiftref2new!.reference
                                        .update(createShiftRecordData(
                                      billCount: valueOrDefault<int>(
                                        FFAppState().billcount,
                                        0,
                                      ),
                                      totalSale: getJsonField(
                                        _model.shiftupdatenew,
                                        r'''$.totalSale''',
                                      ),
                                      deliveryCharges: getJsonField(
                                        _model.shiftupdatenew,
                                        r'''$.deliveryCharges''',
                                      ),
                                      lastBillNo: getJsonField(
                                        _model.shiftupdatenew,
                                        r'''$.lastBillNo''',
                                      ).toString(),
                                      discount: getJsonField(
                                        _model.shiftupdatenew,
                                        r'''$.discount''',
                                      ),
                                      lastBillTime: functions
                                          .timestampToMili(getCurrentTimestamp),
                                      cashSale: getJsonField(
                                        _model.shiftupdatenew,
                                        r'''$.cashSale''',
                                      ),
                                      paymentJson: getJsonField(
                                        _model.shiftupdatenew,
                                        r'''$.paymentJson''',
                                      ).toString(),
                                    ));
                                    if (!functions.isPrinterSelected(
                                        FFAppState().printerDevice)!) {
                                      _model.resDevice2qrnew =
                                          await actions.scanPrinter(
                                        FFAppState().posMode,
                                      );
                                      _shouldSetState = true;
                                    }
                                    _model.connectdeviceqr2new =
                                        await actions.connectDevice(
                                      FFAppState().printerDevice,
                                      FFAppState().printerIndex,
                                    );
                                    _shouldSetState = true;
                                    if (FFAppState().printerName != null &&
                                        FFAppState().printerName != '') {
                                      _model.returnedList2qrnew =
                                          await actions.selectBillPrint(
                                        FFAppState().selBill.toString(),
                                        FFAppState().allBillsList.toList(),
                                      );
                                      _shouldSetState = true;
                                      _model.deviceqr2new =
                                          await actions.newCustomAction(
                                        FFAppState().printerIndex,
                                      );
                                      _shouldSetState = true;
                                      _model.outletdocqr2new =
                                          await queryOutletRecordOnce(
                                        queryBuilder: (outletRecord) =>
                                            outletRecord.where(
                                          'id',
                                          isEqualTo:
                                              FFAppState().outletIdRef?.id,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _shouldSetState = true;
                                      await actions.printBillParking(
                                        _model.deviceqr2new!.toList(),
                                        FFAppState().isPrinterConnected,
                                        FFAppState().printerName,
                                        getJsonField(
                                          functions.outletDocToJson(
                                              _model.outletdocqr2new!),
                                          r'''$''',
                                        ),
                                        _model.docinvqr2!,
                                        FFAppState().paperSize,
                                      );
                                      await actions.removeFromAllBillList(
                                        FFAppState().selBill,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Check Out SuccessFull!',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      Navigator.pop(context);

                                      context.goNamed(
                                        'VehicleEntry',
                                        queryParameters: {
                                          'shiftDoc': serializeParam(
                                            widget!.shiftdoc,
                                            ParamType.JSON,
                                          ),
                                          'userRef': serializeParam(
                                            widget!.usrref,
                                            ParamType.DocumentReference,
                                          ),
                                          'appSetting': serializeParam(
                                            widget!.settings,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'appSetting': widget!.settings,
                                        },
                                      );

                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('printer connection'),
                                            content:
                                                Text('printer not connected'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  }
                                } else {
                                  _model.shiftupdate =
                                      await actions.calShiftSummary(
                                    _model.docinvqr2!,
                                    widget!.shiftdoc!,
                                  );
                                  _shouldSetState = true;
                                  _model.shiftref2 = await queryShiftRecordOnce(
                                    parent: FFAppState().outletIdRef,
                                    queryBuilder: (shiftRecord) =>
                                        shiftRecord.where(
                                      'shiftId',
                                      isEqualTo: getJsonField(
                                        widget!.shiftdoc,
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
                                      _model.shiftupdate,
                                      r'''$.totalSale''',
                                    ),
                                    deliveryCharges: getJsonField(
                                      _model.shiftupdate,
                                      r'''$.deliveryCharges''',
                                    ),
                                    lastBillNo: getJsonField(
                                      _model.shiftupdate,
                                      r'''$.lastBillNo''',
                                    ).toString(),
                                    discount: getJsonField(
                                      _model.shiftupdate,
                                      r'''$.discount''',
                                    ),
                                    lastBillTime: functions
                                        .timestampToMili(getCurrentTimestamp),
                                    cashSale: getJsonField(
                                      _model.shiftupdate,
                                      r'''$.cashSale''',
                                    ),
                                    paymentJson: getJsonField(
                                      _model.shiftupdate,
                                      r'''$.paymentJson''',
                                    ).toString(),
                                  ));
                                  if (!functions.isPrinterSelected(
                                      FFAppState().printerDevice)!) {
                                    _model.resDevice2qr2 =
                                        await actions.scanPrinter(
                                      FFAppState().posMode,
                                    );
                                    _shouldSetState = true;
                                  }
                                  _model.connectdeviceqr2 =
                                      await actions.connectDevice(
                                    FFAppState().printerDevice,
                                    FFAppState().printerIndex,
                                  );
                                  _shouldSetState = true;
                                  if (FFAppState().printerName != null &&
                                      FFAppState().printerName != '') {
                                    _model.returnedList2qr22 =
                                        await actions.selectBillPrint(
                                      FFAppState().selBill.toString(),
                                      FFAppState().allBillsList.toList(),
                                    );
                                    _shouldSetState = true;
                                    _model.deviceqr2 =
                                        await actions.newCustomAction(
                                      FFAppState().printerIndex,
                                    );
                                    _shouldSetState = true;
                                    _model.outletdocqr2 =
                                        await queryOutletRecordOnce(
                                      queryBuilder: (outletRecord) =>
                                          outletRecord.where(
                                        'id',
                                        isEqualTo: FFAppState().outletIdRef?.id,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    _shouldSetState = true;
                                    await actions.printBillParking(
                                      _model.deviceqr2!.toList(),
                                      FFAppState().isPrinterConnected,
                                      FFAppState().printerName,
                                      getJsonField(
                                        functions.outletDocToJson(
                                            _model.outletdocqr2!),
                                        r'''$''',
                                      ),
                                      _model.docinvqr2!,
                                      FFAppState().paperSize,
                                    );
                                    await actions.removeFromAllBillList(
                                      FFAppState().selBill,
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Check Out SuccessFull!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    Navigator.pop(context);

                                    context.goNamed(
                                      'VehicleEntry',
                                      queryParameters: {
                                        'shiftDoc': serializeParam(
                                          widget!.shiftdoc,
                                          ParamType.JSON,
                                        ),
                                        'userRef': serializeParam(
                                          widget!.usrref,
                                          ParamType.DocumentReference,
                                        ),
                                        'appSetting': serializeParam(
                                          widget!.settings,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'appSetting': widget!.settings,
                                      },
                                    );

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('printer connection'),
                                          content:
                                              Text('printer not connected'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Login again to start Shift ',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0x00000000),
                                  ),
                                );
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                            }

                            if (_shouldSetState) safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'ycb4z6pp' /* Print */,
                          ),
                          icon: Icon(
                            Icons.print_outlined,
                            size: 18.0,
                          ),
                          options: FFButtonOptions(
                            height: 36.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).parkingPrimary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            var _shouldSetState = false;
                            if (widget!.invdoc?.orderType == 'MONTHLYPASS') {
                              await widget!.invdoc!.reference
                                  .update(createInvoiceRecordData(
                                checkOutTime:
                                    getCurrentTimestamp.millisecondsSinceEpoch,
                                billAmt: 0.0,
                                finalBillAmt: 0.0,
                                duration: valueOrDefault<double>(
                                  functions.calculateHour(
                                      widget!.invdoc?.checkInTime,
                                      getCurrentTimestamp
                                          .millisecondsSinceEpoch),
                                  0.0,
                                ),
                                checkOutTerminal: FFAppState().terminalNo,
                              ));
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content: Text('Check Out SuccessFull!'),
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Check Out SuccessFull!',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              Navigator.pop(context);

                              context.goNamed(
                                'VehicleEntry',
                                queryParameters: {
                                  'shiftDoc': serializeParam(
                                    widget!.shiftdoc,
                                    ParamType.JSON,
                                  ),
                                  'userRef': serializeParam(
                                    widget!.usrref,
                                    ParamType.DocumentReference,
                                  ),
                                  'appSetting': serializeParam(
                                    widget!.settings,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'appSetting': widget!.settings,
                                },
                              );
                            } else {
                              await widget!.invdoc!.reference
                                  .update(createInvoiceRecordData(
                                checkOutTime:
                                    getCurrentTimestamp.millisecondsSinceEpoch,
                                billAmt: widget!.settings!.settingList
                                        .where((e) =>
                                            e.title == 'calculateHourlyCharges')
                                        .toList()
                                        .firstOrNull!
                                        .value
                                    ? functions.calculateParkingCharges2(
                                        widget!.invdoc?.vechicleType,
                                        widget!.invdoc?.checkInTime,
                                        getCurrentTimestamp
                                            .millisecondsSinceEpoch,
                                        VehicleBillStruct(
                                          baseRate: widget!.productDoc
                                              ?.parkingCharges?.baseRate,
                                          baseDuration: widget!.productDoc
                                              ?.parkingCharges?.baseDuration,
                                          hourlyRate: widget!.productDoc
                                              ?.parkingCharges?.hourlyRate,
                                          freeMinutes: widget!.productDoc
                                              ?.parkingCharges?.freeMinutes,
                                        ))
                                    : functions.calculateParkingCharges12hours(
                                        widget!.invdoc?.vechicleType,
                                        widget!.invdoc?.checkInTime,
                                        getCurrentTimestamp
                                            .millisecondsSinceEpoch),
                                finalBillAmt: widget!.settings!.settingList
                                        .where((e) =>
                                            e.title == 'calculateHourlyCharges')
                                        .toList()
                                        .firstOrNull!
                                        .value
                                    ? functions.calculateParkingCharges2(
                                        widget!.invdoc?.vechicleType,
                                        widget!.invdoc?.checkInTime,
                                        getCurrentTimestamp
                                            .millisecondsSinceEpoch,
                                        VehicleBillStruct(
                                          baseRate: widget!.productDoc
                                              ?.parkingCharges?.baseRate,
                                          baseDuration: widget!.productDoc
                                              ?.parkingCharges?.baseDuration,
                                          hourlyRate: widget!.productDoc
                                              ?.parkingCharges?.hourlyRate,
                                          freeMinutes: widget!.productDoc
                                              ?.parkingCharges?.freeMinutes,
                                        ))
                                    : functions.calculateParkingCharges12hours(
                                        widget!.invdoc?.vechicleType,
                                        widget!.invdoc?.checkInTime,
                                        getCurrentTimestamp
                                            .millisecondsSinceEpoch),
                                duration: valueOrDefault<double>(
                                  functions.calculateHour(
                                      widget!.invdoc?.checkInTime,
                                      getCurrentTimestamp
                                          .millisecondsSinceEpoch),
                                  0.0,
                                ),
                                checkOutTerminal: FFAppState().terminalNo,
                              ));
                              _model.savebill = await queryInvoiceRecordOnce(
                                parent: FFAppState().outletIdRef,
                                queryBuilder: (invoiceRecord) =>
                                    invoiceRecord.where(
                                  'id',
                                  isEqualTo: widget!.invdoc?.id,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              _shouldSetState = true;
                              if (getJsonField(
                                widget!.shiftdoc,
                                r'''$.shiftExists''',
                              )) {
                                if (widget!.settings!.settingList
                                    .where(
                                        (e) => e.title == 'enablePaymentMode')
                                    .toList()
                                    .firstOrNull!
                                    .value) {
                                  if (_model.paymentModeModel.dropDownValue ==
                                      'COMPLEMENTARY') {
                                    _model.shiftfierbase2 =
                                        await queryShiftRecordOnce(
                                      parent: FFAppState().outletIdRef,
                                      queryBuilder: (shiftRecord) =>
                                          shiftRecord.where(
                                        'shiftId',
                                        isEqualTo: widget!.invdoc?.shiftId,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    _shouldSetState = true;
                                    _model.shiftDetailsNewcar2 =
                                        await actions.shiftDetailNewpark2(
                                      _model.shiftfierbase2,
                                    );
                                    _shouldSetState = true;
                                    _model.shiftSummarRkiosk233 =
                                        await actions.calShiftSummary2(
                                      widget!.invdoc!,
                                      _model.shiftDetailsNewcar2!,
                                      widget!.invdoc!.finalBillAmt,
                                      _model.paymentModeModel.dropDownValue!,
                                    );
                                    _shouldSetState = true;

                                    await _model.shiftfierbase2!.reference
                                        .update(createShiftRecordData(
                                      billCount: valueOrDefault<int>(
                                        FFAppState().billcount,
                                        0,
                                      ),
                                      totalSale: getJsonField(
                                        _model.shiftSummarRkiosk233,
                                        r'''$.totalSale''',
                                      ),
                                      deliveryCharges: getJsonField(
                                        _model.shiftSummarRkiosk233,
                                        r'''$.deliveryCharges''',
                                      ),
                                      lastBillNo: getJsonField(
                                        _model.shiftSummarRkiosk233,
                                        r'''$.lastBillNo''',
                                      ).toString(),
                                      discount: getJsonField(
                                        _model.shiftSummarRkiosk233,
                                        r'''$.discount''',
                                      ),
                                      lastBillTime: functions
                                          .timestampToMili(getCurrentTimestamp),
                                      cashSale: getJsonField(
                                        _model.shiftSummarRkiosk233,
                                        r'''$.cashSale''',
                                      ),
                                      paymentJson: getJsonField(
                                        _model.shiftSummarRkiosk233,
                                        r'''$.paymentJson''',
                                      ).toString(),
                                      shiftId: getJsonField(
                                        widget!.shiftdoc,
                                        r'''$.shiftId''',
                                      ).toString(),
                                    ));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Check Out SuccessFull!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    Navigator.pop(context);

                                    context.goNamed(
                                      'VehicleEntry',
                                      queryParameters: {
                                        'shiftDoc': serializeParam(
                                          widget!.shiftdoc,
                                          ParamType.JSON,
                                        ),
                                        'userRef': serializeParam(
                                          widget!.usrref,
                                          ParamType.DocumentReference,
                                        ),
                                        'appSetting': serializeParam(
                                          widget!.settings,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'appSetting': widget!.settings,
                                      },
                                    );
                                  } else {
                                    _model.shiftupdate2 =
                                        await actions.calShiftSummary2(
                                      _model.savebill!,
                                      widget!.shiftdoc!,
                                      widget!.invdoc!.finalBillAmt,
                                      _model.paymentModeModel.dropDownValue!,
                                    );
                                    _shouldSetState = true;
                                    _model.shiftref23 =
                                        await queryShiftRecordOnce(
                                      parent: FFAppState().outletIdRef,
                                      queryBuilder: (shiftRecord) =>
                                          shiftRecord.where(
                                        'shiftId',
                                        isEqualTo: getJsonField(
                                          widget!.shiftdoc,
                                          r'''$.shiftId''',
                                        ).toString(),
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    _shouldSetState = true;

                                    await _model.shiftref23!.reference
                                        .update(createShiftRecordData(
                                      billCount: valueOrDefault<int>(
                                        FFAppState().billcount,
                                        0,
                                      ),
                                      totalSale: getJsonField(
                                        _model.shiftupdate2,
                                        r'''$.totalSale''',
                                      ),
                                      deliveryCharges: getJsonField(
                                        _model.shiftupdate2,
                                        r'''$.deliveryCharges''',
                                      ),
                                      lastBillNo: getJsonField(
                                        _model.shiftupdate2,
                                        r'''$.lastBillNo''',
                                      ).toString(),
                                      discount: getJsonField(
                                        _model.shiftupdate2,
                                        r'''$.discount''',
                                      ),
                                      lastBillTime: functions
                                          .timestampToMili(getCurrentTimestamp),
                                      cashSale: getJsonField(
                                        _model.shiftupdate2,
                                        r'''$.cashSale''',
                                      ),
                                      paymentJson: getJsonField(
                                        _model.shiftupdate2,
                                        r'''$.paymentJson''',
                                      ).toString(),
                                      shiftId: getJsonField(
                                        widget!.shiftdoc,
                                        r'''$.shiftId''',
                                      ).toString(),
                                    ));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Check Out SuccessFull!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    Navigator.pop(context);

                                    context.goNamed(
                                      'VehicleEntry',
                                      queryParameters: {
                                        'shiftDoc': serializeParam(
                                          widget!.shiftdoc,
                                          ParamType.JSON,
                                        ),
                                        'userRef': serializeParam(
                                          widget!.usrref,
                                          ParamType.DocumentReference,
                                        ),
                                        'appSetting': serializeParam(
                                          widget!.settings,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'appSetting': widget!.settings,
                                      },
                                    );
                                  }
                                } else {
                                  _model.shiftupdate23 =
                                      await actions.calShiftSummary(
                                    _model.savebill!,
                                    widget!.shiftdoc!,
                                  );
                                  _shouldSetState = true;
                                  _model.shiftref232 =
                                      await queryShiftRecordOnce(
                                    parent: FFAppState().outletIdRef,
                                    queryBuilder: (shiftRecord) =>
                                        shiftRecord.where(
                                      'shiftId',
                                      isEqualTo: getJsonField(
                                        widget!.shiftdoc,
                                        r'''$.shiftId''',
                                      ).toString(),
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  _shouldSetState = true;

                                  await _model.shiftref232!.reference
                                      .update(createShiftRecordData(
                                    billCount: valueOrDefault<int>(
                                      FFAppState().billcount,
                                      0,
                                    ),
                                    totalSale: getJsonField(
                                      _model.shiftupdate23,
                                      r'''$.totalSale''',
                                    ),
                                    deliveryCharges: getJsonField(
                                      _model.shiftupdate23,
                                      r'''$.deliveryCharges''',
                                    ),
                                    lastBillNo: getJsonField(
                                      _model.shiftupdate23,
                                      r'''$.lastBillNo''',
                                    ).toString(),
                                    discount: getJsonField(
                                      _model.shiftupdate23,
                                      r'''$.discount''',
                                    ),
                                    lastBillTime: functions
                                        .timestampToMili(getCurrentTimestamp),
                                    cashSale: getJsonField(
                                      _model.shiftupdate23,
                                      r'''$.cashSale''',
                                    ),
                                    paymentJson: getJsonField(
                                      _model.shiftupdate23,
                                      r'''$.paymentJson''',
                                    ).toString(),
                                    shiftId: getJsonField(
                                      widget!.shiftdoc,
                                      r'''$.shiftId''',
                                    ).toString(),
                                  ));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Check Out SuccessFull!',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  Navigator.pop(context);

                                  context.goNamed(
                                    'VehicleEntry',
                                    queryParameters: {
                                      'shiftDoc': serializeParam(
                                        widget!.shiftdoc,
                                        ParamType.JSON,
                                      ),
                                      'userRef': serializeParam(
                                        widget!.usrref,
                                        ParamType.DocumentReference,
                                      ),
                                      'appSetting': serializeParam(
                                        widget!.settings,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'appSetting': widget!.settings,
                                    },
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Login again to start Shift ',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0x00000000),
                                  ),
                                );
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                            }

                            if (_shouldSetState) safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'l4t1fump' /* CheckOut & Save */,
                          ),
                          options: FFButtonOptions(
                            height: 36.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .parkingSecondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
