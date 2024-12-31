import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'parking_icon_checkin_model.dart';
export 'parking_icon_checkin_model.dart';

class ParkingIconCheckinWidget extends StatefulWidget {
  const ParkingIconCheckinWidget({
    super.key,
    this.shiftdoc,
    this.userRef,
    this.appSetting,
  });

  final dynamic shiftdoc;
  final DocumentReference? userRef;
  final AppSettingsRecord? appSetting;

  @override
  State<ParkingIconCheckinWidget> createState() =>
      _ParkingIconCheckinWidgetState();
}

class _ParkingIconCheckinWidgetState extends State<ParkingIconCheckinWidget> {
  late ParkingIconCheckinModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ParkingIconCheckinModel());

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
        title: 'ParkingIconCheckin',
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).parkingPrimary,
                    ),
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
                                  color: FlutterFlowTheme.of(context)
                                      .parkingPrimary,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              Text(
                                FFAppState().outletName,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineSmallFamily,
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
                                borderRadius: 10.0,
                                buttonSize: 40.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).parkingPrimary,
                                icon: Icon(
                                  Icons.playlist_add_check,
                                  color: FlutterFlowTheme.of(context)
                                      .parkingPrimary,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: StreamBuilder<List<ProductRecord>>(
                            stream: queryProductRecord(
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
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              List<ProductRecord> containerProductRecordList =
                                  snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.5,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final list = containerProductRecordList
                                        .sortedList(
                                            keyOf: (e) => e.code, desc: false)
                                        .toList();

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount: list.length,
                                      itemBuilder: (context, listIndex) {
                                        final listItem = list[listIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().categoryColor =
                                                listItem.id;
                                            safeSetState(() {});
                                            _model.vehicleType = listItem;
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 10.0,
                                                  color: Color(0x1A000000),
                                                  offset: Offset(
                                                    10.0,
                                                    10.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              border: Border.all(
                                                color: listItem.id ==
                                                        FFAppState()
                                                            .categoryColor
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 7,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 5.0,
                                                                10.0, 5.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        topRight:
                                                            Radius.circular(
                                                                20.0),
                                                      ),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    200),
                                                        fadeOutDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    200),
                                                        imageUrl:
                                                            listItem.imageUrl,
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(7.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Text(
                                                              listItem.name,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineLargeFamily,
                                                                    color: Color(
                                                                        0xFF033BE8),
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                  ),
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
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                50.0, 20.0, 50.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          _model.db =
                                              await queryInvoiceRecordOnce(
                                            parent: FFAppState().outletIdRef,
                                            queryBuilder: (invoiceRecord) =>
                                                invoiceRecord.where(
                                              'vechicleNo',
                                              isEqualTo:
                                                  _model.textController.text,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          FFAppState().outletId =
                                              _model.db!.vechicleNo;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'dzvr59z9' /* Vehicle Number */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
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
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily,
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
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
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    if ((_model.textController.text != null &&
                                            _model.textController.text != '') &&
                                        (_model.vehicleType != null)) {
                                      _model.countdatagetPRINT2 =
                                          await queryInvoiceRecordOnce(
                                        parent: FFAppState().outletIdRef,
                                        queryBuilder: (invoiceRecord) =>
                                            invoiceRecord.orderBy('invoiceDate',
                                                descending: true),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _shouldSetState = true;
                                      if (_model.countdatagetPRINT2 != null) {
                                        FFAppState().newcount =
                                            _model.countdatagetPRINT2!.count;
                                        safeSetState(() {});
                                      } else {
                                        FFAppState().newcount = 0;
                                        safeSetState(() {});
                                      }

                                      FFAppState().count =
                                          _model.countdatagetPRINT2!.count;
                                      safeSetState(() {});
                                      if (getJsonField(
                                        widget!.shiftdoc,
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
                                            _model.textController.text),
                                        price: FFAppState().parkingCharges,
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
                                          discountPer: valueOrDefault<double>(
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
                                            widget!.shiftdoc,
                                            r'''$..shiftId''',
                                          ).toString(),
                                          vechicleNo: functions.toCapitalLetter(
                                              _model.textController.text),
                                          checkInTime: valueOrDefault<int>(
                                            getCurrentTimestamp
                                                .millisecondsSinceEpoch,
                                            0,
                                          ),
                                          count: FFAppState().newcount,
                                          checkOutTime: widget!
                                                  .appSetting!.settingList
                                                  .where((e) =>
                                                      e.title ==
                                                      'oneTimeCheckin')
                                                  .toList()
                                                  .firstOrNull!
                                                  .value
                                              ? getCurrentTimestamp
                                                  .millisecondsSinceEpoch
                                              : 0,
                                          checkInTerminal:
                                              FFAppState().terminalNo,
                                          checkOutTerminal: '0',
                                          vechicleType:
                                              _model.vehicleType?.name,
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
                                      _model.docInvoicecars2 =
                                          InvoiceRecord.getDocumentFromData({
                                        ...createInvoiceRecordData(
                                          invoice: functions.genInvoiceNum(
                                              FFAppState().newcount,
                                              FFAppState().shiftCount),
                                          invoiceDate:
                                              functions.timestampToMili(
                                                  getCurrentTimestamp),
                                          dayId: functions.getDayId(),
                                          discountPer: valueOrDefault<double>(
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
                                            widget!.shiftdoc,
                                            r'''$..shiftId''',
                                          ).toString(),
                                          vechicleNo: functions.toCapitalLetter(
                                              _model.textController.text),
                                          checkInTime: valueOrDefault<int>(
                                            getCurrentTimestamp
                                                .millisecondsSinceEpoch,
                                            0,
                                          ),
                                          count: FFAppState().newcount,
                                          checkOutTime: widget!
                                                  .appSetting!.settingList
                                                  .where((e) =>
                                                      e.title ==
                                                      'oneTimeCheckin')
                                                  .toList()
                                                  .firstOrNull!
                                                  .value
                                              ? getCurrentTimestamp
                                                  .millisecondsSinceEpoch
                                              : 0,
                                          checkInTerminal:
                                              FFAppState().terminalNo,
                                          checkOutTerminal: '0',
                                          vechicleType:
                                              _model.vehicleType?.name,
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

                                      await _model.docInvoicecars2!.reference
                                          .update(createInvoiceRecordData(
                                        id: _model
                                            .docInvoicecars2?.reference.id,
                                      ));
                                      if (getJsonField(
                                        widget!.shiftdoc,
                                        r'''$.shiftExists''',
                                      )) {
                                        _model.shiftSummarRkiosk21 =
                                            await actions.calShiftSummary(
                                          _model.docInvoicecars2!,
                                          widget!.shiftdoc!,
                                        );
                                        _shouldSetState = true;
                                        _model.shiftref2 =
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

                                        await _model.shiftref2!.reference
                                            .update(createShiftRecordData(
                                          billCount: valueOrDefault<int>(
                                            FFAppState().billcount,
                                            0,
                                          ),
                                          totalSale: getJsonField(
                                            _model.shiftSummarRkiosk21,
                                            r'''$.totalSale''',
                                          ),
                                          deliveryCharges: getJsonField(
                                            _model.shiftSummarRkiosk21,
                                            r'''$.deliveryCharges''',
                                          ),
                                          lastBillNo: getJsonField(
                                            _model.shiftSummarRkiosk21,
                                            r'''$.lastBillNo''',
                                          ).toString(),
                                          discount: getJsonField(
                                            _model.shiftSummarRkiosk21,
                                            r'''$.discount''',
                                          ),
                                          lastBillTime:
                                              functions.timestampToMili(
                                                  getCurrentTimestamp),
                                          cashSale: getJsonField(
                                            _model.shiftSummarRkiosk21,
                                            r'''$.cashSale''',
                                          ),
                                          paymentJson: getJsonField(
                                            _model.shiftSummarRkiosk21,
                                            r'''$.paymentJson''',
                                          ).toString(),
                                        ));
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Alert'),
                                              content: Text(
                                                  'Check In Successfull !'),
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
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Login again to start Shift ',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0x00000000),
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
                                      if (FFAppState().printerName != null &&
                                          FFAppState().printerName != '') {
                                        FFAppState().lastBill =
                                            FFAppState().finalAmt;
                                        FFAppState().update(() {});
                                        _model.returnedList2kiosk =
                                            await actions.selectBillPrint(
                                          FFAppState().selBill.toString(),
                                          FFAppState().allBillsList.toList(),
                                        );
                                        _shouldSetState = true;
                                        _model.device2 =
                                            await actions.newCustomAction(
                                          FFAppState().printerIndex,
                                        );
                                        _shouldSetState = true;
                                        _model.outletdoc2 =
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
                                        if (widget!.appSetting!.settingList
                                            .where((e) =>
                                                e.title == 'oneTimeCheckin')
                                            .toList()
                                            .firstOrNull!
                                            .value) {
                                          await actions.printBillParkingOneTime(
                                            _model.device2!.toList(),
                                            FFAppState().isPrinterConnected,
                                            FFAppState().printerName,
                                            getJsonField(
                                              functions.outletDocToJson(
                                                  _model.outletdoc2!),
                                              r'''$''',
                                            ),
                                            _model.docInvoicecars2!,
                                            FFAppState().paperSize,
                                          );
                                          await actions.removeFromAllBillList(
                                            FFAppState().selBill,
                                          );
                                          await actions.clearValue();
                                          FFAppState().subTotal = 0.0;
                                          FFAppState().listCars = [];
                                          FFAppState().categoryColor = '';
                                          FFAppState().update(() {});
                                          FFAppState().finalAmt = 0.0;
                                          FFAppState().billAmt = 0.0;
                                          FFAppState().count =
                                              FFAppState().count;
                                          FFAppState().cartItem = [];
                                          FFAppState().shiftDetailsNEw =
                                              _model.shiftSummarRkiosk21!;
                                          FFAppState().update(() {});
                                          _model.vehicleType = null;
                                          safeSetState(() {});

                                          context.pushNamed(
                                            'VehicleEntry',
                                            queryParameters: {
                                              'shiftDoc': serializeParam(
                                                widget!.shiftdoc,
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
                                            },
                                          );

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        } else {
                                          await actions.printBillParking(
                                            _model.device2!.toList(),
                                            FFAppState().isPrinterConnected,
                                            FFAppState().printerName,
                                            getJsonField(
                                              functions.outletDocToJson(
                                                  _model.outletdoc2!),
                                              r'''$''',
                                            ),
                                            _model.docInvoicecars2!,
                                            FFAppState().paperSize,
                                          );
                                          await actions.removeFromAllBillList(
                                            FFAppState().selBill,
                                          );
                                          await actions.clearValue();
                                          FFAppState().subTotal = 0.0;
                                          FFAppState().listCars = [];
                                          FFAppState().categoryColor = '';
                                          FFAppState().update(() {});
                                          FFAppState().finalAmt = 0.0;
                                          FFAppState().billAmt = 0.0;
                                          FFAppState().count =
                                              FFAppState().count;
                                          FFAppState().cartItem = [];
                                          FFAppState().shiftDetailsNEw =
                                              _model.shiftSummarRkiosk21!;
                                          FFAppState().update(() {});
                                          _model.vehicleType = null;
                                          safeSetState(() {});

                                          context.pushNamed(
                                            'VehicleEntry',
                                            queryParameters: {
                                              'shiftDoc': serializeParam(
                                                widget!.shiftdoc,
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
                                            },
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
                                              title: Text('printer connection'),
                                              content:
                                                  Text('printer not connected'),
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
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'vgnqqm8w' /* Print */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    if ((_model.textController.text != null &&
                                            _model.textController.text != '') &&
                                        (_model.vehicleType != null)) {
                                      _model.countdataget2 =
                                          await queryInvoiceRecordOnce(
                                        parent: FFAppState().outletIdRef,
                                        queryBuilder: (invoiceRecord) =>
                                            invoiceRecord.orderBy('invoiceDate',
                                                descending: true),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _shouldSetState = true;
                                      if (_model.countdataget2 != null) {
                                        FFAppState().newcount =
                                            _model.countdataget2!.count;
                                        safeSetState(() {});
                                      } else {
                                        FFAppState().newcount = 0;
                                        safeSetState(() {});
                                      }

                                      FFAppState().count =
                                          _model.countdataget2!.count;
                                      safeSetState(() {});
                                      if (getJsonField(
                                        widget!.shiftdoc,
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
                                            _model.textController.text),
                                        price: FFAppState().parkingCharges,
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
                                          discountPer: valueOrDefault<double>(
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
                                            widget!.shiftdoc,
                                            r'''$.shiftId''',
                                          ).toString(),
                                          vechicleNo: functions.toCapitalLetter(
                                              _model.textController.text),
                                          checkInTime: valueOrDefault<int>(
                                            getCurrentTimestamp
                                                .millisecondsSinceEpoch,
                                            0,
                                          ),
                                          vechicleType:
                                              _model.vehicleType?.name,
                                          count: FFAppState().newcount,
                                          checkOutTime: widget!
                                                  .appSetting!.settingList
                                                  .where((e) =>
                                                      e.title ==
                                                      'oneTimeCheckin')
                                                  .toList()
                                                  .firstOrNull!
                                                  .value
                                              ? getCurrentTimestamp
                                                  .millisecondsSinceEpoch
                                              : 0,
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
                                      _model.docInvoicecars2Copy2 =
                                          InvoiceRecord.getDocumentFromData({
                                        ...createInvoiceRecordData(
                                          invoice: functions.genInvoiceNum(
                                              FFAppState().newcount,
                                              FFAppState().shiftCount),
                                          invoiceDate:
                                              functions.timestampToMili(
                                                  getCurrentTimestamp),
                                          dayId: functions.getDayId(),
                                          discountPer: valueOrDefault<double>(
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
                                            widget!.shiftdoc,
                                            r'''$.shiftId''',
                                          ).toString(),
                                          vechicleNo: functions.toCapitalLetter(
                                              _model.textController.text),
                                          checkInTime: valueOrDefault<int>(
                                            getCurrentTimestamp
                                                .millisecondsSinceEpoch,
                                            0,
                                          ),
                                          vechicleType:
                                              _model.vehicleType?.name,
                                          count: FFAppState().newcount,
                                          checkOutTime: widget!
                                                  .appSetting!.settingList
                                                  .where((e) =>
                                                      e.title ==
                                                      'oneTimeCheckin')
                                                  .toList()
                                                  .firstOrNull!
                                                  .value
                                              ? getCurrentTimestamp
                                                  .millisecondsSinceEpoch
                                              : 0,
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
                                          .docInvoicecars2Copy2!.reference
                                          .update(createInvoiceRecordData(
                                        id: _model
                                            .docInvoicecars2Copy2?.reference.id,
                                      ));
                                      if (getJsonField(
                                        widget!.shiftdoc,
                                        r'''$.shiftExists''',
                                      )) {
                                        _model.shiftSummarRkiosk22new =
                                            await actions.calShiftSummary(
                                          _model.docInvoicecars2Copy2!,
                                          widget!.shiftdoc!,
                                        );
                                        _shouldSetState = true;
                                        _model.shiftref2Copy2 =
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

                                        await _model.shiftref2Copy2!.reference
                                            .update(createShiftRecordData(
                                          billCount: valueOrDefault<int>(
                                            FFAppState().billcount,
                                            0,
                                          ),
                                          totalSale: getJsonField(
                                            _model.shiftSummarRkiosk22new,
                                            r'''$.totalSale''',
                                          ),
                                          deliveryCharges: getJsonField(
                                            _model.shiftSummarRkiosk22new,
                                            r'''$.deliveryCharges''',
                                          ),
                                          lastBillNo: getJsonField(
                                            _model.shiftSummarRkiosk22new,
                                            r'''$.lastBillNo''',
                                          ).toString(),
                                          discount: getJsonField(
                                            _model.shiftSummarRkiosk22new,
                                            r'''$.discount''',
                                          ),
                                          lastBillTime:
                                              functions.timestampToMili(
                                                  getCurrentTimestamp),
                                          cashSale: getJsonField(
                                            _model.shiftSummarRkiosk22new,
                                            r'''$.cashSale''',
                                          ),
                                          paymentJson: getJsonField(
                                            _model.shiftSummarRkiosk22new,
                                            r'''$.paymentJson''',
                                          ).toString(),
                                        ));
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Alert'),
                                              content: Text(
                                                  'Check In Successfull !'),
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
                                        await actions.removeFromAllBillList(
                                          FFAppState().selBill,
                                        );
                                        await actions.clearValue();
                                        FFAppState().subTotal = 0.0;
                                        FFAppState().listCars = [];
                                        FFAppState().categoryColor = '';
                                        FFAppState().update(() {});
                                        FFAppState().finalAmt = 0.0;
                                        FFAppState().billAmt = 0.0;
                                        FFAppState().count = FFAppState().count;
                                        FFAppState().cartItem = [];
                                        FFAppState().shiftDetailsNEw =
                                            _model.shiftSummarRkiosk22new!;
                                        FFAppState().update(() {});
                                        _model.vehicleType = null;
                                        safeSetState(() {});

                                        context.pushNamed(
                                          'VehicleEntry',
                                          queryParameters: {
                                            'shiftDoc': serializeParam(
                                              widget!.shiftdoc,
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
                                          },
                                        );

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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0x00000000),
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
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'jbp8nmhz' /* Save */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
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
