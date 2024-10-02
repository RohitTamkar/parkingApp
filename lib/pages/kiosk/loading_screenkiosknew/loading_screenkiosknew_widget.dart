import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'loading_screenkiosknew_model.dart';
export 'loading_screenkiosknew_model.dart';

class LoadingScreenkiosknewWidget extends StatefulWidget {
  const LoadingScreenkiosknewWidget({
    super.key,
    this.shiftDoc,
    this.userDoc,
    this.appSettingDoc,
    this.outletRef,
  });

  final dynamic shiftDoc;
  final DocumentReference? userDoc;
  final AppSettingsRecord? appSettingDoc;
  final DocumentReference? outletRef;

  @override
  State<LoadingScreenkiosknewWidget> createState() =>
      _LoadingScreenkiosknewWidgetState();
}

class _LoadingScreenkiosknewWidgetState
    extends State<LoadingScreenkiosknewWidget> {
  late LoadingScreenkiosknewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingScreenkiosknewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.internetconnection = await actions.checkInternetConnection();
      if (!true) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Alert'),
              content: Text('check internet connection !'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );

        context.pushNamed('welcomeScreenNew');
      }
      _model.isAppSetExistsNew = await queryAppSettingsRecordOnce(
        parent: FFAppState().outletIdRef,
        queryBuilder: (appSettingsRecord) => appSettingsRecord.where(
          'deviceId',
          isEqualTo: FFAppState().dId,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.taxcollection = await queryTaxMasterRecordOnce();
      _model.masterAppsetting = await queryAppSettingsMasterRecordOnce();
      _model.returnAppsettiing = await actions.returnAppsetting(
        _model.masterAppsetting!.toList(),
        FFAppState().appSettings.toList(),
      );
      FFAppState().shiftexist = valueOrDefault<String>(
        getJsonField(
          widget!.shiftDoc,
          r'''$.shiftExists''',
        )?.toString()?.toString(),
        '0',
      );
      safeSetState(() {});
      _model.shiftboolean = await actions.shiftkiosknew(
        valueOrDefault<String>(
          getJsonField(
            widget!.shiftDoc,
            r'''$.shiftExists''',
          )?.toString()?.toString(),
          '0',
        ),
      );
      if (_model.isAppSetExistsNew != null) {
        FFAppState().appSettings = _model.isAppSetExistsNew!.settingList
            .toList()
            .cast<AppSettingsStruct>();
        safeSetState(() {});
        _model.returnAppsettiing2 = await actions.returnAppsetting(
          _model.masterAppsetting!.toList(),
          FFAppState().appSettings.toList(),
        );

        await _model.isAppSetExistsNew!.reference.update({
          ...mapToFirestore(
            {
              'settingList': getAppSettingsListFirestoreData(
                _model.returnAppsettiing2,
              ),
            },
          ),
        });
      } else {
        var appSettingsRecordReference =
            AppSettingsRecord.createDoc(FFAppState().outletIdRef!);
        await appSettingsRecordReference.set({
          ...createAppSettingsRecordData(
            saveButton: true,
            billSettlement: true,
            allowSaleWithoutTax: false,
            askCustomerInBillCreation: false,
            billFormatSendToEmail: false,
            calculateReverseQuantity: false,
            captainDetails: false,
            captainRequest: false,
            checkInCheckOut: false,
            couponKotHeader: false,
            couponPrintBill: false,
            couponSaveBill: false,
            deliveryNote: false,
            saveKot: false,
            discountToBill: false,
            doNotShowProductList: false,
            barcodeMenu: false,
            billModificationtoUser: false,
            comboPriceUpdate: false,
            customerAdvance: false,
            customerforcefully: false,
            editingSettlement: false,
            floatingKeyboard: false,
            goodsReceivedMenu: false,
            kotPrintAmountColumn: false,
            kotReprint: false,
            loyaltyPoints: false,
            onlineOrderSystem: false,
            openingBalanceAmountSet: false,
            openingBalancePopup: false,
            paymentMenu: false,
            salesman: false,
            salesmanForcefully: false,
            salesmanProductWise: false,
            stockOutMenu: false,
            store: false,
            tableForcefully: false,
            threeCharSearch: false,
            wlanCommunication: false,
            estimateMode: false,
            hideKeyboard: false,
            hideProductSearchCode: false,
            inclusiveTax: false,
            itemStockRequestSent: false,
            kotRemark: false,
            manualPrice: false,
            openPrice: false,
            pemisesShowCodeWise: false,
            productSuggestionRemove: false,
            regionalLanguage: false,
            rfidMasterRead: false,
            rfidMasterWrite: false,
            searchWithOnlyBarcode: false,
            sendSMS: false,
            showHoldListButton: false,
            showPrintButtonsAfterPay: false,
            showProductImage: false,
            sortHotKeys: false,
            stockGettingMinus: false,
            stockRequestAccept: false,
            tables: false,
            upiButton: false,
            vehicleNumber: false,
            weightMinus: false,
            barcodeOnBill: false,
            billRemark: false,
            cgstSgstOnBill: false,
            columnProductNameAndQtyPrint: false,
            dontPrintBillnoInbill: false,
            dontPrintRateColumn: false,
            dontPrintSerialNoInbill: false,
            dontPrintTaxInvoiceOnBill: false,
            doubleprint: false,
            duplicateBill: false,
            billPrintingServicesPointWise: false,
            largeBillFont: false,
            numberToWords: false,
            signatureInBill: false,
            fontBoldNetTotal: false,
            gstBreakUpOnBill: false,
            hsnNumber: false,
            paymentModePrint: false,
            printConsolidateTax: false,
            printDiscountOnBill: false,
            printMrpPrice: false,
            printUnitTypeOnBill: false,
            printUserNameInBill: false,
            productNameCut: false,
            productSerialNumber: false,
            regionalBillPrint: false,
            regionalKOTPrint: false,
            saveMRPinBill: false,
            totalQtyInBill: false,
            trimNameForSingleLine: false,
            billAmountInWords: false,
            couponKotSummary: false,
            openSoftKeyWord: false,
            rateColumnTax: false,
            showProductImg: false,
            regularScreen: true,
            tableScreen: false,
            fullScreenQr: false,
            fullScreenBill: false,
            productAndList: false,
            deviceId: FFAppState().dId,
            kioSKscreen: false,
            shiftEndBtn: false,
            ethernetPrint: false,
            printKOTWithBill: false,
            hideParcelButton: false,
          ),
          ...mapToFirestore(
            {
              'settingList': getAppSettingsListFirestoreData(
                _model.returnAppsettiing,
              ),
            },
          ),
        });
        _model.doc = AppSettingsRecord.getDocumentFromData({
          ...createAppSettingsRecordData(
            saveButton: true,
            billSettlement: true,
            allowSaleWithoutTax: false,
            askCustomerInBillCreation: false,
            billFormatSendToEmail: false,
            calculateReverseQuantity: false,
            captainDetails: false,
            captainRequest: false,
            checkInCheckOut: false,
            couponKotHeader: false,
            couponPrintBill: false,
            couponSaveBill: false,
            deliveryNote: false,
            saveKot: false,
            discountToBill: false,
            doNotShowProductList: false,
            barcodeMenu: false,
            billModificationtoUser: false,
            comboPriceUpdate: false,
            customerAdvance: false,
            customerforcefully: false,
            editingSettlement: false,
            floatingKeyboard: false,
            goodsReceivedMenu: false,
            kotPrintAmountColumn: false,
            kotReprint: false,
            loyaltyPoints: false,
            onlineOrderSystem: false,
            openingBalanceAmountSet: false,
            openingBalancePopup: false,
            paymentMenu: false,
            salesman: false,
            salesmanForcefully: false,
            salesmanProductWise: false,
            stockOutMenu: false,
            store: false,
            tableForcefully: false,
            threeCharSearch: false,
            wlanCommunication: false,
            estimateMode: false,
            hideKeyboard: false,
            hideProductSearchCode: false,
            inclusiveTax: false,
            itemStockRequestSent: false,
            kotRemark: false,
            manualPrice: false,
            openPrice: false,
            pemisesShowCodeWise: false,
            productSuggestionRemove: false,
            regionalLanguage: false,
            rfidMasterRead: false,
            rfidMasterWrite: false,
            searchWithOnlyBarcode: false,
            sendSMS: false,
            showHoldListButton: false,
            showPrintButtonsAfterPay: false,
            showProductImage: false,
            sortHotKeys: false,
            stockGettingMinus: false,
            stockRequestAccept: false,
            tables: false,
            upiButton: false,
            vehicleNumber: false,
            weightMinus: false,
            barcodeOnBill: false,
            billRemark: false,
            cgstSgstOnBill: false,
            columnProductNameAndQtyPrint: false,
            dontPrintBillnoInbill: false,
            dontPrintRateColumn: false,
            dontPrintSerialNoInbill: false,
            dontPrintTaxInvoiceOnBill: false,
            doubleprint: false,
            duplicateBill: false,
            billPrintingServicesPointWise: false,
            largeBillFont: false,
            numberToWords: false,
            signatureInBill: false,
            fontBoldNetTotal: false,
            gstBreakUpOnBill: false,
            hsnNumber: false,
            paymentModePrint: false,
            printConsolidateTax: false,
            printDiscountOnBill: false,
            printMrpPrice: false,
            printUnitTypeOnBill: false,
            printUserNameInBill: false,
            productNameCut: false,
            productSerialNumber: false,
            regionalBillPrint: false,
            regionalKOTPrint: false,
            saveMRPinBill: false,
            totalQtyInBill: false,
            trimNameForSingleLine: false,
            billAmountInWords: false,
            couponKotSummary: false,
            openSoftKeyWord: false,
            rateColumnTax: false,
            showProductImg: false,
            regularScreen: true,
            tableScreen: false,
            fullScreenQr: false,
            fullScreenBill: false,
            productAndList: false,
            deviceId: FFAppState().dId,
            kioSKscreen: false,
            shiftEndBtn: false,
            ethernetPrint: false,
            printKOTWithBill: false,
            hideParcelButton: false,
          ),
          ...mapToFirestore(
            {
              'settingList': getAppSettingsListFirestoreData(
                _model.returnAppsettiing,
              ),
            },
          ),
        }, appSettingsRecordReference);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Alert'),
              content: Text('App settings created'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      }

      if (!_model.shiftboolean!) {
        FFAppState().updateShiftDetailsStruct(
          (e) => e
            ..billCount = 0
            ..dayId = functions.getDayId()
            ..lastBillNo = '0'
            ..lastBillTime = 0
            ..tax = 0.0
            ..deliveryCharges = 0.0
            ..code = null
            ..endTime = 0
            ..advanceAmtTotal = 0.0
            ..customerReciveAmtTotal = 0.0
            ..discount = 0.0
            ..expensesAmtTotal = 0.0
            ..openingAmt = 0.0
            ..receiveAmtTotal = 0.0
            ..refoundAmount = 0.0
            ..totalSale = 0.0
            ..roundOff = 0.0
            ..cashInHand = 0.0
            ..cashSale = 0.0
            ..startTime = functions.timestampToMili(getCurrentTimestamp)
            ..inActive = true
            ..shiftNo = 0
            ..subTotalBill = 0.0
            ..userId = widget!.userDoc?.id
            ..deviceId = FFAppState().deviceqrId
            ..paymentJson =
                '{\"cash\":0,\"credit\":0,\"cheque\":0,\"digital\":0,\"card\":0,\"googlepay\":0,\"phonepe\":0,\"paytm\":0,\"other\":0,\"loyaltypoint\":0}'
            ..shiftId = functions.getShiftId(FFAppState().shiftCount)
            ..synC = false
            ..newIDShift = functions.getShiftIdInt(FFAppState().shiftCount)
            ..version = FFAppState().shiftStructVersion,
        );
        safeSetState(() {});
        FFAppState().shiftCount = getJsonField(
          widget!.shiftDoc,
          r'''$.shiftCount''',
        );
        FFAppState().update(() {});

        var shiftRecordReference =
            ShiftRecord.createDoc(FFAppState().outletIdRef!);
        await shiftRecordReference.set(createShiftRecordData(
          billCount: 0,
          dayId: functions.getDayId(),
          discount: 0.0,
          totalSale: 0.0,
          deliveryCharges: 0.0,
          tax: 0.0,
          shiftId: functions.getShiftId(FFAppState().shiftCount),
          endTime: 0,
          lastBillNo: '0',
          lastBillTime: 0,
          openingAmt: 0.0,
          cashSale: 0.0,
          startTime: functions.timestampToMili(getCurrentTimestamp),
          paymentJson:
              '{\"cash\":0,\"credit\":0,\"cheque\":0,\"digital\":0,\"card\":0,\"googlepay\":0,\"phonepe\":0,\"paytm\":0,\"other\":0,\"loyaltypoint\":0,\"upi_qr\":0}',
        ));
        _model.shiftDoc1 = ShiftRecord.getDocumentFromData(
            createShiftRecordData(
              billCount: 0,
              dayId: functions.getDayId(),
              discount: 0.0,
              totalSale: 0.0,
              deliveryCharges: 0.0,
              tax: 0.0,
              shiftId: functions.getShiftId(FFAppState().shiftCount),
              endTime: 0,
              lastBillNo: '0',
              lastBillTime: 0,
              openingAmt: 0.0,
              cashSale: 0.0,
              startTime: functions.timestampToMili(getCurrentTimestamp),
              paymentJson:
                  '{\"cash\":0,\"credit\":0,\"cheque\":0,\"digital\":0,\"card\":0,\"googlepay\":0,\"phonepe\":0,\"paytm\":0,\"other\":0,\"loyaltypoint\":0,\"upi_qr\":0}',
            ),
            shiftRecordReference);

        await _model.shiftDoc1!.reference.update(createShiftRecordData(
          id: _model.shiftDoc1?.reference.id,
        ));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'New Day Started !',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
        _model.shiftDetailsNew2 = await actions.shiftExists(
          functions.getDayId(),
          '0',
          FFAppState().outletIdRef!.id,
        );
        _model.appsetting = await queryAppSettingsRecordOnce(
          parent: widget!.outletRef,
          queryBuilder: (appSettingsRecord) => appSettingsRecord.where(
            'deviceId',
            isEqualTo: FFAppState().dId,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);

        context.pushNamed(
          'KioskAdvertising',
          queryParameters: {
            'userDoc': serializeParam(
              widget!.userDoc,
              ParamType.DocumentReference,
            ),
            'shiftdoc': serializeParam(
              _model.shiftDetailsNew2,
              ParamType.JSON,
            ),
            'appsetting': serializeParam(
              _model.appsetting,
              ParamType.Document,
            ),
            'taxcollection': serializeParam(
              _model.taxcollection,
              ParamType.Document,
              isList: true,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'appsetting': _model.appsetting,
            'taxcollection': _model.taxcollection,
          },
        );

        return;
      } else {
        FFAppState().shiftCount = getJsonField(
          widget!.shiftDoc,
          r'''$.shiftCount''',
        );
        FFAppState().update(() {});
        _model.shiftDetailsNewresumed = await actions.shiftExists(
          functions.getDayId(),
          '0',
          FFAppState().outletIdRef!.id,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Day Resumed !',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
        _model.appsetting2 = await queryAppSettingsRecordOnce(
          parent: widget!.outletRef,
          queryBuilder: (appSettingsRecord) => appSettingsRecord.where(
            'deviceId',
            isEqualTo: FFAppState().dId,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);

        context.pushNamed(
          'KioskAdvertising',
          queryParameters: {
            'userDoc': serializeParam(
              widget!.userDoc,
              ParamType.DocumentReference,
            ),
            'shiftdoc': serializeParam(
              _model.shiftDetailsNewresumed,
              ParamType.JSON,
            ),
            'appsetting': serializeParam(
              _model.appsetting2,
              ParamType.Document,
            ),
            'taxcollection': serializeParam(
              _model.taxcollection,
              ParamType.Document,
              isList: true,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'appsetting': _model.appsetting2,
            'taxcollection': _model.taxcollection,
          },
        );

        return;
      }
    });

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
        title: 'loadingScreenkiosknew',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<List<OutletRecord>>(
                  stream: queryOutletRecord(
                    queryBuilder: (outletRecord) => outletRecord.where(
                      'id',
                      isEqualTo: FFAppState().outletId,
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
                    List<OutletRecord> containerOutletRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerOutletRecord =
                        containerOutletRecordList.isNotEmpty
                            ? containerOutletRecordList.first
                            : null;

                    return Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: 85.0,
                                      height: 85.0,
                                      decoration: BoxDecoration(),
                                      child: Image.asset(
                                        'assets/images/IMG_20220412_140945.png',
                                        width: 100.0,
                                        height: 160.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'qbvs5rrx' /* SENSIBLE */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .displaySmallFamily,
                                            fontSize: 36.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmallFamily),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'laf4ajsw' /* CONNECT */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 5.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmallFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.06,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.05,
                                          child: custom_widgets.ProgressBar(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.05,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (FFAppState().targetPlatform == 'windows')
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 15.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  containerOutletRecord?.name,
                                                  'Sensible',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displaySmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmallFamily),
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: LinearPercentIndicator(
                                                    percent: 0.9,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.3,
                                                    lineHeight: 22.0,
                                                    animation: true,
                                                    animateFromLastPercent:
                                                        true,
                                                    progressColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .customColor2,
                                                    center: Text(
                                                      functions.subscriptionDays(
                                                          getCurrentTimestamp,
                                                          containerOutletRecord!
                                                              .renewalDate),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                    ),
                                                    barRadius:
                                                        Radius.circular(20.0),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 5.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'p0p9q1ph' /* Remaining Days */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.08,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '2luxenhv' /* Subscription */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                3.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'nnsnoeuu' /* ₹ */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'n9c3zto3' /* 3540 */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMediumFamily),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'pbzlid0u' /* Due Date : */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '1ftmbr2s' /* 04/08/2022 */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMediumFamily),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
