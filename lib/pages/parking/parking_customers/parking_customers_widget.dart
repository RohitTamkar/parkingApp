import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/payment_mode/payment_mode_widget.dart';
import '/components/qrparking/qrparking_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'parking_customers_model.dart';
export 'parking_customers_model.dart';

class ParkingCustomersWidget extends StatefulWidget {
  const ParkingCustomersWidget({
    super.key,
    this.shiftDoc,
    this.userRef,
  });

  final dynamic shiftDoc;
  final DocumentReference? userRef;

  @override
  State<ParkingCustomersWidget> createState() => _ParkingCustomersWidgetState();
}

class _ParkingCustomersWidgetState extends State<ParkingCustomersWidget> {
  late ParkingCustomersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ParkingCustomersModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.listcars2 = await queryInvoiceRecordOnce(
        parent: FFAppState().outletIdRef,
        queryBuilder: (invoiceRecord) => invoiceRecord.where(
          'checkOutTime',
          isEqualTo: 0,
        ),
      );
      _model.listcars = _model.listcars2!.toList().cast<InvoiceRecord>();
      safeSetState(() {});
      if (!functions.isPrinterSelected(FFAppState().printerDevice)!) {
        _model.resDevice2Copy = await actions.scanPrinter(
          FFAppState().posMode,
        );
      }
      _model.connectdeviceCOPY23 = await actions.connectDevice(
        FFAppState().printerDevice,
        FFAppState().printerIndex,
      );
      if (!functions.isPrinterSelected(FFAppState().printerDevice)!) {
        _model.resDevice2Copy2 = await actions.scanPrinter(
          FFAppState().posMode,
        );
      }
      _model.connectdeviceCOPY232 = await actions.connectDevice(
        FFAppState().printerDevice,
        FFAppState().printerIndex,
      );
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        title: 'ParkingCustomers',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).parkingPrimary,
            floatingActionButton: FloatingActionButton(
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
                  }.withoutNulls,
                );
              },
              backgroundColor: FlutterFlowTheme.of(context).info,
              elevation: 8.0,
              child: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).primaryBtnText,
                size: 24.0,
              ),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 5.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.keyboard_arrow_left_sharp,
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed('account');
                                },
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '4ujui357' /* Customer List */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily),
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.settings_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      size: 20.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed('account');
                                    },
                                  ),
                                  Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.qr_code_scanner_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        size: 22.0,
                                      ),
                                      onPressed: () async {
                                        _model.qrResult =
                                            await FlutterBarcodeScanner
                                                .scanBarcode(
                                          '#C62828', // scanning line color
                                          FFLocalizations.of(context).getText(
                                            'pggc92oy' /* Cancel */,
                                          ), // cancel button text
                                          true, // whether to show the flash icon
                                          ScanMode.QR,
                                        );

                                        _model.getinvout =
                                            await queryInvoiceRecordOnce(
                                          parent: FFAppState().outletIdRef,
                                          queryBuilder: (invoiceRecord) =>
                                              invoiceRecord.where(
                                            'id',
                                            isEqualTo: _model.qrResult,
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        if (_model.getinvout?.checkOutTime ==
                                            0) {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () => FocusScope.of(
                                                          dialogContext)
                                                      .unfocus(),
                                                  child: QrparkingWidget(
                                                    usrref: widget!.userRef,
                                                    invdoc: _model.getinvout,
                                                    shiftdoc: widget!.shiftDoc!,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text(
                                                    'The Vehicle checkout process is already completed!'),
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
                                  ),
                                ].divide(SizedBox(width: 4.0)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 26,
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color:
                          FlutterFlowTheme.of(context).parkingPrimaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 15.0, 10.0, 15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onFieldSubmitted: (_) async {
                                if (_model.textController.text != null &&
                                    _model.textController.text != '') {
                                  _model.search = await queryInvoiceRecordOnce(
                                    parent: FFAppState().outletIdRef,
                                    queryBuilder: (invoiceRecord) =>
                                        invoiceRecord.where(
                                      'vechicleNo',
                                      isEqualTo: _model.textController.text,
                                    ),
                                  );
                                  _model.listcars = _model.search!
                                      .toList()
                                      .cast<InvoiceRecord>();
                                  safeSetState(() {});
                                } else {
                                  _model.search2 = await queryInvoiceRecordOnce(
                                    parent: FFAppState().outletIdRef,
                                    queryBuilder: (invoiceRecord) =>
                                        invoiceRecord.where(
                                      'checkOutTime',
                                      isEqualTo: 0,
                                    ),
                                  );
                                  _model.listcars = _model.search2!
                                      .toList()
                                      .cast<InvoiceRecord>();
                                  safeSetState(() {});
                                }

                                safeSetState(() {});
                              },
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  '2kskesb8' /* Search Customer */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelLargeFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily),
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily),
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).info,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: FlutterFlowTheme.of(context)
                                      .parkingPrimary,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                final parkingCustomersVar =
                                    _model.listcars.toList();

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: parkingCustomersVar.length,
                                  itemBuilder:
                                      (context, parkingCustomersVarIndex) {
                                    final parkingCustomersVarItem =
                                        parkingCustomersVar[
                                            parkingCustomersVarIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 20.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            color: Colors.white,
                                            child: ExpandableNotifier(
                                              initialExpanded: false,
                                              child: ExpandablePanel(
                                                header: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                0.0,
                                                                10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                parkingCustomersVarItem
                                                                    .vechicleNo,
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily,
                                                                    fontSize:
                                                                        22.0,
                                                                    letterSpacing:
                                                                        1.5,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                  ),
                                                            ),
                                                            if (parkingCustomersVarItem
                                                                        .orderType !=
                                                                    null &&
                                                                parkingCustomersVarItem
                                                                        .orderType !=
                                                                    '')
                                                              Text(
                                                                parkingCustomersVarItem
                                                                    .orderType,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                          ],
                                                        ),
                                                        Divider(
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent3,
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            3.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'hhlywaa8' /* Advance Paid */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            7.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '₹ ${valueOrDefault<String>(
                                                                            parkingCustomersVarItem.advancePaid.toString(),
                                                                            '0',
                                                                          )}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '2jbhdg9v' /* Cash */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          3.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '05z8bm9g' /* Check In Time */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    functions.getTime(
                                                                        parkingCustomersVarItem
                                                                            .checkInTime),
                                                                    '0',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                collapsed: Container(),
                                                expanded: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .parkingSecondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15.0,
                                                                10.0,
                                                                15.0,
                                                                10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            3.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'soda0c0v' /* Remaining Cost */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor2,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      '₹ ${functions.calculateRemainingAmount(functions.calculateParkingCharges12hours(parkingCustomersVarItem.vechicleType, parkingCustomersVarItem.checkInTime, getCurrentTimestamp.millisecondsSinceEpoch), parkingCustomersVarItem.advancePaid).toString()}',
                                                                      '0',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).parkingPrimary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            3.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'qrrk5pcq' /* Duration */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor2,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '${valueOrDefault<String>(
                                                                      functions
                                                                          .calculateHour(
                                                                              parkingCustomersVarItem.checkInTime,
                                                                              getCurrentTimestamp.millisecondsSinceEpoch)
                                                                          .toString(),
                                                                      '0',
                                                                    )}Hr',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).parkingPrimaryBackground,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            3.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '09xvupg2' /* Current Time */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor2,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    dateTimeFormat(
                                                                      "h:mm a",
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).parkingPrimaryBackground,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await parkingCustomersVarItem
                                                                      .reference
                                                                      .update(
                                                                          createInvoiceRecordData(
                                                                    checkOutTime:
                                                                        getCurrentTimestamp
                                                                            .millisecondsSinceEpoch,
                                                                    duration:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      functions.calculateHour(
                                                                          parkingCustomersVarItem
                                                                              .checkInTime,
                                                                          getCurrentTimestamp
                                                                              .millisecondsSinceEpoch),
                                                                      0.0,
                                                                    ),
                                                                  ));
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        content:
                                                                            Text('Check Out SuccessFull!'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );

                                                                  context
                                                                      .pushNamed(
                                                                    'ParkingCustomers',
                                                                    queryParameters:
                                                                        {
                                                                      'shiftDoc':
                                                                          serializeParam(
                                                                        widget!
                                                                            .shiftDoc,
                                                                        ParamType
                                                                            .JSON,
                                                                      ),
                                                                      'userRef':
                                                                          serializeParam(
                                                                        widget!
                                                                            .userRef,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '9zuaz4gj' /* Save */,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 45.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          14.0,
                                                                          0.0,
                                                                          14.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFF23424A),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child:
                                                                    PaymentModeWidget(
                                                                  key: Key(
                                                                      'Keyvgb_${parkingCustomersVarIndex}_of_${parkingCustomersVar.length}'),
                                                                ),
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                var _shouldSetState =
                                                                    false;

                                                                await parkingCustomersVarItem
                                                                    .reference
                                                                    .update(
                                                                        createInvoiceRecordData(
                                                                  checkOutTime:
                                                                      getCurrentTimestamp
                                                                          .millisecondsSinceEpoch,
                                                                  duration:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    functions.calculateHour(
                                                                        parkingCustomersVarItem
                                                                            .checkInTime,
                                                                        getCurrentTimestamp
                                                                            .millisecondsSinceEpoch),
                                                                    0.0,
                                                                  ),
                                                                ));
                                                                _model.docinv =
                                                                    await queryInvoiceRecordOnce(
                                                                  parent: FFAppState()
                                                                      .outletIdRef,
                                                                  queryBuilder:
                                                                      (invoiceRecord) =>
                                                                          invoiceRecord
                                                                              .where(
                                                                    'id',
                                                                    isEqualTo:
                                                                        parkingCustomersVarItem
                                                                            .reference
                                                                            .id,
                                                                  ),
                                                                  singleRecord:
                                                                      true,
                                                                ).then((s) => s
                                                                        .firstOrNull);
                                                                _shouldSetState =
                                                                    true;
                                                                if (!functions
                                                                    .isPrinterSelected(
                                                                        FFAppState()
                                                                            .printerDevice)!) {
                                                                  _model.resDevice2 =
                                                                      await actions
                                                                          .scanPrinter(
                                                                    FFAppState()
                                                                        .posMode,
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                }
                                                                _model.connectdevice =
                                                                    await actions
                                                                        .connectDevice(
                                                                  FFAppState()
                                                                      .printerDevice,
                                                                  FFAppState()
                                                                      .printerIndex,
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                if (FFAppState()
                                                                            .printerName !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .printerName !=
                                                                        '') {
                                                                  _model.returnedList2kiosk =
                                                                      await actions
                                                                          .selectBillPrint(
                                                                    FFAppState()
                                                                        .selBill
                                                                        .toString(),
                                                                    FFAppState()
                                                                        .allBillsList
                                                                        .toList(),
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  _model.device =
                                                                      await actions
                                                                          .newCustomAction(
                                                                    FFAppState()
                                                                        .printerIndex,
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  _model.outletdoc =
                                                                      await queryOutletRecordOnce(
                                                                    queryBuilder:
                                                                        (outletRecord) =>
                                                                            outletRecord.where(
                                                                      'id',
                                                                      isEqualTo: FFAppState()
                                                                          .outletIdRef
                                                                          ?.id,
                                                                    ),
                                                                    singleRecord:
                                                                        true,
                                                                  ).then((s) =>
                                                                          s.firstOrNull);
                                                                  _shouldSetState =
                                                                      true;
                                                                  await actions
                                                                      .printBillParking(
                                                                    _model
                                                                        .device!
                                                                        .toList(),
                                                                    FFAppState()
                                                                        .isPrinterConnected,
                                                                    FFAppState()
                                                                        .printerName,
                                                                    getJsonField(
                                                                      functions.outletDocToJson(
                                                                          _model
                                                                              .outletdoc!),
                                                                      r'''$''',
                                                                    ),
                                                                    _model
                                                                        .docinv!,
                                                                    FFAppState()
                                                                        .paperSize,
                                                                  );
                                                                  await actions
                                                                      .removeFromAllBillList(
                                                                    FFAppState()
                                                                        .selBill,
                                                                  );
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        content:
                                                                            Text('Check Out SuccessFull!'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );

                                                                  context
                                                                      .pushNamed(
                                                                    'ParkingCustomers',
                                                                    queryParameters:
                                                                        {
                                                                      'shiftDoc':
                                                                          serializeParam(
                                                                        widget!
                                                                            .shiftDoc,
                                                                        ParamType
                                                                            .JSON,
                                                                      ),
                                                                      'userRef':
                                                                          serializeParam(
                                                                        widget!
                                                                            .userRef,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );

                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                } else {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'printer connection'),
                                                                        content:
                                                                            Text('printer not connected'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                }

                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'b805cxwc' /* Print */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .print_outlined,
                                                                size: 15.0,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 45.0,
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .parkingPrimaryBackground,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                                elevation: 3.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                theme: ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
