import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/qrparking/qrparking_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bill_entry_model.dart';
export 'bill_entry_model.dart';

class BillEntryWidget extends StatefulWidget {
  const BillEntryWidget({
    super.key,
    this.shiftDoc,
    this.userRef,
    this.appsetting,
  });

  final dynamic shiftDoc;
  final DocumentReference? userRef;
  final AppSettingsRecord? appsetting;

  @override
  State<BillEntryWidget> createState() => _BillEntryWidgetState();
}

class _BillEntryWidgetState extends State<BillEntryWidget> {
  late BillEntryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BillEntryModel());

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
        title: 'BillEntry',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).parkingPrimary,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 45.0,
                              icon: Icon(
                                Icons.chevron_left,
                                color: FlutterFlowTheme.of(context).lineColor,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.pushNamed(
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
                                      widget!.appsetting,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'appSetting': widget!.appsetting,
                                  },
                                );
                              },
                            ),
                            AutoSizeText(
                              FFLocalizations.of(context).getText(
                                '09so15ok' /* Bill Entry */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineSmallFamily,
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineSmallFamily),
                                  ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 45.0,
                              icon: Icon(
                                Icons.chevron_left,
                                color: Colors.transparent,
                                size: 30.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 100.0),
                          child: FlutterFlowRadioButton(
                            options: [
                              FFLocalizations.of(context).getText(
                                'azoeoer0' /* Token No */,
                              ),
                              FFLocalizations.of(context).getText(
                                'fmlor34i' /* Vehicle No */,
                              )
                            ].toList(),
                            onChanged: (val) => safeSetState(() {}),
                            controller: _model.radioButtonValueController ??=
                                FormFieldController<String>(
                                    FFLocalizations.of(context).getText(
                              'geu4ygp4' /* Token No */,
                            )),
                            optionHeight: 32.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                            selectedTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            buttonPosition: RadioButtonPosition.left,
                            direction: Axis.horizontal,
                            radioButtonColor:
                                FlutterFlowTheme.of(context).primary,
                            inactiveRadioButtonColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            toggleable: false,
                            horizontalAlignment: WrapAlignment.start,
                            verticalAlignment: WrapCrossAlignment.start,
                          ),
                        ),
                        Builder(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 50.0),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onFieldSubmitted: (_) async {
                                if (_model.radioButtonValue == 'Token No') {
                                  if (_model.textController.text != null &&
                                      _model.textController.text != '') {
                                    _model.search =
                                        await queryInvoiceRecordOnce(
                                      parent: FFAppState().outletIdRef,
                                      queryBuilder: (invoiceRecord) =>
                                          invoiceRecord.where(
                                        'count',
                                        isEqualTo: int.tryParse(
                                            _model.textController.text),
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    if (_model.search?.checkOutTime == 0) {
                                      _model.productDoc =
                                          await queryProductRecordOnce(
                                        parent: FFAppState().outletIdRef,
                                        queryBuilder: (productRecord) =>
                                            productRecord.where(
                                          'name',
                                          isEqualTo:
                                              _model.search?.vechicleType,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: QrparkingWidget(
                                                usrref: widget!.userRef,
                                                invdoc: _model.search,
                                                shiftdoc: widget!.shiftDoc!,
                                                settings: widget!.appsetting,
                                                productDoc: _model.productDoc,
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
                                    _model.search2 =
                                        await queryInvoiceRecordOnce(
                                      parent: FFAppState().outletIdRef,
                                      queryBuilder: (invoiceRecord) =>
                                          invoiceRecord.where(
                                        'checkOutTime',
                                        isEqualTo: 0,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    _model.listcars = _model.search2;
                                    safeSetState(() {});
                                  }
                                } else {
                                  if (_model.textController.text != null &&
                                      _model.textController.text != '') {
                                    _model.search3 =
                                        await queryInvoiceRecordOnce(
                                      parent: FFAppState().outletIdRef,
                                      queryBuilder: (invoiceRecord) =>
                                          invoiceRecord.where(
                                        'vechicleNo',
                                        isEqualTo: _model.textController.text,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    if (_model.search3?.checkOutTime == 0) {
                                      _model.productDoc2 =
                                          await queryProductRecordOnce(
                                        parent: FFAppState().outletIdRef,
                                        queryBuilder: (productRecord) =>
                                            productRecord.where(
                                          'name',
                                          isEqualTo:
                                              _model.search3?.vechicleType,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: QrparkingWidget(
                                                usrref: widget!.userRef,
                                                invdoc: _model.search3,
                                                shiftdoc: widget!.shiftDoc!,
                                                settings: widget!.appsetting,
                                                productDoc: _model.productDoc2,
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
                                    _model.search4 =
                                        await queryInvoiceRecordOnce(
                                      parent: FFAppState().outletIdRef,
                                      queryBuilder: (invoiceRecord) =>
                                          invoiceRecord.where(
                                        'checkOutTime',
                                        isEqualTo: 0,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    _model.listcars = _model.search4;
                                    safeSetState(() {});
                                  }
                                }

                                safeSetState(() {});
                              },
                              autofocus: false,
                              textCapitalization: TextCapitalization.characters,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  '7hjkrwde' /* Search Vehicle */,
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
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 50.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'yz45d649' /* OR */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineLargeFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineLargeFamily),
                                ),
                          ),
                        ),
                        Builder(
                          builder: (context) => FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            buttonSize: 116.0,
                            icon: Icon(
                              Icons.qr_code_scanner_sharp,
                              color: FlutterFlowTheme.of(context).lineColor,
                              size: 60.0,
                            ),
                            onPressed: () async {
                              _model.qrResult =
                                  await FlutterBarcodeScanner.scanBarcode(
                                '#C62828', // scanning line color
                                FFLocalizations.of(context).getText(
                                  'mc3ydhlt' /* Cancel */,
                                ), // cancel button text
                                true, // whether to show the flash icon
                                ScanMode.QR,
                              );

                              _model.getinvout = await queryInvoiceRecordOnce(
                                parent: FFAppState().outletIdRef,
                                queryBuilder: (invoiceRecord) =>
                                    invoiceRecord.where(
                                  'id',
                                  isEqualTo: _model.qrResult,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              if (_model.getinvout?.checkOutTime == 0) {
                                _model.productDoc3 =
                                    await queryProductRecordOnce(
                                  parent: FFAppState().outletIdRef,
                                  queryBuilder: (productRecord) =>
                                      productRecord.where(
                                    'name',
                                    isEqualTo: _model.getinvout?.vechicleType,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: QrparkingWidget(
                                          usrref: widget!.userRef,
                                          invdoc: _model.getinvout,
                                          shiftdoc: widget!.shiftDoc!,
                                          settings: widget!.appsetting,
                                          productDoc: _model.productDoc3,
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
                                              Navigator.pop(alertDialogContext),
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
