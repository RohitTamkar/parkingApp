import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header/header_widget.dart';
import '/components/reset_bill/reset_bill_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_setting_model.dart';
export 'app_setting_model.dart';

class AppSettingWidget extends StatefulWidget {
  const AppSettingWidget({super.key});

  @override
  State<AppSettingWidget> createState() => _AppSettingWidgetState();
}

class _AppSettingWidgetState extends State<AppSettingWidget> {
  late AppSettingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppSettingModel());

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController4 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController5 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController6 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController7 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController8 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController9 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController10 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController11 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController12 =
        ExpandableController(initialExpanded: false);
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
        title: 'AppSetting',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Padding(
              padding: EdgeInsets.all(3.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.12,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    icon: Icon(
                                      Icons.chevron_left_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 26.0,
                                    ),
                                    onPressed: () async {
                                      context.pop();
                                    },
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'sd21fxo8' /* App Setting */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: wrapWithModel(
                              model: _model.headerModel,
                              updateCallback: () => safeSetState(() {}),
                              child: HeaderWidget(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 13,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                      child: Stack(
                        children: [
                          StreamBuilder<List<AppSettingsRecord>>(
                            stream: queryAppSettingsRecord(
                              parent: FFAppState().outletIdRef,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              List<AppSettingsRecord>
                                  containerAppSettingsRecordList =
                                  snapshot.data!;
                              final containerAppSettingsRecord =
                                  containerAppSettingsRecordList.isNotEmpty
                                      ? containerAppSettingsRecordList.first
                                      : null;

                              return Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          1.0, 0.0, 1.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.11,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(7.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await containerAppSettingsRecord!
                                                      .reference
                                                      .update(
                                                          createAppSettingsRecordData(
                                                    allowSaleWithoutTax: _model
                                                        .switchListTileSaleWithTaxValue,
                                                    askCustomerInBillCreation:
                                                        _model
                                                            .switchListTileCaptonDetailAtBillCreationValue,
                                                    billFormatSendToEmail: _model
                                                        .switchListTilesendbillFormatToEmailValue,
                                                    billSettlement: _model
                                                        .switchListTileestBillSettlementValue,
                                                    calculateReverseQuantity: _model
                                                        .switchListTilecalculateReverseQtyValue,
                                                    captainDetails: _model
                                                        .switchListTileCaptonDetailAtBillCreationValue,
                                                    captainRequest: _model
                                                        .switchListTileCaptonReqestValue,
                                                    checkInCheckOut: _model
                                                        .switchListTilecheckInOutValue,
                                                    couponKotHeader: _model
                                                        .switchListTilecouponOrKotHeaderValue,
                                                    couponPrintBill: _model
                                                        .switchListTilecouponPrintBillValue,
                                                    couponSaveBill: _model
                                                        .switchListTilecouponSaveBillValue,
                                                    deliveryNote: _model
                                                        .switchListTileDeliveryDateValue,
                                                    saveButton: _model
                                                        .switchListTiledisableSaveButtonValue,
                                                    saveKot: _model
                                                        .switchListTiledisableSaveKotValue,
                                                    discountToBill: _model
                                                        .switchListTileEnableDisToDirectlyAddBillValue,
                                                    barcodeMenu: _model
                                                        .switchListTileEnableBarodeMenuValue,
                                                    doNotShowProductList: _model
                                                        .switchListTileproductListTypeEnableValue,
                                                    billModificationtoUser: _model
                                                        .switchListTilebillModificationValue,
                                                    comboPriceUpdate: _model
                                                        .switchListTilecomboPriceUpdateValue,
                                                    customerAdvance: _model
                                                        .switchListTilecustomerAdvValue,
                                                    customerforcefully: _model
                                                        .switchListTilecustometForcefullyBillValue,
                                                    editingSettlement: _model
                                                        .switchListTileeditingInSettelementValue,
                                                    floatingKeyboard: _model
                                                        .switchListTileflottingKeyboardButtonValue,
                                                    goodsReceivedMenu: _model
                                                        .switchListTilegoodsReceiveMenuValue,
                                                    kotPrintAmountColumn: _model
                                                        .switchListTilekotPrintAmountColumnValue,
                                                    kotReprint: _model
                                                        .switchListTilekotRePrintValue,
                                                    loyaltyPoints: _model
                                                        .switchListTileloyaltyPointValue,
                                                    onlineOrderSystem: _model
                                                        .switchListTileonlineOrderSystemValue,
                                                    openingBalanceAmountSet: _model
                                                        .switchListTileenableOpeningBalanceValue,
                                                    openingBalancePopup: _model
                                                        .switchListTileenableOpeningBalanceValue,
                                                    paymentMenu: _model
                                                        .switchListTileenablePaymentMenuValue,
                                                    salesman: _model
                                                        .switchListTileSaleWithTaxValue,
                                                    salesmanForcefully: _model
                                                        .switchListTilesalesmanForcefullyValue,
                                                    salesmanProductWise: _model
                                                        .switchListTilesalesmanProductWiseValue,
                                                    stockOutMenu: _model
                                                        .switchListTilestockOutMenuValue,
                                                    store: _model
                                                        .switchListTileenableStoreValue,
                                                    tableForcefully: _model
                                                        .switchListTileenabletableForcefullyValue,
                                                    threeCharSearch: _model
                                                        .switchListTilethreeCharValue,
                                                    wlanCommunication: _model
                                                        .switchListTilewLanCommunicationValue,
                                                    estimateMode: _model
                                                        .switchListTileestimateModeValue,
                                                    hideKeyboard: _model
                                                        .switchListTileHideKeybordValue,
                                                    hideProductSearchCode: _model
                                                        .switchListTilehideProductSearchCodeValue,
                                                    inclusiveTax: _model
                                                        .switchListTileincluOrReverseTaxValue,
                                                    itemStockRequestSent: _model
                                                        .switchListTilestockRequestOutletWiseValue,
                                                    kotRemark: _model
                                                        .switchListTilekotRemarkValue,
                                                    manualPrice: _model
                                                        .switchListTilemanualPriceValue,
                                                    openPrice: _model
                                                        .switchListTileopenPriceValue,
                                                    pemisesShowCodeWise:
                                                        containerAppSettingsRecord
                                                            ?.pemisesShowCodeWise,
                                                    productSuggestionRemove: _model
                                                        .switchListTileproductSuggREportValue,
                                                    regionalLanguage: _model
                                                        .switchListTileregionalLanguageValue,
                                                    rfidMasterRead: _model
                                                        .switchListTilerfidMasterReadValue,
                                                    rfidMasterWrite: _model
                                                        .switchListTilerfidmasterWrtValue,
                                                    searchWithOnlyBarcode: _model
                                                        .switchListTileSearchonlyWithBarcodeValue,
                                                    sendSMS: _model
                                                        .switchListTilesendbillSmsValue,
                                                    showHoldListButton: _model
                                                        .switchListTileshowHoldListBtnValue,
                                                    showPrintButtonsAfterPay: _model
                                                        .switchListTileprintBtnAfterPayValue,
                                                    showProductImage: _model
                                                        .switchListTileshowProductImgValue,
                                                    sortHotKeys: _model
                                                        .switchListTilesortingInHotKeyValue,
                                                    stockGettingMinus: _model
                                                        .switchListTilestockgettinginminusValue,
                                                    stockRequestAccept: _model
                                                        .switchListTilestockRequestAcceptValue,
                                                    tables: _model
                                                        .switchListTileenableTableValue,
                                                    upiButton: _model
                                                        .switchListTileenableUpiBtnValue,
                                                    vehicleNumber: _model
                                                        .switchListTileaddVehicleNoValue,
                                                    weightMinus: _model
                                                        .switchListTileweightMinusValue,
                                                  ));
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'qbrdklrf' /* Apply changes */,
                                                ),
                                                icon: Icon(
                                                  Icons.track_changes,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 150.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                                  elevation: 5.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.79,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ListView(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      3.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              child:
                                                                  ExpandableNotifier(
                                                                controller: _model
                                                                    .expandableExpandableController1,
                                                                child:
                                                                    ExpandablePanel(
                                                                  header:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            15.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '50u8mobd' /* MENU OPTION */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  collapsed:
                                                                      Container(),
                                                                  expanded:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTileenablePaymentMenuValue ??=
                                                                                containerAppSettingsRecord!.paymentMenu,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTileenablePaymentMenuValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'pktyai8b' /* 1.ENABLE PAYMENT MENU */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            subtitle:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '3v64prfx' /* (NOTE: ADD EXPENSES, ADVANCE,C... */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    color: Color(0xFF3B58FF),
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          indent:
                                                                              10.0,
                                                                          endIndent:
                                                                              10.0,
                                                                          color:
                                                                              Color(0xFFD4D1D1),
                                                                        ),
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTilegoodsReceiveMenuValue ??=
                                                                                containerAppSettingsRecord!.goodsReceivedMenu,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTilegoodsReceiveMenuValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'jgkace19' /* 2.ENABLE GOODS RECEIVE MENU */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          indent:
                                                                              10.0,
                                                                          endIndent:
                                                                              10.0,
                                                                          color:
                                                                              Color(0xFFD4D1D1),
                                                                        ),
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTilestockOutMenuValue ??=
                                                                                containerAppSettingsRecord!.stockOutMenu,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTilestockOutMenuValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '9io92bn9' /* 3.ENABLE STOCK OUT MENU */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          indent:
                                                                              10.0,
                                                                          endIndent:
                                                                              10.0,
                                                                          color:
                                                                              Color(0xFFD4D1D1),
                                                                        ),
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTileEnableBarodeMenuValue ??=
                                                                                containerAppSettingsRecord!.barcodeMenu,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTileEnableBarodeMenuValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'rrb0ymsd' /* 4.ENABLE BARCODE MENU */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  theme:
                                                                      ExpandableThemeData(
                                                                    tapHeaderToExpand:
                                                                        true,
                                                                    tapBodyToExpand:
                                                                        false,
                                                                    tapBodyToCollapse:
                                                                        false,
                                                                    headerAlignment:
                                                                        ExpandablePanelHeaderAlignment
                                                                            .center,
                                                                    hasIcon:
                                                                        true,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            color: Color(
                                                                0x00000000),
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableExpandableController2,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              15.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '8ox1v5el' /* BILLING SCREEN OPTION */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                collapsed:
                                                                    Container(),
                                                                expanded:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTileenableOpeningBalanceValue ??=
                                                                              containerAppSettingsRecord!.openingBalancePopup,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTileenableOpeningBalanceValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'if9393w3' /* 1.ENABLE OPENING BALANCE */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTileflottingKeyboardButtonValue ??=
                                                                              containerAppSettingsRecord!.floatingKeyboard,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTileflottingKeyboardButtonValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'anwqivpc' /* 2.ENABLE FLOATING KEYBOARD BUT... */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTileshowOpeningAmountValue ??=
                                                                              containerAppSettingsRecord!.openingBalancePopup,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTileshowOpeningAmountValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'uqarwren' /* 3.ENABLE SHOW OPENING AMOUNT */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          subtitle:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'j8ek2x6y' /* (NOTE: YESTURDAY CASH IN HAND ... */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: Color(0xFF3B58FF),
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTiledisableSaveButtonValue ??=
                                                                              containerAppSettingsRecord!.saveButton,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTiledisableSaveButtonValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'nrfy7bca' /* 4.DISABLE SAVE BUTTON */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTileshowHoldListBtnValue ??=
                                                                              containerAppSettingsRecord!.showHoldListButton,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTileshowHoldListBtnValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'isyhl1yo' /* 5.ENABLE SHOW HOLD LIST BUTTON */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            color: Color(
                                                                0x00000000),
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableExpandableController3,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              15.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '57ssan6b' /* CUSTOMER SETTING */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                collapsed:
                                                                    Container(),
                                                                expanded:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTilecustomerDetailsValue ??=
                                                                                false,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTilecustomerDetailsValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '01h5ilk9' /* 1.ENABLE CUSTOMER DETAILS */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          indent:
                                                                              10.0,
                                                                          endIndent:
                                                                              10.0,
                                                                          color:
                                                                              Color(0xFFD4D1D1),
                                                                        ),
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTilecustomerAdvValue ??=
                                                                                containerAppSettingsRecord!.customerAdvance,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTilecustomerAdvValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'bhfl7f3v' /* 2.ENABLE CUSTOMER ADVANCE */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          indent:
                                                                              10.0,
                                                                          endIndent:
                                                                              10.0,
                                                                          color:
                                                                              Color(0xFFD4D1D1),
                                                                        ),
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTilecustometForcefullyBillValue ??=
                                                                                containerAppSettingsRecord!.customerforcefully,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTilecustometForcefullyBillValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '3dkhz2iw' /* 3.ENABLE CUSTOMER FORCEFULLY(B... */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          indent:
                                                                              10.0,
                                                                          endIndent:
                                                                              10.0,
                                                                          color:
                                                                              Color(0xFFD4D1D1),
                                                                        ),
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTileaddVehicleNoValue ??=
                                                                                containerAppSettingsRecord!.vehicleNumber,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTileaddVehicleNoValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '14k1hd43' /* 4.ENABLE ADD VEHICLE NUMBER */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          indent:
                                                                              10.0,
                                                                          endIndent:
                                                                              10.0,
                                                                          color:
                                                                              Color(0xFFD4D1D1),
                                                                        ),
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTileloyaltyPointValue ??=
                                                                                containerAppSettingsRecord!.loyaltyPoints,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTileloyaltyPointValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'dcag8atv' /* 5.ENABLE LOYATY POINTS */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          indent:
                                                                              10.0,
                                                                          endIndent:
                                                                              10.0,
                                                                          color:
                                                                              Color(0xFFD4D1D1),
                                                                        ),
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTilesendbillSmsValue ??=
                                                                                containerAppSettingsRecord!.sendSMS,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTilesendbillSmsValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'ym9a682z' /* 6.SEND BILL SMS */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          indent:
                                                                              10.0,
                                                                          endIndent:
                                                                              10.0,
                                                                          color:
                                                                              Color(0xFFD4D1D1),
                                                                        ),
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTilestockRequestOutletWiseValue ??=
                                                                                containerAppSettingsRecord!.itemStockRequestSent,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTilestockRequestOutletWiseValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'x028lusr' /* 7.ENABLE STOCK REQUEST  */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          indent:
                                                                              10.0,
                                                                          endIndent:
                                                                              10.0,
                                                                          color:
                                                                              Color(0xFFD4D1D1),
                                                                        ),
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTilestockRequestAcceptValue ??=
                                                                                containerAppSettingsRecord!.stockRequestAccept,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTilestockRequestAcceptValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '73t15n6o' /* 8.ENABLE STOCK REQUEST ACCEPT */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            color: Color(
                                                                0x00000000),
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableExpandableController4,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              15.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      't5dm73n3' /* BARCODE SETTING */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                collapsed:
                                                                    Container(),
                                                                expanded:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTileSearchonlyWithBarcodeValue ??=
                                                                                containerAppSettingsRecord!.searchWithOnlyBarcode,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTileSearchonlyWithBarcodeValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '6wjnkype' /* 1.SEARCH ONLY WITH BARCODE */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          child: SwitchListTile(
                                                            value: _model
                                                                    .switchListTileregionalLanguageValue ??=
                                                                containerAppSettingsRecord!
                                                                    .regionalLanguage,
                                                            onChanged:
                                                                (newValue) async {
                                                              safeSetState(() =>
                                                                  _model.switchListTileregionalLanguageValue =
                                                                      newValue!);
                                                            },
                                                            title: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '95sz191k' /* 1.REGIONAL LANGUAGE ENABLE/DIS... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            tileColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            dense: false,
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .trailing,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 0.5,
                                                          indent: 10.0,
                                                          endIndent: 10.0,
                                                          color:
                                                              Color(0xFFD4D1D1),
                                                        ),
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          child: SwitchListTile(
                                                            value: _model
                                                                    .switchListTilecalculateReverseQtyValue ??=
                                                                containerAppSettingsRecord!
                                                                    .calculateReverseQuantity,
                                                            onChanged:
                                                                (newValue) async {
                                                              safeSetState(() =>
                                                                  _model.switchListTilecalculateReverseQtyValue =
                                                                      newValue!);
                                                            },
                                                            title: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'a3i2hflc' /* 2. CALCULATE REVERSE QUNTITY */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            tileColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            dense: false,
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .trailing,
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 0.5,
                                                          indent: 10.0,
                                                          endIndent: 10.0,
                                                          color:
                                                              Color(0xFFD4D1D1),
                                                        ),
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          child: SwitchListTile(
                                                            value: _model
                                                                    .switchListTilesortingInHotKeyValue ??=
                                                                containerAppSettingsRecord!
                                                                    .sortHotKeys,
                                                            onChanged:
                                                                (newValue) async {
                                                              safeSetState(() =>
                                                                  _model.switchListTilesortingInHotKeyValue =
                                                                      newValue!);
                                                            },
                                                            title: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'epnvoq5m' /* 3.DISABLE SORTING IN HOT KEY */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            dense: false,
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .trailing,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 0.5,
                                                          indent: 10.0,
                                                          endIndent: 10.0,
                                                          color:
                                                              Color(0xFFD4D1D1),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.1,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1dyolp2l' /* 4.WEIGHT START WITH (+)/(-) */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                  FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                        .dropDownValueController1 ??= FormFieldController<
                                                                            String>(
                                                                        null),
                                                                    options: [
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '2z2q3jeo' /* Option 1 */,
                                                                      ),
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'o9dp2vd7' /* (+) Plus */,
                                                                      ),
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'xj6zkvoo' /* (-) Minus */,
                                                                      )
                                                                    ],
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.dropDownValue1 =
                                                                                val),
                                                                    width:
                                                                        240.0,
                                                                    height:
                                                                        50.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                        ),
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'gzd73hdx' /* PLEASE SELECT */,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderWidth:
                                                                        0.0,
                                                                    borderRadius:
                                                                        0.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 0.5,
                                                          indent: 10.0,
                                                          endIndent: 10.0,
                                                          color:
                                                              Color(0xFFD4D1D1),
                                                        ),
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          child: SwitchListTile(
                                                            value: _model
                                                                    .switchListTileopenSoftKeywordValue ??=
                                                                false,
                                                            onChanged:
                                                                (newValue) async {
                                                              safeSetState(() =>
                                                                  _model.switchListTileopenSoftKeywordValue =
                                                                      newValue!);
                                                            },
                                                            title: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                't0mbyax8' /* 5.OPEN SOFT KEYBOARD */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            dense: false,
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .trailing,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 0.5,
                                                          indent: 10.0,
                                                          endIndent: 10.0,
                                                          color:
                                                              Color(0xFFD4D1D1),
                                                        ),
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          child: SwitchListTile(
                                                            value: _model
                                                                    .switchListTileprintBtnAfterPayValue ??=
                                                                containerAppSettingsRecord!
                                                                    .showPrintButtonsAfterPay,
                                                            onChanged:
                                                                (newValue) async {
                                                              safeSetState(() =>
                                                                  _model.switchListTileprintBtnAfterPayValue =
                                                                      newValue!);
                                                            },
                                                            title: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'mas3z14e' /* 6.SHOW PRINT BUTTON AFTER PAY */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            dense: false,
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .trailing,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 0.5,
                                                          indent: 10.0,
                                                          endIndent: 10.0,
                                                          color:
                                                              Color(0xFFD4D1D1),
                                                        ),
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          child: SwitchListTile(
                                                            value: _model
                                                                    .switchListTileenableUpiBtnValue ??=
                                                                containerAppSettingsRecord!
                                                                    .upiButton,
                                                            onChanged:
                                                                (newValue) async {
                                                              safeSetState(() =>
                                                                  _model.switchListTileenableUpiBtnValue =
                                                                      newValue!);
                                                            },
                                                            title: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'ebs07t7g' /* 7.ENABLE UPI BUTTON */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            dense: false,
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .trailing,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 0.5,
                                                          indent: 10.0,
                                                          endIndent: 10.0,
                                                          color:
                                                              Color(0xFFC1C1C1),
                                                        ),
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          child: SwitchListTile(
                                                            value: _model
                                                                    .switchListTilethreeCharValue ??=
                                                                containerAppSettingsRecord!
                                                                    .threeCharSearch,
                                                            onChanged:
                                                                (newValue) async {
                                                              safeSetState(() =>
                                                                  _model.switchListTilethreeCharValue =
                                                                      newValue!);
                                                            },
                                                            title: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'dj3gmh3z' /* 8.ENABLE THREE CHARECTER  SEAR... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            dense: false,
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .trailing,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'dtjmmr95' /* ADVANCE SETTING */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmallFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily),
                                                      ),
                                                ),
                                              ),
                                              Divider(
                                                thickness: 1.0,
                                                indent: 10.0,
                                                endIndent: 10.0,
                                                color: Color(0xFFD4D1D1),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ListView(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableExpandableController5,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              15.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'd7k97oy3' /* TAX SETTING */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                collapsed:
                                                                    Container(),
                                                                expanded:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTileincluOrReverseTaxValue ??=
                                                                              containerAppSettingsRecord!.inclusiveTax,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTileincluOrReverseTaxValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              's8smze4l' /* 1.INCLUSIVE / REVERSE TAX */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTileSaleWithTaxValue ??=
                                                                              containerAppSettingsRecord!.allowSaleWithoutTax,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTileSaleWithTaxValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'je8fmovo' /* 2.ALLOW SALE WITHOUT TAX */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableExpandableController6,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              15.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'hv47yjgh' /* TABLE SETTING */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                collapsed:
                                                                    Container(),
                                                                expanded:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTileenableTableValue ??=
                                                                              containerAppSettingsRecord!.tables,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTileenableTableValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'g9d51xrs' /* 1.ENABLE TABLE */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTileCaptonDetailAtBillCreationValue ??=
                                                                              containerAppSettingsRecord!.captainDetails,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTileCaptonDetailAtBillCreationValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '3p6obccu' /* 2.ADD CAPTAIN DETAILS AT BILL ... */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTileenabletableForcefullyValue ??=
                                                                              containerAppSettingsRecord!.tableForcefully,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTileenabletableForcefullyValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              's8wurnms' /* 3.ENABLE TABLE FORCEFULLY */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTileCaptonReqestValue ??=
                                                                              containerAppSettingsRecord!.captainRequest,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTileCaptonReqestValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'a3lhpbds' /* 4.CAPTAIN REQUEST */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTilewLanCommunicationValue ??=
                                                                              containerAppSettingsRecord!.wlanCommunication,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTilewLanCommunicationValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              's6nw0z2p' /* 5. ENABLE WLAN COMMUNICATION */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTilecheckInOutValue ??=
                                                                              containerAppSettingsRecord!.checkInCheckOut,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTilecheckInOutValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'dzrawbej' /* 6.ENABLE CHECK-IN/CHECK-OUT */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableExpandableController7,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              15.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '5goytx2e' /* SALESMAN SETTING */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                collapsed:
                                                                    Container(),
                                                                expanded:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTileenableSmanValue ??=
                                                                                containerAppSettingsRecord!.salesman,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTileenableSmanValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'vmsod1xm' /* 1.ENABLE SALESMAN */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          indent:
                                                                              10.0,
                                                                          endIndent:
                                                                              10.0,
                                                                          color:
                                                                              Color(0xFFD4D1D1),
                                                                        ),
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTilesalesmanForcefullyValue ??=
                                                                                containerAppSettingsRecord!.salesmanForcefully,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTilesalesmanForcefullyValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '91vws20w' /* 2.ENABLE SALESMAN FORCEFULLY */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          indent:
                                                                              10.0,
                                                                          endIndent:
                                                                              10.0,
                                                                          color:
                                                                              Color(0xFFD4D1D1),
                                                                        ),
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTilesalesmanProductWiseValue ??=
                                                                                containerAppSettingsRecord!.salesmanProductWise,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTilesalesmanProductWiseValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'mtxv3zt7' /* 3.ENABLE SALESMAN PRODUCT-WISE */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableExpandableController8,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              15.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1tvpj465' /* COUPON SETTING */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                collapsed:
                                                                    Container(),
                                                                expanded:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTilecouponSaveBillValue ??=
                                                                                containerAppSettingsRecord!.couponSaveBill,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTilecouponSaveBillValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'h7rbgnjm' /* 1.ENABLE COUPON SAVE BILL */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          indent:
                                                                              10.0,
                                                                          endIndent:
                                                                              10.0,
                                                                          color:
                                                                              Color(0xFFD4D1D1),
                                                                        ),
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTilecouponPrintBillValue ??=
                                                                                containerAppSettingsRecord!.couponPrintBill,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTilecouponPrintBillValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'vh4hv06e' /* 2.ENABLE COUPON PRINT BILL */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          indent:
                                                                              10.0,
                                                                          endIndent:
                                                                              10.0,
                                                                          color:
                                                                              Color(0xFFD4D1D1),
                                                                        ),
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile(
                                                                            value: _model.switchListTilecouponOrKotHeaderValue ??=
                                                                                containerAppSettingsRecord!.couponKotHeader,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.switchListTilecouponOrKotHeaderValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'ww6q9i4z' /* 3.ENABLE COUPON/KOT HEADER ON ... */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableExpandableController9,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              15.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'pusql1f4' /* KOT SETTING */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                collapsed:
                                                                    Container(),
                                                                expanded:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTilekotRePrintValue ??=
                                                                              containerAppSettingsRecord!.kotReprint,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTilekotRePrintValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'pkncjtkq' /* 1.ENABLE KOT RE-PRINT */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTilekotPrintAmountColumnValue ??=
                                                                              containerAppSettingsRecord!.kotPrintAmountColumn,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTilekotPrintAmountColumnValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '87clnngp' /* 2.ENABLE KOT PRINT-AMOUNT COLU... */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTilekotRemarkValue ??=
                                                                              containerAppSettingsRecord!.kotRemark,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTilekotRemarkValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '01o7lw52' /* 3.ENABLE KOT REMARK */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTiledisableSaveKotValue ??=
                                                                              containerAppSettingsRecord!.saveKot,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTiledisableSaveKotValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '1nd21t1p' /* 4.DISABLE SAVE KOT */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableExpandableController10,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              15.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '0tppqpbi' /* RFID SETTING */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                collapsed:
                                                                    Container(),
                                                                expanded:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTilerfidMasterReadValue ??=
                                                                              containerAppSettingsRecord!.rfidMasterRead,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTilerfidMasterReadValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'zwt8bkek' /* 1.ENABLE RFID MASTER(READ) */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTilerfidmasterWrtValue ??=
                                                                              containerAppSettingsRecord!.rfidMasterWrite,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTilerfidmasterWrtValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'miskluib' /* 2.ENABLE RFID MASTER(WRITE) */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            color: Color(
                                                                0x00000000),
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableExpandableController11,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              15.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '4mplls0l' /* PRODUCT SETTING */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                collapsed:
                                                                    Container(),
                                                                expanded:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTileshowProductImgValue ??=
                                                                              containerAppSettingsRecord!.showProductImage,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTileshowProductImgValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '33vp99mm' /* 1.SHOW PRODUCT IMAGE */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTilehideProductSearchCodeValue ??=
                                                                              containerAppSettingsRecord!.hideProductSearchCode,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTilehideProductSearchCodeValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'hvy2v6iu' /* 2.HIDE PRODUCT SEARCH CODE */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTileproductListTypeEnableValue ??=
                                                                              false,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTileproductListTypeEnableValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '55obatei' /* 3.PRODUCT LIST TYPE ENABLE */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTileproductSuggREportValue ??=
                                                                              containerAppSettingsRecord!.productSuggestionRemove,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTileproductSuggREportValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'htzgmw8v' /* 4.PRODUCT SUGGESION REMOVE */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            color: Color(
                                                                0x00000000),
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableExpandableController12,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              15.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'n1qto9rg' /* BILL SETTING */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                collapsed:
                                                                    Container(),
                                                                expanded:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTileestBillSettlementValue ??=
                                                                              containerAppSettingsRecord!.billSettlement,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTileestBillSettlementValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'r9wkmivd' /* 1.ESTIMATE BILL SETTELEMENT */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).unfocus(),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: ResetBillWidget(),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.1,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '6ly7d64a' /*  2.RESET BILL NUMBER */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTilesendbillFormatToEmailValue ??=
                                                                              containerAppSettingsRecord!.billFormatSendToEmail,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTilesendbillFormatToEmailValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'bxcoz6zz' /* 3.SEND BILL FORMAT TO EMAIL */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            10.0,
                                                                        endIndent:
                                                                            10.0,
                                                                        color: Color(
                                                                            0xFFD4D1D1),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            SwitchListTile(
                                                                          value: _model.switchListTileEnableDisToDirectlyAddBillValue ??=
                                                                              containerAppSettingsRecord!.discountToBill,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchListTileEnableDisToDirectlyAddBillValue = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '6ra55ec7' /* 4.ENABLE DISCOUNT TO DIRECTLY ... */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              Color(0xFFF5F5F5),
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: SwitchListTile(
                                                        value: _model
                                                                .switchListTilemanualPriceValue ??=
                                                            containerAppSettingsRecord!
                                                                .manualPrice,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.switchListTilemanualPriceValue =
                                                                  newValue!);
                                                        },
                                                        title: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'lzq7q90q' /* 9.ENABLE MANUAL PRICE */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      indent: 10.0,
                                                      endIndent: 10.0,
                                                      color: Color(0xFFD4D1D1),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: SwitchListTile(
                                                        value: _model
                                                                .switchListTileestimateModeValue ??=
                                                            containerAppSettingsRecord!
                                                                .estimateMode,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.switchListTileestimateModeValue =
                                                                  newValue!);
                                                        },
                                                        title: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '11rcddij' /* 10.ESTIMATE MODE ENABLE/DISABL... */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      indent: 10.0,
                                                      endIndent: 10.0,
                                                      color: Color(0xFFD4D1D1),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: SwitchListTile(
                                                        value: _model
                                                                .switchListTileeditingInSettelementValue ??=
                                                            containerAppSettingsRecord!
                                                                .editingSettlement,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.switchListTileeditingInSettelementValue =
                                                                  newValue!);
                                                        },
                                                        title: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '21tqnevj' /* 11.ENABLE EDITING IN SETTELEME... */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      indent: 10.0,
                                                      endIndent: 10.0,
                                                      color: Color(0xFFD4D1D1),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: SwitchListTile(
                                                        value: _model
                                                                .switchListTileopenPriceValue ??=
                                                            containerAppSettingsRecord!
                                                                .openPrice,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.switchListTileopenPriceValue =
                                                                  newValue!);
                                                        },
                                                        title: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'm8d64umv' /* 12.ENABLE OPEN PRICE */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      indent: 10.0,
                                                      endIndent: 10.0,
                                                      color: Color(0xFFD4D1D1),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  5.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.1,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Row(
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
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'w9i73872' /* 13.PRODUCT LIST TYPE */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                            FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .dropDownValueController2 ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: [
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '7o7d69el' /* STANDARD */,
                                                                ),
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'vsqvqsn7' /* MEDIUM */,
                                                                ),
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'amwilxwz' /* SMALL */,
                                                                )
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.dropDownValue2 =
                                                                          val),
                                                              width: 240.0,
                                                              height: 50.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'puxu1axz' /* PLEASE SELECT */,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderWidth: 0.0,
                                                              borderRadius: 0.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          4.0,
                                                                          12.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      indent: 10.0,
                                                      endIndent: 10.0,
                                                      color: Color(0xFFD4D1D1),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: SwitchListTile(
                                                        value: _model
                                                                .switchListTilecomboPriceUpdateValue ??=
                                                            containerAppSettingsRecord!
                                                                .comboPriceUpdate,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.switchListTilecomboPriceUpdateValue =
                                                                  newValue!);
                                                        },
                                                        title: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'im4lja6i' /* 15.ENABLE COMBO PRICE UPDATE */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      indent: 10.0,
                                                      endIndent: 10.0,
                                                      color: Color(0xFFD4D1D1),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: SwitchListTile(
                                                        value: _model
                                                                .switchListTileonlineOrderSystemValue ??=
                                                            containerAppSettingsRecord!
                                                                .onlineOrderSystem,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.switchListTileonlineOrderSystemValue =
                                                                  newValue!);
                                                        },
                                                        title: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'gmicrari' /* 16.ENABLE ONLINE ORDER SYSTEM */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      indent: 10.0,
                                                      endIndent: 10.0,
                                                      color: Color(0xFFD4D1D1),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: SwitchListTile(
                                                        value: _model
                                                                .switchListTilebillModificationValue ??=
                                                            containerAppSettingsRecord!
                                                                .billModificationtoUser,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.switchListTilebillModificationValue =
                                                                  newValue!);
                                                        },
                                                        title: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '53flgvwx' /* 17.BILL MODIFICATION (USER) */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      indent: 10.0,
                                                      endIndent: 10.0,
                                                      color: Color(0xFFD4D1D1),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: SwitchListTile(
                                                        value: _model
                                                                .switchListTileenableStoreValue ??=
                                                            containerAppSettingsRecord!
                                                                .store,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.switchListTileenableStoreValue =
                                                                  newValue!);
                                                        },
                                                        title: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'uxhcdqey' /* 18. ENABLE STORE */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      indent: 10.0,
                                                      endIndent: 10.0,
                                                      color: Color(0xFFD4D1D1),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: SwitchListTile(
                                                        value: _model
                                                                .switchListTileweightMinusValue ??=
                                                            containerAppSettingsRecord!
                                                                .weightMinus,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.switchListTileweightMinusValue =
                                                                  newValue!);
                                                        },
                                                        title: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'b25kik9g' /* 19. ENABLE WEGHT MINUS */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily),
                                                              ),
                                                        ),
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      indent: 10.0,
                                                      endIndent: 10.0,
                                                      color: Color(0xFFD4D1D1),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: SwitchListTile(
                                                        value: _model
                                                                .switchListTilestockgettinginminusValue ??=
                                                            containerAppSettingsRecord!
                                                                .stockGettingMinus,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.switchListTilestockgettinginminusValue =
                                                                  newValue!);
                                                        },
                                                        title: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'pyf3e69s' /* 20. ENABLE STOCK GETTING IN MI... */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      indent: 10.0,
                                                      endIndent: 10.0,
                                                      color: Color(0xFFD4D1D1),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: SwitchListTile(
                                                        value: _model
                                                                .switchListTileDeliveryDateValue ??=
                                                            containerAppSettingsRecord!
                                                                .deliveryNote,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.switchListTileDeliveryDateValue =
                                                                  newValue!);
                                                        },
                                                        title: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '8l08tex1' /* 21.ENABLE A4 DELIVERY NOTE */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      indent: 10.0,
                                                      endIndent: 10.0,
                                                      color: Color(0xFFD4D1D1),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: SwitchListTile(
                                                        value: _model
                                                                .switchListTileHideKeybordValue ??=
                                                            containerAppSettingsRecord!
                                                                .deliveryNote,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.switchListTileHideKeybordValue =
                                                                  newValue!);
                                                        },
                                                        title: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'wgwzb8zd' /* 22.HIDE KEYBOARD */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          if (FFAppState().showAppSettings != true)
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      var appSettingsRecordReference =
                                          AppSettingsRecord.createDoc(
                                              FFAppState().outletIdRef!);
                                      await appSettingsRecordReference
                                          .set(createAppSettingsRecordData(
                                        saveButton: true,
                                        billSettlement: false,
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
                                      ));
                                      _model.doc =
                                          AppSettingsRecord.getDocumentFromData(
                                              createAppSettingsRecordData(
                                                saveButton: true,
                                                billSettlement: false,
                                                allowSaleWithoutTax: false,
                                                askCustomerInBillCreation:
                                                    false,
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
                                                columnProductNameAndQtyPrint:
                                                    false,
                                                dontPrintBillnoInbill: false,
                                                dontPrintRateColumn: false,
                                              ),
                                              appSettingsRecordReference);
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('App Settings'),
                                            content: Text(
                                                'Default app Settings are created'),
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
                                      FFAppState().showAppSettings = true;
                                      FFAppState().update(() {});

                                      safeSetState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'f4hwledx' /* Generate Defaualt settings */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 210.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
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
        ));
  }
}
