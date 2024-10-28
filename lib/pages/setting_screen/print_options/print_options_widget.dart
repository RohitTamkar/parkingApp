import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'print_options_model.dart';
export 'print_options_model.dart';

class PrintOptionsWidget extends StatefulWidget {
  const PrintOptionsWidget({super.key});

  @override
  State<PrintOptionsWidget> createState() => _PrintOptionsWidgetState();
}

class _PrintOptionsWidgetState extends State<PrintOptionsWidget> {
  late PrintOptionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrintOptionsModel());

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController2 =
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
        title: 'PrintOptions',
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
                                      context.pushNamed('SettingHomepage');
                                    },
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '0vq0qiwg' /* Print Option */,
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
                          StreamBuilder<List<PrintSettingsRecord>>(
                            stream: queryPrintSettingsRecord(
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
                              List<PrintSettingsRecord>
                                  containerMainPrintSettingsRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final containerMainPrintSettingsRecord =
                                  containerMainPrintSettingsRecordList
                                          .isNotEmpty
                                      ? containerMainPrintSettingsRecordList
                                          .first
                                      : null;

                              return Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.11,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    7.0, 7.0, 15.0, 7.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await containerMainPrintSettingsRecord!
                                                    .reference
                                                    .update(
                                                        createPrintSettingsRecordData(
                                                  barcodeOnBill: _model
                                                      .switchListTilebarcodeOnBillValue,
                                                  billRemark: _model
                                                      .switchListTileenableBillRemarkValue,
                                                  cgstSgstOnBill: _model
                                                      .switchListTilecgstAndSgstOnBillValue,
                                                  dontPrintBillnoInbill: _model
                                                      .switchListTiledontPrintBillNumberValue,
                                                  dontPrintRateColumn: _model
                                                      .switchListTiledontPrintRateColumnValue,
                                                  columnProductNameAndQtyPrint:
                                                      _model
                                                          .switchListTileColumnProductNameAndQtyValue,
                                                  dontPrintSerialNoInbill: _model
                                                      .switchListTiledontPrintSerialNoValue,
                                                  dontPrintTaxInvoiceOnBill: _model
                                                      .switchListTiledontPrintTaxInvoiceValue,
                                                  doubleprint: _model
                                                      .switchListTiledoublePrintValue,
                                                  duplicateBill: _model
                                                      .switchListTileduplicateBillValue,
                                                  billPrintingServicesPointWise:
                                                      _model
                                                          .switchListTilebillPrintServicePointWiseValue,
                                                  largeBillFont: _model
                                                      .switchListTilelargeBillFontValue,
                                                  signatureInBill: _model
                                                      .switchListTilesignatureBillValue,
                                                  fontBoldNetTotal: _model
                                                      .switchListTilefontBoldNetTotalValue,
                                                  gstBreakUpOnBill: _model
                                                      .switchListTiledontPrintGstBreakupOnBillValue,
                                                  hsnNumber: _model
                                                      .switchListTilehsnNumberValue,
                                                  paymentModePrint: _model
                                                      .switchListTilepayModeInBillValue,
                                                  printConsolidateTax: _model
                                                      .switchListTileprintConsolidateTaxValue,
                                                  printDiscountOnBill: _model
                                                      .switchListTileprintDiscountOnBillValue,
                                                  printMrpPrice: _model
                                                      .switchListTileenableMrpPriceColumnValue,
                                                  printUnitTypeOnBill: _model
                                                      .switchListTileunitTypeOnBillValue,
                                                  printUserNameInBill: _model
                                                      .switchListTileuserNameOnBillValue,
                                                  productSerialNumber: _model
                                                      .switchListTileproductSerialNumberValue,
                                                  regionalBillPrint: _model
                                                      .switchListTileregionalBillPrintlValue,
                                                  regionalKOTPrint: _model
                                                      .switchListTileregionalKotPrintValue,
                                                  saveMRPinBill: _model
                                                      .switchListTileenableSavedMrpValue,
                                                  totalQtyInBill: _model
                                                      .switchListTiletotalQtyOnBillValue,
                                                  trimNameForSingleLine: _model
                                                      .switchListTiletrimProductNameForSingleLineValue,
                                                  billAmountInWords: _model
                                                      .switchListTilebillAmountInWordValue,
                                                  couponKotSummary:
                                                      containerMainPrintSettingsRecord
                                                          ?.couponKotSummary,
                                                ));
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '93rstzd9' /* Apply changes */,
                                              ),
                                              icon: Icon(
                                                Icons.track_changes,
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
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                    BorderRadius.circular(0.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.65,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ListView(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFE9FEFF),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    child: ExpandableNotifier(
                                                      controller: _model
                                                          .expandableExpandableController1,
                                                      child: ExpandablePanel(
                                                        header: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '3zshqywp' /* TAX SETTING */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        collapsed: Container(),
                                                        expanded: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                                  value: _model
                                                                          .switchListTileprintConsolidateTaxValue ??=
                                                                      containerMainPrintSettingsRecord!
                                                                          .printConsolidateTax,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    safeSetState(() =>
                                                                        _model.switchListTileprintConsolidateTaxValue =
                                                                            newValue!);
                                                                  },
                                                                  title: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      't9ua3o0n' /* 1. ENABLE PRINT CONSOLIDATE TA... */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                  ),
                                                                  tileColor: Color(
                                                                      0xFFF5F5F5),
                                                                  dense: true,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .trailing,
                                                                ),
                                                              ),
                                                              Divider(
                                                                thickness: 0.5,
                                                                indent: 10.0,
                                                                endIndent: 10.0,
                                                                color: Color(
                                                                    0xFFD4D1D1),
                                                              ),
                                                              Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child:
                                                                    SwitchListTile(
                                                                  value: _model
                                                                          .switchListTiledontPrintTaxInvoiceValue ??=
                                                                      containerMainPrintSettingsRecord!
                                                                          .dontPrintTaxInvoiceOnBill,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    safeSetState(() =>
                                                                        _model.switchListTiledontPrintTaxInvoiceValue =
                                                                            newValue!);
                                                                  },
                                                                  title: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'qb8q9vcl' /* 2.ENABLE DONT PRINT TAX INVOIC... */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                  ),
                                                                  tileColor: Color(
                                                                      0xFFF5F5F5),
                                                                  dense: true,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .trailing,
                                                                ),
                                                              ),
                                                              Divider(
                                                                thickness: 0.5,
                                                                indent: 10.0,
                                                                endIndent: 10.0,
                                                                color: Color(
                                                                    0xFFD4D1D1),
                                                              ),
                                                              Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child:
                                                                    SwitchListTile(
                                                                  value: _model
                                                                          .switchListTilecgstAndSgstOnBillValue ??=
                                                                      containerMainPrintSettingsRecord!
                                                                          .cgstSgstOnBill,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    safeSetState(() =>
                                                                        _model.switchListTilecgstAndSgstOnBillValue =
                                                                            newValue!);
                                                                  },
                                                                  title: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'n5q1ogr0' /* 3.ENABLE CGST AND  SGST ON BIL... */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                  ),
                                                                  tileColor: Color(
                                                                      0xFFF5F5F5),
                                                                  dense: true,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .trailing,
                                                                ),
                                                              ),
                                                              Divider(
                                                                thickness: 0.5,
                                                                indent: 10.0,
                                                                endIndent: 10.0,
                                                                color: Color(
                                                                    0xFFD4D1D1),
                                                              ),
                                                              Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child:
                                                                    SwitchListTile(
                                                                  value: _model
                                                                          .switchListTiledontPrintGstBreakupOnBillValue ??=
                                                                      containerMainPrintSettingsRecord!
                                                                          .gstBreakUpOnBill,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    safeSetState(() =>
                                                                        _model.switchListTiledontPrintGstBreakupOnBillValue =
                                                                            newValue!);
                                                                  },
                                                                  title: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '3rkqem46' /* 4.DON'T PRINT GST BREAKUP ON B... */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                  ),
                                                                  tileColor: Color(
                                                                      0xFFF5F5F5),
                                                                  dense: true,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .trailing,
                                                                ),
                                                              ),
                                                              Divider(
                                                                thickness: 0.5,
                                                                indent: 10.0,
                                                                endIndent: 10.0,
                                                                color: Color(
                                                                    0xFFD4D1D1),
                                                              ),
                                                              Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child:
                                                                    SwitchListTile(
                                                                  value: _model
                                                                          .switchListTileenableRateColumnValue ??=
                                                                      containerMainPrintSettingsRecord!
                                                                          .dontPrintRateColumn,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    safeSetState(() =>
                                                                        _model.switchListTileenableRateColumnValue =
                                                                            newValue!);
                                                                  },
                                                                  title: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'rj2771nc' /* 5.ENABLE RATE COLUMN ( [-] TAX... */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                  ),
                                                                  tileColor: Color(
                                                                      0xFFF5F5F5),
                                                                  dense: true,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .trailing,
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
                                                  decoration: BoxDecoration(),
                                                  child: Container(
                                                    width: double.infinity,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    child: ExpandableNotifier(
                                                      controller: _model
                                                          .expandableExpandableController2,
                                                      child: ExpandablePanel(
                                                        header: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '126l998x' /* MRP SETTING */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        collapsed: Container(),
                                                        expanded: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                                  value: _model
                                                                          .switchListTileenableSavedMrpValue ??=
                                                                      containerMainPrintSettingsRecord!
                                                                          .saveMRPinBill,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    safeSetState(() =>
                                                                        _model.switchListTileenableSavedMrpValue =
                                                                            newValue!);
                                                                  },
                                                                  title: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1zq9607z' /* 1.ENABLE SAVED MRP BILL */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                  ),
                                                                  tileColor: Color(
                                                                      0xFFF5F5F5),
                                                                  dense: true,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .trailing,
                                                                ),
                                                              ),
                                                              Divider(
                                                                thickness: 0.5,
                                                                indent: 10.0,
                                                                endIndent: 10.0,
                                                                color: Color(
                                                                    0xFFD4D1D1),
                                                              ),
                                                              Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child:
                                                                    SwitchListTile(
                                                                  value: _model
                                                                          .switchListTileenableMrpPriceColumnValue ??=
                                                                      containerMainPrintSettingsRecord!
                                                                          .printMrpPrice,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    safeSetState(() =>
                                                                        _model.switchListTileenableMrpPriceColumnValue =
                                                                            newValue!);
                                                                  },
                                                                  title: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'av6m9arf' /* 2.ENABLE MRP PRICE COLUMN */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                  ),
                                                                  subtitle:
                                                                      Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'tbb2amly' /* [ Ex: QTY,  MRP,  RATE,  AMT ] */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                        ),
                                                                  ),
                                                                  tileColor: Color(
                                                                      0xFFF5F5F5),
                                                                  dense: true,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .trailing,
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
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                              ),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                                      child:
                                                          SingleChildScrollView(
                                                        primary: false,
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
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTilepayModeInBillValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .paymentModePrint,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTilepayModeInBillValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'affh0wdu' /* 1. ENABLE PRINT PAYMENT MODE I... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTileduplicateBillValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .duplicateBill,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTileduplicateBillValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '802x6vzp' /* 2. DUPLICATE BILL ENABLE/DISAB... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTiledoublePrintValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .doubleprint,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTiledoublePrintValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'o0oo0xu9' /* 3. ENABLE DOUBLE PRINT */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTilelargeBillFontValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .largeBillFont,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTilelargeBillFontValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '8199uf35' /* 4.ENABLE LARGE BILL FONT [USB:... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTilebillPrintServicePointWiseValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .billPrintingServicesPointWise,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTilebillPrintServicePointWiseValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'gycs1kb1' /* 5. SENABLE BILL PRINT SERVICES... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTilefontBoldNetTotalValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .fontBoldNetTotal,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTilefontBoldNetTotalValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'zezkzqu1' /* 6.ENABLE FONT BOLD NET TOTAL [... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTilebillAmountInWordValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .billAmountInWords,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTilebillAmountInWordValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '8ys56lau' /* 7.ENABLE BILL AMOUNT IN WORDS */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTilesignatureBillValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .signatureInBill,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTilesignatureBillValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'zz6tcegf' /* 8. ENABLE SIGNATURE BILL */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTileunitTypeOnBillValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .printUnitTypeOnBill,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTileunitTypeOnBillValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'x1r17ezd' /* 9. ENABLE UNIT TYPE ON BILL */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTileuserNameOnBillValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .printUserNameInBill,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTileuserNameOnBillValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ppwpcjxl' /* 10. ENABLE USER NAME ON BILL */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTileregionalBillPrintlValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .regionalBillPrint,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTileregionalBillPrintlValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '4nosn710' /* 11.ENABLE  REGIONAL BILL PRINT... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTileregionalKotPrintValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .regionalKOTPrint,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTileregionalKotPrintValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'xoiklfrn' /* 12. ENABLE REGIONAL KOT PRINT ... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTiledontPrintRateColumnValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .dontPrintRateColumn,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTiledontPrintRateColumnValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'drdso931' /* 13. DONT PRINT RATE COLUMN  */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTiledontPrintSerialNoValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .dontPrintSerialNoInbill,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTiledontPrintSerialNoValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'b94xylst' /* 14. DON'T PRINT SERIAL NO.IN B... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTiledontPrintBillNumberValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .dontPrintBillnoInbill,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTiledontPrintBillNumberValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'kk8x0ofr' /* 15.DONT PRINT BILL NO.IN BILL */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTileenableBillRemarkValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .billRemark,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTileenableBillRemarkValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'umckfs5c' /* 16.ENABLE BILL REMARK  */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTileproductSerialNumberValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .productSerialNumber,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTileproductSerialNumberValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '0v4d3wlv' /* 17. ENABLE PRODUCT SERIAL NUMB... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                                ),
                                                                dense: true,
                                                                controlAffinity:
                                                                    ListTileControlAffinity
                                                                        .trailing,
                                                              ),
                                                            ),
                                                            Divider(
                                                              thickness: 0.5,
                                                              indent: 10.0,
                                                              endIndent: 10.0,
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTilehsnNumberValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .hsnNumber,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTilehsnNumberValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '9mpycxyb' /* 18. ENABLE HSN NUMBER */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTiletotalQtyOnBillValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .totalQtyInBill,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTiletotalQtyOnBillValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'cklr5s9x' /* 19. ENABLE TOTAL  QTY ON BILL */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTilebarcodeOnBillValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .barcodeOnBill,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTilebarcodeOnBillValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '1i9pyoqf' /* 20.ENABLE BARCODE ON BILL */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTiletrimProductNameForSingleLineValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .trimNameForSingleLine,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTiletrimProductNameForSingleLineValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '7y1s8xqx' /* 21.ENABLE  TRIM PRODUCT NAME F... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                                ),
                                                                dense: true,
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTileprintDiscountOnBillValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .printDiscountOnBill,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTileprintDiscountOnBillValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'n2azqd3t' /* 22. ENABLE PRINT DISCOUNT ON B... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTilecouponOrKotSummaryValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .couponKotSummary,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTilecouponOrKotSummaryValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'mxgzl7su' /* 23.ENABLE COUPON/ KOT SUMMARY  */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                                ),
                                                                dense: true,
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
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  SwitchListTile(
                                                                value: _model
                                                                        .switchListTileColumnProductNameAndQtyValue ??=
                                                                    containerMainPrintSettingsRecord!
                                                                        .columnProductNameAndQtyPrint,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchListTileColumnProductNameAndQtyValue =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'u1xmptz2' /* 23.ENABLE COLUMN PRODUST NAME ... */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                                ),
                                                                dense: true,
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
                              );
                            },
                          ),
                          if (FFAppState().showPrintSettings != true)
                            Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.91,
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
                                      await PrintSettingsRecord.createDoc(
                                              FFAppState().outletIdRef!)
                                          .set(createPrintSettingsRecordData(
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
                                      ));
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Print Setting'),
                                            content: Text(
                                                'Default Print Settings are created'),
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
                                      FFAppState().showPrintSettings = true;
                                      FFAppState().update(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'kkhd51p8' /* Generate Default Setting */,
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
