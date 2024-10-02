import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'printer_selection_screen_model.dart';
export 'printer_selection_screen_model.dart';

class PrinterSelectionScreenWidget extends StatefulWidget {
  const PrinterSelectionScreenWidget({
    super.key,
    this.docHeaderRef,
  });

  final DocumentReference? docHeaderRef;

  @override
  State<PrinterSelectionScreenWidget> createState() =>
      _PrinterSelectionScreenWidgetState();
}

class _PrinterSelectionScreenWidgetState
    extends State<PrinterSelectionScreenWidget> with TickerProviderStateMixin {
  late PrinterSelectionScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrinterSelectionScreenModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.switchValue = FFAppState().ethernetPrint;
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textFieldTitleFocusNode ??= FocusNode();

    _model.textFieldSubTitleFocusNode ??= FocusNode();

    _model.textFieldAddressFocusNode ??= FocusNode();

    _model.textFieldGstFocusNode ??= FocusNode();

    _model.textFieldContactFocusNode ??= FocusNode();

    _model.textFieldEmailFocusNode ??= FocusNode();

    _model.textFieldSerialNoFocusNode ??= FocusNode();

    _model.textFieldTaxFocusNode ??= FocusNode();

    _model.textFieldBankNameFocusNode ??= FocusNode();

    _model.textFieldBankBranchFocusNode ??= FocusNode();

    _model.textFieldIfscCodeFocusNode ??= FocusNode();

    _model.textFieldACNoFocusNode ??= FocusNode();

    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textFieldFooter2TextController ??= TextEditingController();
    _model.textFieldFooter2FocusNode ??= FocusNode();

    _model.textController17 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController18 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textController19 ??= TextEditingController();
    _model.textFieldFocusNode6 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.textController1?.text = FFLocalizations.of(context).getText(
            'v176zyco' /* 9100 */,
          );
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<FooterRecord>>(
      stream: queryFooterRecord(
        parent: FFAppState().outletIdRef,
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitFadingCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        List<FooterRecord> printerSelectionScreenFooterRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final printerSelectionScreenFooterRecord =
            printerSelectionScreenFooterRecordList.isNotEmpty
                ? printerSelectionScreenFooterRecordList.first
                : null;

        return Title(
            title: 'PrinterSelectionScreen',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    print('FloatingActionButton pressed ...');
                  },
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.print,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      _model.headerDoc = await queryHeaderRecordOnce(
                        parent: FFAppState().outletIdRef,
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      _model.footerdoc2 = await queryFooterRecordOnce(
                        parent: FFAppState().outletIdRef,
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      if (_model.headerDoc != null) {
                        await _model.headerDoc!.reference
                            .update(createHeaderRecordData(
                          title: _model.textFieldTitleTextController.text,
                          address: _model.textFieldAddressTextController.text,
                          gstNo: _model.textFieldGstTextController.text,
                          contactNo: _model.textFieldContactTextController.text,
                          email: _model.textFieldEmailTextController.text,
                          serialNo: _model.textFieldSerialNoTextController.text,
                          taxInvoice: _model.textFieldTaxTextController.text,
                          bankName: _model.textFieldBankNameTextController.text,
                          bankBranch:
                              _model.textFieldBankBranchTextController.text,
                          ifscCode: _model.textFieldIfscCodeTextController.text,
                          accountNumber:
                              _model.textFieldACNoTextController.text,
                          subtitleAddress:
                              _model.textFieldSubTitleTextController.text,
                        ));
                        if (_model.footerdoc2 != null) {
                          await _model.footerdoc2!.reference
                              .update(createFooterRecordData(
                            id: _model.footerdoc2?.reference.id,
                            footerText1: _model.textController15.text,
                            footerText2:
                                _model.textFieldFooter2TextController.text,
                            footerText3: _model.textController17.text,
                            footerText4: _model.textController18.text,
                            footerText5: _model.textController19.text,
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Updated  Successfully',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                            ),
                          );
                        } else {
                          var footerRecordReference1 =
                              FooterRecord.createDoc(FFAppState().outletIdRef!);
                          await footerRecordReference1
                              .set(createFooterRecordData(
                            footerText1: _model.textController15.text,
                            footerText2:
                                _model.textFieldFooter2TextController.text,
                            footerText3: _model.textController17.text,
                            footerText4: _model.textController18.text,
                            footerText5: _model.textController19.text,
                          ));
                          _model.createddocfooter =
                              FooterRecord.getDocumentFromData(
                                  createFooterRecordData(
                                    footerText1: _model.textController15.text,
                                    footerText2: _model
                                        .textFieldFooter2TextController.text,
                                    footerText3: _model.textController17.text,
                                    footerText4: _model.textController18.text,
                                    footerText5: _model.textController19.text,
                                  ),
                                  footerRecordReference1);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Updated  Successfully',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                            ),
                          );
                        }

                        FFAppState().headerList = [];
                        FFAppState().footerList = [];
                        FFAppState().update(() {});
                        FFAppState().bankDetailHeaderList = [];
                        FFAppState().update(() {});
                      } else {
                        var headerRecordReference =
                            HeaderRecord.createDoc(FFAppState().outletIdRef!);
                        await headerRecordReference.set(createHeaderRecordData(
                          title: _model.textFieldTitleTextController.text,
                          address: _model.textFieldAddressTextController.text,
                          gstNo: _model.textFieldGstTextController.text,
                          contactNo: _model.textFieldContactTextController.text,
                          email: _model.textFieldEmailTextController.text,
                          serialNo: _model.textFieldSerialNoTextController.text,
                          taxInvoice: _model.textFieldTaxTextController.text,
                          bankName: _model.textFieldBankNameTextController.text,
                          bankBranch:
                              _model.textFieldBankBranchTextController.text,
                          ifscCode: _model.textFieldIfscCodeTextController.text,
                          accountNumber:
                              _model.textFieldACNoTextController.text,
                          subtitleAddress:
                              _model.textFieldSubTitleTextController.text,
                        ));
                        _model.docHeader = HeaderRecord.getDocumentFromData(
                            createHeaderRecordData(
                              title: _model.textFieldTitleTextController.text,
                              address:
                                  _model.textFieldAddressTextController.text,
                              gstNo: _model.textFieldGstTextController.text,
                              contactNo:
                                  _model.textFieldContactTextController.text,
                              email: _model.textFieldEmailTextController.text,
                              serialNo:
                                  _model.textFieldSerialNoTextController.text,
                              taxInvoice:
                                  _model.textFieldTaxTextController.text,
                              bankName:
                                  _model.textFieldBankNameTextController.text,
                              bankBranch:
                                  _model.textFieldBankBranchTextController.text,
                              ifscCode:
                                  _model.textFieldIfscCodeTextController.text,
                              accountNumber:
                                  _model.textFieldACNoTextController.text,
                              subtitleAddress:
                                  _model.textFieldSubTitleTextController.text,
                            ),
                            headerRecordReference);
                        if (_model.footerdoc2 != null) {
                          await _model.footerdoc2!.reference
                              .update(createFooterRecordData(
                            id: _model.footerdoc2?.reference.id,
                            footerText1: _model.textController15.text,
                            footerText2:
                                _model.textFieldFooter2TextController.text,
                            footerText3: _model.textController17.text,
                            footerText4: _model.textController18.text,
                            footerText5: _model.textController19.text,
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Updated  Successfully',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                            ),
                          );
                        } else {
                          var footerRecordReference2 =
                              FooterRecord.createDoc(FFAppState().outletIdRef!);
                          await footerRecordReference2
                              .set(createFooterRecordData(
                            footerText1: _model.textController15.text,
                            footerText2:
                                _model.textFieldFooter2TextController.text,
                            footerText3: _model.textController17.text,
                            footerText4: _model.textController18.text,
                            footerText5: _model.textController19.text,
                          ));
                          _model.createddocfooter2 =
                              FooterRecord.getDocumentFromData(
                                  createFooterRecordData(
                                    footerText1: _model.textController15.text,
                                    footerText2: _model
                                        .textFieldFooter2TextController.text,
                                    footerText3: _model.textController17.text,
                                    footerText4: _model.textController18.text,
                                    footerText5: _model.textController19.text,
                                  ),
                                  footerRecordReference2);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Updated  Successfully',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                            ),
                          );
                        }

                        FFAppState().headerList = [];
                        FFAppState().footerList = [];
                        FFAppState().update(() {});
                        FFAppState().bankDetailHeaderList = [];
                        FFAppState().update(() {});
                      }

                      _model.selected2 = await actions.newCustomAction(
                        FFAppState().printerIndex,
                      );
                      await actions.printBillPreview(
                        _model.selected2!.toList(),
                        FFAppState().isPrinterConnected,
                        FFAppState().printerName,
                        FFAppState().paperSize,
                      );

                      safeSetState(() {});
                    },
                  ),
                ),
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
                                          context.safePop();
                                        },
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'g0g1uqgs' /* Printer Selection */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 3.0, 0.0, 0.0),
                          child: StreamBuilder<List<HeaderRecord>>(
                            stream: queryHeaderRecord(
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
                              List<HeaderRecord> containerHeaderRecordList =
                                  snapshot.data!;
                              final containerHeaderRecord =
                                  containerHeaderRecordList.isNotEmpty
                                      ? containerHeaderRecordList.first
                                      : null;

                              return Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment(0.0, 0),
                                        child: TabBar(
                                          labelColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          unselectedLabelColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          unselectedLabelStyle: TextStyle(),
                                          indicatorColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                          indicatorWeight: 3.0,
                                          tabs: [
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '8ctd9ojl' /* PRINTER SELECTION */,
                                              ),
                                            ),
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'n4xztl0p' /* HEADER */,
                                              ),
                                            ),
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '0gghyark' /* FOOTER */,
                                              ),
                                            ),
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'ijovelax' /* LOGO */,
                                              ),
                                            ),
                                          ],
                                          controller: _model.tabBarController,
                                          onTap: (i) async {
                                            [
                                              () async {},
                                              () async {},
                                              () async {},
                                              () async {}
                                            ][i]();
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          controller: _model.tabBarController,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.48,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.75,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor1,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  3.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        30.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        45.0,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .wifi,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                                  ),
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        30.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        45.0,
                                                                    disabledColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .customColor1,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .print_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      size:
                                                                          22.0,
                                                                    ),
                                                                    onPressed: FFAppState()
                                                                            .isPrinterConnected
                                                                        ? null
                                                                        : () {
                                                                            print('IconButton pressed ...');
                                                                          },
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'fv49i76k' /* Ethernet Printing */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                            ),
                                                                      ),
                                                                      Switch
                                                                          .adaptive(
                                                                        value: _model
                                                                            .switchValue!,
                                                                        onChanged:
                                                                            (newValue) async {
                                                                          safeSetState(() =>
                                                                              _model.switchValue = newValue!);
                                                                          if (newValue!) {
                                                                            FFAppState().ethernetPrint =
                                                                                true;
                                                                            safeSetState(() {});
                                                                          } else {
                                                                            FFAppState().ethernetPrint =
                                                                                false;
                                                                            safeSetState(() {});
                                                                          }
                                                                        },
                                                                        activeColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        activeTrackColor:
                                                                            FlutterFlowTheme.of(context).tertiary,
                                                                        inactiveTrackColor:
                                                                            FlutterFlowTheme.of(context).error,
                                                                        inactiveThumbColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  if (FFAppState()
                                                                      .ethernetPrint)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.textController1,
                                                                        focusNode:
                                                                            _model.textFieldFocusNode1,
                                                                        autofocus:
                                                                            false,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'rn8ptkbl' /* port... */,
                                                                          ),
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                              ),
                                                                          alignLabelWithHint:
                                                                              true,
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'c0z3xmlp' /* Port */,
                                                                          ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                              ),
                                                                          enabledBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                        validator: _model
                                                                            .textController1Validator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  if (FFAppState()
                                                                      .ethernetPrint)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.textController2,
                                                                        focusNode:
                                                                            _model.textFieldFocusNode2,
                                                                        autofocus:
                                                                            false,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'tupzyjxr' /* IP ADDRESS ... */,
                                                                          ),
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                              ),
                                                                          alignLabelWithHint:
                                                                              true,
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'dvjwfmuq' /* 192.168.0.100 */,
                                                                          ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                              ),
                                                                          enabledBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                        validator: _model
                                                                            .textController2Validator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  if (FFAppState()
                                                                      .ethernetPrint)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          FFAppState().port =
                                                                              valueOrDefault<String>(
                                                                            _model.textController1.text,
                                                                            '9100',
                                                                          );
                                                                          FFAppState().ipAddresss =
                                                                              valueOrDefault<String>(
                                                                            _model.textController2.text,
                                                                            '11111111',
                                                                          );
                                                                          safeSetState(
                                                                              () {});
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'Ethernet Connectd Successfully!',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );
                                                                        },
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          '9p4mv2zp' /* Save */,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              0.0,
                                                                              24.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            3.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ihksw6bi' /* Paper Size */,
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
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child:
                                                                    FlutterFlowDropDown<
                                                                        String>(
                                                                  controller: _model
                                                                          .dropDownValueController1 ??=
                                                                      FormFieldController<
                                                                          String>(
                                                                    _model.dropDownValue1 ??=
                                                                        FFAppState()
                                                                            .paperSize,
                                                                  ),
                                                                  options:
                                                                      FFAppState()
                                                                          .paperSizeList,
                                                                  onChanged: (val) =>
                                                                      safeSetState(() =>
                                                                          _model.dropDownValue1 =
                                                                              val),
                                                                  width: double
                                                                      .infinity,
                                                                  textStyle: FlutterFlowTheme.of(
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
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '866e4u4q' /* Select Paper Size... */,
                                                                  ),
                                                                  icon: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down,
                                                                    size: 15.0,
                                                                  ),
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      2.0,
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor2,
                                                                  borderWidth:
                                                                      0.0,
                                                                  borderRadius:
                                                                      5.0,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  hidesUnderline:
                                                                      true,
                                                                  isSearchable:
                                                                      false,
                                                                  isMultiSelect:
                                                                      false,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            5.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'g1maj5j2' /* Printer Mode */,
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
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                child:
                                                                    FlutterFlowDropDown<
                                                                        String>(
                                                                  controller: _model
                                                                          .dropDownValueController2 ??=
                                                                      FormFieldController<
                                                                          String>(
                                                                    _model.dropDownValue2 ??=
                                                                        FFAppState()
                                                                            .posMode,
                                                                  ),
                                                                  options:
                                                                      FFAppState()
                                                                          .printerTypeList,
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(() =>
                                                                        _model.dropDownValue2 =
                                                                            val);
                                                                    FFAppState()
                                                                            .paperSize =
                                                                        _model
                                                                            .dropDownValue1!;
                                                                    FFAppState()
                                                                            .posMode =
                                                                        _model
                                                                            .dropDownValue2!;
                                                                    safeSetState(
                                                                        () {});
                                                                    _model.resultDevice2 =
                                                                        await actions
                                                                            .scanPrinter(
                                                                      _model
                                                                          .dropDownValue2!,
                                                                    );

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  width: double
                                                                      .infinity,
                                                                  textStyle: FlutterFlowTheme.of(
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
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'efnrt8f8' /* Select printer mode */,
                                                                  ),
                                                                  icon: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down,
                                                                    size: 15.0,
                                                                  ),
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      2.0,
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor2,
                                                                  borderWidth:
                                                                      0.0,
                                                                  borderRadius:
                                                                      5.0,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  hidesUnderline:
                                                                      true,
                                                                  isSearchable:
                                                                      false,
                                                                  isMultiSelect:
                                                                      false,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            5.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '86of77fi' /* Available Device */,
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
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.23,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child:
                                                                      Visibility(
                                                                    visible: FFAppState().posMode !=
                                                                            null &&
                                                                        FFAppState().posMode !=
                                                                            '',
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final printerList = FFAppState()
                                                                            .printerDevice
                                                                            .toList();

                                                                        return ListView
                                                                            .builder(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              printerList.length,
                                                                          itemBuilder:
                                                                              (context, printerListIndex) {
                                                                            final printerListItem =
                                                                                printerList[printerListIndex];
                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      FFAppState().setHoldListColor = getJsonField(
                                                                                        printerListItem,
                                                                                        r'''$.address''',
                                                                                      );
                                                                                      safeSetState(() {});
                                                                                      FFAppState().printerIndex = getJsonField(
                                                                                        printerListItem,
                                                                                        r'''$.address''',
                                                                                      ).toString();
                                                                                      FFAppState().update(() {});
                                                                                      _model.con = await actions.connectDevice(
                                                                                        printerListItem,
                                                                                        getJsonField(
                                                                                          printerListItem,
                                                                                          r'''$.address''',
                                                                                        ).toString(),
                                                                                      );
                                                                                      if (_model.con!) {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Device connected',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: Color(0x00000000),
                                                                                          ),
                                                                                        );
                                                                                        _model.selected = await actions.newCustomAction(
                                                                                          FFAppState().printerIndex,
                                                                                        );
                                                                                        await actions.printBillPreview(
                                                                                          _model.selected!.toList(),
                                                                                          FFAppState().isPrinterConnected,
                                                                                          FFAppState().printerName,
                                                                                          FFAppState().paperSize,
                                                                                        );
                                                                                      } else {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Device not connected',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: Color(0x00000000),
                                                                                          ),
                                                                                        );
                                                                                      }

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 0.3,
                                                                                      height: MediaQuery.sizeOf(context).height * 0.065,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 10.0, 8.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                  child: Icon(
                                                                                                    Icons.print_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  getJsonField(
                                                                                                    printerListItem,
                                                                                                    r'''$.deviceName''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                    child: Icon(
                                                                                                      Icons.location_on,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      size: 15.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    getJsonField(
                                                                                                      printerListItem,
                                                                                                      r'''$.address''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 10.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                                                ),
                                                                                if (FFAppState().setHoldListColor ==
                                                                                    getJsonField(
                                                                                      printerListItem,
                                                                                      r'''$.address''',
                                                                                    ))
                                                                                  FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 30.0,
                                                                                    borderWidth: 1.0,
                                                                                    buttonSize: 60.0,
                                                                                    icon: Icon(
                                                                                      Icons.check_circle,
                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                      size: 30.0,
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      print('IconButton pressed ...');
                                                                                    },
                                                                                  ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      },
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
                                                  Flexible(
                                                    flex: 2,
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.45,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.75,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            if (containerHeaderRecord
                                                                        ?.title !=
                                                                    null &&
                                                                containerHeaderRecord
                                                                        ?.title !=
                                                                    '')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerHeaderRecord
                                                                          ?.title,
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              22.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            if (containerHeaderRecord
                                                                        ?.subtitleAddress !=
                                                                    null &&
                                                                containerHeaderRecord
                                                                        ?.subtitleAddress !=
                                                                    '')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerHeaderRecord
                                                                          ?.subtitleAddress,
                                                                      '0',
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
                                                                ],
                                                              ),
                                                            if (containerHeaderRecord
                                                                        ?.address !=
                                                                    null &&
                                                                containerHeaderRecord
                                                                        ?.address !=
                                                                    '')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerHeaderRecord
                                                                          ?.address,
                                                                      '0',
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
                                                                ],
                                                              ),
                                                            if (containerHeaderRecord
                                                                        ?.gstNo !=
                                                                    null &&
                                                                containerHeaderRecord
                                                                        ?.gstNo !=
                                                                    '')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerHeaderRecord
                                                                          ?.gstNo,
                                                                      '0',
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
                                                                ],
                                                              ),
                                                            if (containerHeaderRecord
                                                                        ?.contactNo !=
                                                                    null &&
                                                                containerHeaderRecord
                                                                        ?.contactNo !=
                                                                    '')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerHeaderRecord
                                                                          ?.contactNo,
                                                                      '0',
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
                                                                ],
                                                              ),
                                                            if (containerHeaderRecord
                                                                        ?.email !=
                                                                    null &&
                                                                containerHeaderRecord
                                                                        ?.email !=
                                                                    '')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerHeaderRecord
                                                                          ?.email,
                                                                      '0',
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
                                                                ],
                                                              ),
                                                            if (containerHeaderRecord
                                                                        ?.serialNo !=
                                                                    null &&
                                                                containerHeaderRecord
                                                                        ?.serialNo !=
                                                                    '')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerHeaderRecord
                                                                          ?.serialNo,
                                                                      '0',
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
                                                                ],
                                                              ),
                                                            if (containerHeaderRecord
                                                                        ?.taxInvoice !=
                                                                    null &&
                                                                containerHeaderRecord
                                                                        ?.taxInvoice !=
                                                                    '')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerHeaderRecord
                                                                          ?.taxInvoice,
                                                                      '0',
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
                                                                ],
                                                              ),
                                                            if (containerHeaderRecord
                                                                        ?.bankName !=
                                                                    null &&
                                                                containerHeaderRecord
                                                                        ?.bankName !=
                                                                    '')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerHeaderRecord
                                                                          ?.bankName,
                                                                      '0',
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
                                                                ],
                                                              ),
                                                            if (containerHeaderRecord
                                                                        ?.bankBranch !=
                                                                    null &&
                                                                containerHeaderRecord
                                                                        ?.bankBranch !=
                                                                    '')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerHeaderRecord
                                                                          ?.bankBranch,
                                                                      '0',
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
                                                                ],
                                                              ),
                                                            if (containerHeaderRecord
                                                                        ?.ifscCode !=
                                                                    null &&
                                                                containerHeaderRecord
                                                                        ?.ifscCode !=
                                                                    '')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerHeaderRecord
                                                                          ?.ifscCode,
                                                                      '0',
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
                                                                ],
                                                              ),
                                                            if (containerHeaderRecord
                                                                        ?.accountNumber !=
                                                                    null &&
                                                                containerHeaderRecord
                                                                        ?.accountNumber !=
                                                                    '')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerHeaderRecord
                                                                          ?.accountNumber,
                                                                      '0',
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
                                                                ],
                                                              ),
                                                            Divider(
                                                              thickness: 0.5,
                                                              indent: 0.0,
                                                              endIndent: 0.0,
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -0.75,
                                                                      0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -0.4,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'b9c9xrul' /* SERIAL NO  */,
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
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.55,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          175.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'vmv716js' /* DATE */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -0.55,
                                                                      0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'f0t5v3l0' /* BILL NO: */,
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
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.55,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          188.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'o36p4y5m' /* TIME */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(
                                                              thickness: 0.5,
                                                              indent: 0.0,
                                                              endIndent: 0.0,
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '5bpgqkeh' /* ITEM NAME */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.55,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            70.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '9chgixek' /* QTY */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodySmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '70vcytdt' /* RATE */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '3gbput77' /* AMT */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 0.5,
                                                              indent: 0.0,
                                                              endIndent: 0.0,
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'd3z5b8p3' /* ITEM 1 */,
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
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.55,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            100.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'o44t9boq' /* 2.00 */,
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
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          32.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'nzqk7bd0' /* 10.00 */,
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
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '4lf2nhdz' /* 20.00 */,
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
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 0.5,
                                                              indent: 0.0,
                                                              endIndent: 0.0,
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          37.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'kprrynvp' /* Item : 1 */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          34.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'sbvd0715' /* Sub total : 20.00 */,
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
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 0.5,
                                                              indent: 0.0,
                                                              endIndent: 0.0,
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3.0,
                                                                          0.0,
                                                                          30.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '6g5yq2u1' /* NET : */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              28.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'bke42512' /* 20.00 */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              28.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(
                                                              thickness: 0.5,
                                                              indent: 0.0,
                                                              endIndent: 0.0,
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'eunmg7nj' /* PAYMENT MODE : */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'bbk0pjij' /* CASH */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 0.5,
                                                              indent: 0.0,
                                                              endIndent: 0.0,
                                                              color: Color(
                                                                  0xFFD4D1D1),
                                                            ),
                                                            if (printerSelectionScreenFooterRecord
                                                                        ?.footerText1 !=
                                                                    null &&
                                                                printerSelectionScreenFooterRecord
                                                                        ?.footerText1 !=
                                                                    '')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      printerSelectionScreenFooterRecord
                                                                          ?.footerText1,
                                                                      '0',
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
                                                                ],
                                                              ),
                                                            if (printerSelectionScreenFooterRecord
                                                                        ?.footerText2 !=
                                                                    null &&
                                                                printerSelectionScreenFooterRecord
                                                                        ?.footerText2 !=
                                                                    '')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      printerSelectionScreenFooterRecord
                                                                          ?.footerText2,
                                                                      '0',
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
                                                                ],
                                                              ),
                                                            if (printerSelectionScreenFooterRecord
                                                                        ?.footerText3 !=
                                                                    null &&
                                                                printerSelectionScreenFooterRecord
                                                                        ?.footerText3 !=
                                                                    '')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      printerSelectionScreenFooterRecord
                                                                          ?.footerText3,
                                                                      '0',
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
                                                                ],
                                                              ),
                                                            if (printerSelectionScreenFooterRecord
                                                                        ?.footerText4 !=
                                                                    null &&
                                                                printerSelectionScreenFooterRecord
                                                                        ?.footerText4 !=
                                                                    '')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      printerSelectionScreenFooterRecord
                                                                          ?.footerText4,
                                                                      '0',
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
                                                                ],
                                                              ),
                                                            if (printerSelectionScreenFooterRecord
                                                                        ?.footerText5 !=
                                                                    null &&
                                                                printerSelectionScreenFooterRecord
                                                                        ?.footerText5 !=
                                                                    '')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      printerSelectionScreenFooterRecord
                                                                          ?.footerText5,
                                                                      '0',
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
                                                                ],
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
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
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.55,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.71,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor1,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  3.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.textFieldTitleTextController ??=
                                                                              TextEditingController(
                                                                            text:
                                                                                containerHeaderRecord?.title,
                                                                          ),
                                                                          focusNode:
                                                                              _model.textFieldTitleFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.textFieldTitleTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                          ),
                                                                          onFieldSubmitted:
                                                                              (_) async {
                                                                            FFAppState().addToHeaderList(_model.textFieldTitleTextController.text);
                                                                            FFAppState().update(() {});
                                                                          },
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'c0q1xtww' /* Title */,
                                                                            ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '1drfcs64' /* Title */,
                                                                            ),
                                                                            hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Lora',
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Lora'),
                                                                                ),
                                                                            enabledBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF898686),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            errorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                5.0,
                                                                                5.0,
                                                                                10.0),
                                                                            suffixIcon: _model.textFieldTitleTextController!.text.isNotEmpty
                                                                                ? InkWell(
                                                                                    onTap: () async {
                                                                                      _model.textFieldTitleTextController?.clear();
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.clear,
                                                                                      color: Color(0xFF757575),
                                                                                      size: 22.0,
                                                                                    ),
                                                                                  )
                                                                                : null,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          validator: _model
                                                                              .textFieldTitleTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.3,
                                                                            0.15),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              TextFormField(
                                                                            controller: _model.textFieldSubTitleTextController ??=
                                                                                TextEditingController(
                                                                              text: containerHeaderRecord?.subtitleAddress,
                                                                            ),
                                                                            focusNode:
                                                                                _model.textFieldSubTitleFocusNode,
                                                                            onChanged: (_) =>
                                                                                EasyDebounce.debounce(
                                                                              '_model.textFieldSubTitleTextController',
                                                                              Duration(milliseconds: 2000),
                                                                              () => safeSetState(() {}),
                                                                            ),
                                                                            onFieldSubmitted:
                                                                                (_) async {
                                                                              FFAppState().addToHeaderList(_model.textFieldSubTitleTextController.text);
                                                                              FFAppState().update(() {});
                                                                            },
                                                                            autofocus:
                                                                                false,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              isDense: true,
                                                                              labelText: FFLocalizations.of(context).getText(
                                                                                '401xvfyt' /* Subtitle */,
                                                                              ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                '6fbciy7m' /* Subtitle/Address */,
                                                                              ),
                                                                              enabledBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0xFF898686),
                                                                                  width: 0.5,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              focusedBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 0.5,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              errorBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 0.5,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              focusedErrorBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 0.5,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              contentPadding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 10.0),
                                                                              suffixIcon: _model.textFieldSubTitleTextController!.text.isNotEmpty
                                                                                  ? InkWell(
                                                                                      onTap: () async {
                                                                                        _model.textFieldSubTitleTextController?.clear();
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.clear,
                                                                                        color: Color(0xFF757575),
                                                                                        size: 22.0,
                                                                                      ),
                                                                                    )
                                                                                  : null,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            validator:
                                                                                _model.textFieldSubTitleTextControllerValidator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.3,
                                                                            0.15),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              TextFormField(
                                                                            controller: _model.textFieldAddressTextController ??=
                                                                                TextEditingController(
                                                                              text: containerHeaderRecord?.address,
                                                                            ),
                                                                            focusNode:
                                                                                _model.textFieldAddressFocusNode,
                                                                            onChanged: (_) =>
                                                                                EasyDebounce.debounce(
                                                                              '_model.textFieldAddressTextController',
                                                                              Duration(milliseconds: 2000),
                                                                              () => safeSetState(() {}),
                                                                            ),
                                                                            onFieldSubmitted:
                                                                                (_) async {
                                                                              FFAppState().addToHeaderList(_model.textFieldAddressTextController.text);
                                                                              FFAppState().update(() {});
                                                                            },
                                                                            autofocus:
                                                                                false,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              isDense: true,
                                                                              labelText: FFLocalizations.of(context).getText(
                                                                                '51rhlxn1' /* Address */,
                                                                              ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                '0uj85czr' /* Address */,
                                                                              ),
                                                                              enabledBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0xFF898686),
                                                                                  width: 0.5,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              focusedBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 0.5,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              errorBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 0.5,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              focusedErrorBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 0.5,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              contentPadding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 15.0),
                                                                              suffixIcon: _model.textFieldAddressTextController!.text.isNotEmpty
                                                                                  ? InkWell(
                                                                                      onTap: () async {
                                                                                        _model.textFieldAddressTextController?.clear();
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.clear,
                                                                                        color: Color(0xFF757575),
                                                                                        size: 22.0,
                                                                                      ),
                                                                                    )
                                                                                  : null,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            validator:
                                                                                _model.textFieldAddressTextControllerValidator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.3,
                                                                            0.15),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              TextFormField(
                                                                            controller: _model.textFieldGstTextController ??=
                                                                                TextEditingController(
                                                                              text: containerHeaderRecord?.gstNo,
                                                                            ),
                                                                            focusNode:
                                                                                _model.textFieldGstFocusNode,
                                                                            onChanged: (_) =>
                                                                                EasyDebounce.debounce(
                                                                              '_model.textFieldGstTextController',
                                                                              Duration(milliseconds: 2000),
                                                                              () async {
                                                                                FFAppState().addToHeaderList(_model.textFieldGstTextController.text);
                                                                                FFAppState().update(() {});
                                                                              },
                                                                            ),
                                                                            autofocus:
                                                                                false,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              isDense: true,
                                                                              labelText: FFLocalizations.of(context).getText(
                                                                                'wgnz7shc' /* GST No. */,
                                                                              ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                'pe57w689' /* GST No. */,
                                                                              ),
                                                                              enabledBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0xFF898686),
                                                                                  width: 0.5,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              focusedBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 0.5,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              errorBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 0.5,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              focusedErrorBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 0.5,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              contentPadding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 15.0),
                                                                              suffixIcon: _model.textFieldGstTextController!.text.isNotEmpty
                                                                                  ? InkWell(
                                                                                      onTap: () async {
                                                                                        _model.textFieldGstTextController?.clear();
                                                                                        FFAppState().addToHeaderList(_model.textFieldGstTextController.text);
                                                                                        FFAppState().update(() {});
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.clear,
                                                                                        color: Color(0xFF757575),
                                                                                        size: 22.0,
                                                                                      ),
                                                                                    )
                                                                                  : null,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            validator:
                                                                                _model.textFieldGstTextControllerValidator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.textFieldContactTextController ??=
                                                                              TextEditingController(
                                                                            text:
                                                                                containerHeaderRecord?.contactNo,
                                                                          ),
                                                                          focusNode:
                                                                              _model.textFieldContactFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.textFieldContactTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                          ),
                                                                          onFieldSubmitted:
                                                                              (_) async {
                                                                            FFAppState().addToHeaderList(_model.textFieldContactTextController.text);
                                                                            FFAppState().update(() {});
                                                                          },
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'pmeyj8ue' /* Contact No. */,
                                                                            ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '2meirgv3' /* Contact No. */,
                                                                            ),
                                                                            enabledBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF898686),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            errorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                5.0,
                                                                                5.0,
                                                                                10.0),
                                                                            suffixIcon: _model.textFieldContactTextController!.text.isNotEmpty
                                                                                ? InkWell(
                                                                                    onTap: () async {
                                                                                      _model.textFieldContactTextController?.clear();
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.clear,
                                                                                      color: Color(0xFF757575),
                                                                                      size: 22.0,
                                                                                    ),
                                                                                  )
                                                                                : null,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          validator: _model
                                                                              .textFieldContactTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.3,
                                                                            0.15),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              TextFormField(
                                                                            controller: _model.textFieldEmailTextController ??=
                                                                                TextEditingController(
                                                                              text: containerHeaderRecord?.email,
                                                                            ),
                                                                            focusNode:
                                                                                _model.textFieldEmailFocusNode,
                                                                            onChanged: (_) =>
                                                                                EasyDebounce.debounce(
                                                                              '_model.textFieldEmailTextController',
                                                                              Duration(milliseconds: 2000),
                                                                              () => safeSetState(() {}),
                                                                            ),
                                                                            onFieldSubmitted:
                                                                                (_) async {
                                                                              FFAppState().addToHeaderList(_model.textFieldContactTextController.text);
                                                                              FFAppState().update(() {});
                                                                            },
                                                                            autofocus:
                                                                                false,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              isDense: true,
                                                                              labelText: FFLocalizations.of(context).getText(
                                                                                '7w8xnk9f' /* Email ID */,
                                                                              ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                'xn8glpqn' /* Email ID */,
                                                                              ),
                                                                              enabledBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0xFF898686),
                                                                                  width: 0.5,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              focusedBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 0.5,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              errorBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 0.5,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              focusedErrorBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 0.5,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              contentPadding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 10.0),
                                                                              suffixIcon: _model.textFieldEmailTextController!.text.isNotEmpty
                                                                                  ? InkWell(
                                                                                      onTap: () async {
                                                                                        _model.textFieldEmailTextController?.clear();
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.clear,
                                                                                        color: Color(0xFF757575),
                                                                                        size: 22.0,
                                                                                      ),
                                                                                    )
                                                                                  : null,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            validator:
                                                                                _model.textFieldEmailTextControllerValidator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.textFieldSerialNoTextController ??=
                                                                              TextEditingController(
                                                                            text:
                                                                                containerHeaderRecord?.serialNo,
                                                                          ),
                                                                          focusNode:
                                                                              _model.textFieldSerialNoFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.textFieldSerialNoTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                          ),
                                                                          onFieldSubmitted:
                                                                              (_) async {
                                                                            FFAppState().addToHeaderList(_model.textFieldContactTextController.text);
                                                                            FFAppState().update(() {});
                                                                          },
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '96z5am26' /* SERIAL NO */,
                                                                            ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'p2kjo39i' /* SERIAL NO */,
                                                                            ),
                                                                            enabledBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF898686),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            errorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                5.0,
                                                                                5.0,
                                                                                10.0),
                                                                            suffixIcon: _model.textFieldSerialNoTextController!.text.isNotEmpty
                                                                                ? InkWell(
                                                                                    onTap: () async {
                                                                                      _model.textFieldSerialNoTextController?.clear();
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.clear,
                                                                                      color: Color(0xFF757575),
                                                                                      size: 22.0,
                                                                                    ),
                                                                                  )
                                                                                : null,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          validator: _model
                                                                              .textFieldSerialNoTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.textFieldTaxTextController ??=
                                                                              TextEditingController(
                                                                            text:
                                                                                containerHeaderRecord?.taxInvoice,
                                                                          ),
                                                                          focusNode:
                                                                              _model.textFieldTaxFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.textFieldTaxTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                          ),
                                                                          onFieldSubmitted:
                                                                              (_) async {
                                                                            FFAppState().addToHeaderList(_model.textFieldContactTextController.text);
                                                                            FFAppState().update(() {});
                                                                          },
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '9vx4zn8p' /* TAX INVOICE */,
                                                                            ),
                                                                            enabledBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).lineColor,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            errorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                5.0,
                                                                                5.0,
                                                                                10.0),
                                                                            suffixIcon: _model.textFieldTaxTextController!.text.isNotEmpty
                                                                                ? InkWell(
                                                                                    onTap: () async {
                                                                                      _model.textFieldTaxTextController?.clear();
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.clear,
                                                                                      color: Color(0xFF757575),
                                                                                      size: 22.0,
                                                                                    ),
                                                                                  )
                                                                                : null,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          validator: _model
                                                                              .textFieldTaxTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.textFieldBankNameTextController ??=
                                                                              TextEditingController(
                                                                            text:
                                                                                containerHeaderRecord?.bankName,
                                                                          ),
                                                                          focusNode:
                                                                              _model.textFieldBankNameFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.textFieldBankNameTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                          ),
                                                                          onFieldSubmitted:
                                                                              (_) async {
                                                                            FFAppState().addToHeaderList(_model.textFieldContactTextController.text);
                                                                            FFAppState().update(() {});
                                                                          },
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'zwut2qpg' /* Bank Name */,
                                                                            ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '5s2ed7it' /* Bank Name */,
                                                                            ),
                                                                            enabledBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF898686),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            errorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                5.0,
                                                                                5.0,
                                                                                10.0),
                                                                            suffixIcon: _model.textFieldBankNameTextController!.text.isNotEmpty
                                                                                ? InkWell(
                                                                                    onTap: () async {
                                                                                      _model.textFieldBankNameTextController?.clear();
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.clear,
                                                                                      color: Color(0xFF757575),
                                                                                      size: 22.0,
                                                                                    ),
                                                                                  )
                                                                                : null,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          validator: _model
                                                                              .textFieldBankNameTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.textFieldBankBranchTextController ??=
                                                                              TextEditingController(
                                                                            text:
                                                                                containerHeaderRecord?.bankBranch,
                                                                          ),
                                                                          focusNode:
                                                                              _model.textFieldBankBranchFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.textFieldBankBranchTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                          ),
                                                                          onFieldSubmitted:
                                                                              (_) async {
                                                                            FFAppState().addToHeaderList(_model.textFieldContactTextController.text);
                                                                            FFAppState().update(() {});
                                                                          },
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'sxywrj8i' /* Bank Branch */,
                                                                            ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'gyu4pydz' /* Bank Branch */,
                                                                            ),
                                                                            enabledBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF898686),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            errorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                5.0,
                                                                                5.0,
                                                                                10.0),
                                                                            suffixIcon: _model.textFieldBankBranchTextController!.text.isNotEmpty
                                                                                ? InkWell(
                                                                                    onTap: () async {
                                                                                      _model.textFieldBankBranchTextController?.clear();
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.clear,
                                                                                      color: Color(0xFF757575),
                                                                                      size: 22.0,
                                                                                    ),
                                                                                  )
                                                                                : null,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          validator: _model
                                                                              .textFieldBankBranchTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.textFieldIfscCodeTextController ??=
                                                                              TextEditingController(
                                                                            text:
                                                                                containerHeaderRecord?.ifscCode,
                                                                          ),
                                                                          focusNode:
                                                                              _model.textFieldIfscCodeFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.textFieldIfscCodeTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                          ),
                                                                          onFieldSubmitted:
                                                                              (_) async {
                                                                            FFAppState().addToBankDetailHeaderList(_model.textFieldIfscCodeTextController.text);
                                                                            FFAppState().update(() {});
                                                                          },
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'to9pl971' /* IFSC code */,
                                                                            ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'qaqq5dgu' /* IFSC code */,
                                                                            ),
                                                                            enabledBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF898686),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            errorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                5.0,
                                                                                5.0,
                                                                                10.0),
                                                                            suffixIcon: _model.textFieldIfscCodeTextController!.text.isNotEmpty
                                                                                ? InkWell(
                                                                                    onTap: () async {
                                                                                      _model.textFieldIfscCodeTextController?.clear();
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.clear,
                                                                                      color: Color(0xFF757575),
                                                                                      size: 22.0,
                                                                                    ),
                                                                                  )
                                                                                : null,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          validator: _model
                                                                              .textFieldIfscCodeTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.textFieldACNoTextController ??=
                                                                              TextEditingController(
                                                                            text:
                                                                                containerHeaderRecord?.accountNumber,
                                                                          ),
                                                                          focusNode:
                                                                              _model.textFieldACNoFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.textFieldACNoTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                          ),
                                                                          onFieldSubmitted:
                                                                              (_) async {
                                                                            FFAppState().addToBankDetailHeaderList(_model.textFieldACNoTextController.text);
                                                                            FFAppState().update(() {});
                                                                          },
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '0q2d1hws' /* Account number */,
                                                                            ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'v4e3yz1k' /* Account number */,
                                                                            ),
                                                                            enabledBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF898686),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            errorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 0.5,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                5.0,
                                                                                5.0,
                                                                                10.0),
                                                                            suffixIcon: _model.textFieldACNoTextController!.text.isNotEmpty
                                                                                ? InkWell(
                                                                                    onTap: () async {
                                                                                      _model.textFieldACNoTextController?.clear();
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.clear,
                                                                                      color: Color(0xFF757575),
                                                                                      size: 22.0,
                                                                                    ),
                                                                                  )
                                                                                : null,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          validator: _model
                                                                              .textFieldACNoTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.4,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.71,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -0.9),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  3.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                if (containerHeaderRecord
                                                                            ?.title !=
                                                                        null &&
                                                                    containerHeaderRecord
                                                                            ?.title !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerHeaderRecord
                                                                              ?.title,
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              fontSize: 22.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (containerHeaderRecord
                                                                            ?.subtitleAddress !=
                                                                        null &&
                                                                    containerHeaderRecord
                                                                            ?.subtitleAddress !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerHeaderRecord
                                                                              ?.subtitleAddress,
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (containerHeaderRecord
                                                                            ?.address !=
                                                                        null &&
                                                                    containerHeaderRecord
                                                                            ?.address !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerHeaderRecord
                                                                              ?.address,
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (containerHeaderRecord
                                                                            ?.gstNo !=
                                                                        null &&
                                                                    containerHeaderRecord
                                                                            ?.gstNo !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerHeaderRecord
                                                                              ?.gstNo,
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (containerHeaderRecord
                                                                            ?.contactNo !=
                                                                        null &&
                                                                    containerHeaderRecord
                                                                            ?.contactNo !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerHeaderRecord
                                                                              ?.contactNo,
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (containerHeaderRecord
                                                                            ?.email !=
                                                                        null &&
                                                                    containerHeaderRecord
                                                                            ?.email !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerHeaderRecord
                                                                              ?.email,
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (containerHeaderRecord
                                                                            ?.serialNo !=
                                                                        null &&
                                                                    containerHeaderRecord
                                                                            ?.serialNo !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerHeaderRecord
                                                                              ?.serialNo,
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (containerHeaderRecord
                                                                            ?.taxInvoice !=
                                                                        null &&
                                                                    containerHeaderRecord
                                                                            ?.taxInvoice !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerHeaderRecord
                                                                              ?.taxInvoice,
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (containerHeaderRecord
                                                                            ?.bankName !=
                                                                        null &&
                                                                    containerHeaderRecord
                                                                            ?.bankName !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerHeaderRecord
                                                                              ?.bankName,
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (containerHeaderRecord
                                                                            ?.bankBranch !=
                                                                        null &&
                                                                    containerHeaderRecord
                                                                            ?.bankBranch !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerHeaderRecord
                                                                              ?.bankBranch,
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (containerHeaderRecord
                                                                            ?.ifscCode !=
                                                                        null &&
                                                                    containerHeaderRecord
                                                                            ?.ifscCode !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerHeaderRecord
                                                                              ?.ifscCode,
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (containerHeaderRecord
                                                                            ?.accountNumber !=
                                                                        null &&
                                                                    containerHeaderRecord
                                                                            ?.accountNumber !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerHeaderRecord
                                                                              ?.accountNumber,
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                Divider(
                                                                  thickness:
                                                                      0.5,
                                                                  indent: 0.0,
                                                                  endIndent:
                                                                      0.0,
                                                                  color: Color(
                                                                      0xFFD4D1D1),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -0.75,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -0.4,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '3cdp48t1' /* SERIAL NO  */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.55,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              175.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '3cv2wqbv' /* DATE */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -0.55,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'vy2nmv6i' /* BILL NO: */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.55,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              188.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'gdqbp8or' /* TIME */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  thickness:
                                                                      0.5,
                                                                  indent: 0.0,
                                                                  endIndent:
                                                                      0.0,
                                                                  color: Color(
                                                                      0xFFD4D1D1),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'j1e0d434' /* ITEM NAME */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.55,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            70.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'c3eyqk08' /* QTY */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          30.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'bzt0dz2n' /* RATE */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'l818g9fw' /* AMT */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Divider(
                                                                  thickness:
                                                                      0.5,
                                                                  indent: 0.0,
                                                                  endIndent:
                                                                      0.0,
                                                                  color: Color(
                                                                      0xFFD4D1D1),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '9su9s6xe' /* ITEM 1 */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.55,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            100.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'zwf8k1b8' /* 2.00 */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          32.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'n462t9qv' /* 10.00 */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          30.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'cmdx3wgn' /* 20.00 */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Divider(
                                                                  thickness:
                                                                      0.5,
                                                                  indent: 0.0,
                                                                  endIndent:
                                                                      0.0,
                                                                  color: Color(
                                                                      0xFFD4D1D1),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          37.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'askfjkmo' /* Item : 1 */,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          34.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'opt4cfha' /* Sub total : 20.00 */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Divider(
                                                                  thickness:
                                                                      0.5,
                                                                  indent: 0.0,
                                                                  endIndent:
                                                                      0.0,
                                                                  color: Color(
                                                                      0xFFD4D1D1),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3.0,
                                                                          0.0,
                                                                          30.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'm3f2tksn' /* NET : */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 28.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'l06f79po' /* 20.00 */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 28.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  thickness:
                                                                      0.5,
                                                                  indent: 0.0,
                                                                  endIndent:
                                                                      0.0,
                                                                  color: Color(
                                                                      0xFFD4D1D1),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'kwb3f8i2' /* PAYMENT MODE : */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'a82h598z' /* CASH */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodySmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Divider(
                                                                  thickness:
                                                                      0.5,
                                                                  indent: 0.0,
                                                                  endIndent:
                                                                      0.0,
                                                                  color: Color(
                                                                      0xFFD4D1D1),
                                                                ),
                                                                if (printerSelectionScreenFooterRecord
                                                                            ?.footerText1 !=
                                                                        null &&
                                                                    printerSelectionScreenFooterRecord
                                                                            ?.footerText1 !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          printerSelectionScreenFooterRecord
                                                                              ?.footerText1,
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (printerSelectionScreenFooterRecord
                                                                            ?.footerText2 !=
                                                                        null &&
                                                                    printerSelectionScreenFooterRecord
                                                                            ?.footerText2 !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          printerSelectionScreenFooterRecord
                                                                              ?.footerText2,
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (printerSelectionScreenFooterRecord
                                                                            ?.footerText3 !=
                                                                        null &&
                                                                    printerSelectionScreenFooterRecord
                                                                            ?.footerText3 !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          printerSelectionScreenFooterRecord
                                                                              ?.footerText3,
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (printerSelectionScreenFooterRecord
                                                                            ?.footerText4 !=
                                                                        null &&
                                                                    printerSelectionScreenFooterRecord
                                                                            ?.footerText4 !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          printerSelectionScreenFooterRecord
                                                                              ?.footerText4,
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (printerSelectionScreenFooterRecord
                                                                            ?.footerText5 !=
                                                                        null &&
                                                                    printerSelectionScreenFooterRecord
                                                                            ?.footerText5 !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          printerSelectionScreenFooterRecord
                                                                              ?.footerText5,
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 7.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
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
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.55,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.71,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor1,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  3.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          5.0,
                                                                          5.0),
                                                                  child:
                                                                      FlutterFlowCheckboxGroup(
                                                                    options: [
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'ceusrkmr' /* Do not print footer */,
                                                                      )
                                                                    ],
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.checkboxGroupValues1 =
                                                                                val),
                                                                    controller: _model
                                                                            .checkboxGroupValueController1 ??=
                                                                        FormFieldController<
                                                                            List<String>>(
                                                                      [],
                                                                    ),
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                    checkboxBorderColor:
                                                                        Color(
                                                                            0xFF95A1AC),
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
                                                                    labelPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    initialized:
                                                                        _model.checkboxGroupValues1 !=
                                                                            null,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.3,
                                                                          0.15),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model.textController15 ??=
                                                                              TextEditingController(
                                                                        text: printerSelectionScreenFooterRecord
                                                                            ?.footerText1,
                                                                      ),
                                                                      focusNode:
                                                                          _model
                                                                              .textFieldFocusNode3,
                                                                      onChanged:
                                                                          (_) =>
                                                                              EasyDebounce.debounce(
                                                                        '_model.textController15',
                                                                        Duration(
                                                                            milliseconds:
                                                                                2000),
                                                                        () => safeSetState(
                                                                            () {}),
                                                                      ),
                                                                      autofocus:
                                                                          false,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'z5loohnp' /* **THANK YOU! VISIT AGAIN!** */,
                                                                        ),
                                                                        enabledBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0xFF898686),
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        errorBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            15.0),
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
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      validator: _model
                                                                          .textController15Validator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textFieldFooter2TextController,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldFooter2FocusNode,
                                                                    onChanged: (_) =>
                                                                        EasyDebounce
                                                                            .debounce(
                                                                      '_model.textFieldFooter2TextController',
                                                                      Duration(
                                                                          milliseconds:
                                                                              1000),
                                                                      () => safeSetState(
                                                                          () {}),
                                                                    ),
                                                                    onFieldSubmitted:
                                                                        (_) async {
                                                                      FFAppState().removeFromFooterList(_model
                                                                          .textFieldFooter2TextController
                                                                          .text);
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                    },
                                                                    autofocus:
                                                                        false,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      labelText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'uuk3cmgs' /* Footer text 2 */,
                                                                      ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'aof1sgyc' /* Footer text 2 */,
                                                                      ),
                                                                      enabledBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xFF898686),
                                                                          width:
                                                                              0.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              0.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      errorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              0.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              0.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          10.0),
                                                                      suffixIcon: _model
                                                                              .textFieldFooter2TextController!
                                                                              .text
                                                                              .isNotEmpty
                                                                          ? InkWell(
                                                                              onTap: () async {
                                                                                _model.textFieldFooter2TextController?.clear();
                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Icon(
                                                                                Icons.clear,
                                                                                color: Color(0xFF757575),
                                                                                size: 22.0,
                                                                              ),
                                                                            )
                                                                          : null,
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
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    validator: _model
                                                                        .textFieldFooter2TextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.3,
                                                                          0.15),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            0.0,
                                                                            10.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textController17,
                                                                      focusNode:
                                                                          _model
                                                                              .textFieldFocusNode4,
                                                                      onChanged:
                                                                          (_) =>
                                                                              EasyDebounce.debounce(
                                                                        '_model.textController17',
                                                                        Duration(
                                                                            milliseconds:
                                                                                2000),
                                                                        () => safeSetState(
                                                                            () {}),
                                                                      ),
                                                                      onFieldSubmitted:
                                                                          (_) async {
                                                                        FFAppState().addToFooterList(_model
                                                                            .textController17
                                                                            .text);
                                                                        FFAppState()
                                                                            .update(() {});
                                                                      },
                                                                      autofocus:
                                                                          false,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        labelText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'khef490a' /* Footer text 3 */,
                                                                        ),
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'yh92f3o5' /* Footer text 3 */,
                                                                        ),
                                                                        enabledBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0xFF898686),
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        errorBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            10.0),
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
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      validator: _model
                                                                          .textController17Validator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textController18,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldFocusNode5,
                                                                    onChanged: (_) =>
                                                                        EasyDebounce
                                                                            .debounce(
                                                                      '_model.textController18',
                                                                      Duration(
                                                                          milliseconds:
                                                                              2000),
                                                                      () => safeSetState(
                                                                          () {}),
                                                                    ),
                                                                    onFieldSubmitted:
                                                                        (_) async {
                                                                      FFAppState().addToFooterList(_model
                                                                          .textController18
                                                                          .text);
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                    },
                                                                    autofocus:
                                                                        false,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      labelText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'j4nqvq94' /* Footer text 4 */,
                                                                      ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'picwixpj' /* Footer text 4 */,
                                                                      ),
                                                                      enabledBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xFF898686),
                                                                          width:
                                                                              0.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              0.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      errorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              0.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              0.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          10.0),
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
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    validator: _model
                                                                        .textController18Validator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textController19,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldFocusNode6,
                                                                    onChanged: (_) =>
                                                                        EasyDebounce
                                                                            .debounce(
                                                                      '_model.textController19',
                                                                      Duration(
                                                                          milliseconds:
                                                                              2000),
                                                                      () => safeSetState(
                                                                          () {}),
                                                                    ),
                                                                    onFieldSubmitted:
                                                                        (_) async {
                                                                      FFAppState().addToFooterList(_model
                                                                          .textController19
                                                                          .text);
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                    },
                                                                    autofocus:
                                                                        false,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      labelText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'j5qujezk' /* Footer text 5 */,
                                                                      ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        '1z1cv1ek' /* Footer text 5 */,
                                                                      ),
                                                                      enabledBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xFF898686),
                                                                          width:
                                                                              0.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              0.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      errorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              0.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              0.5,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          10.0),
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
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    validator: _model
                                                                        .textController19Validator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.4,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.71,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor1,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.4,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.71,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .customColor1,
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, -0.9),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(3.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    if (containerHeaderRecord?.title !=
                                                                            null &&
                                                                        containerHeaderRecord?.title !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.title,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontSize: 22.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.subtitleAddress !=
                                                                            null &&
                                                                        containerHeaderRecord?.subtitleAddress !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.subtitleAddress,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.address !=
                                                                            null &&
                                                                        containerHeaderRecord?.address !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.address,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.gstNo !=
                                                                            null &&
                                                                        containerHeaderRecord?.gstNo !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.gstNo,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.contactNo !=
                                                                            null &&
                                                                        containerHeaderRecord?.contactNo !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.contactNo,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.email !=
                                                                            null &&
                                                                        containerHeaderRecord?.email !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.email,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.serialNo !=
                                                                            null &&
                                                                        containerHeaderRecord?.serialNo !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.serialNo,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.taxInvoice !=
                                                                            null &&
                                                                        containerHeaderRecord?.taxInvoice !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.taxInvoice,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.bankName !=
                                                                            null &&
                                                                        containerHeaderRecord?.bankName !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.bankName,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.bankBranch !=
                                                                            null &&
                                                                        containerHeaderRecord?.bankBranch !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.bankBranch,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.ifscCode !=
                                                                            null &&
                                                                        containerHeaderRecord?.ifscCode !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.ifscCode,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.accountNumber !=
                                                                            null &&
                                                                        containerHeaderRecord?.accountNumber !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.accountNumber,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    Divider(
                                                                      thickness:
                                                                          0.5,
                                                                      indent:
                                                                          0.0,
                                                                      endIndent:
                                                                          0.0,
                                                                      color: Color(
                                                                          0xFFD4D1D1),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -0.75,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-0.4, 0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'cupcznth' /* SERIAL NO  */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.55, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(175.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '27eiuj7k' /* DATE */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -0.55,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'zd1hob7m' /* BILL NO: */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.55, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(188.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'gi4h5uwl' /* TIME */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          0.5,
                                                                      indent:
                                                                          0.0,
                                                                      endIndent:
                                                                          0.0,
                                                                      color: Color(
                                                                          0xFFD4D1D1),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'f7ov1t9l' /* ITEM NAME */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.55,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                70.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'e762icwh' /* QTY */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              30.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'hnmu866e' /* RATE */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'ot4t3w7q' /* AMT */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          0.5,
                                                                      indent:
                                                                          0.0,
                                                                      endIndent:
                                                                          0.0,
                                                                      color: Color(
                                                                          0xFFD4D1D1),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'kw3d311t' /* ITEM 1 */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.55,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                100.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'btpa191n' /* 2.00 */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              32.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'zhko5rtn' /* 10.00 */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              30.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '71zb6iws' /* 20.00 */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          0.5,
                                                                      indent:
                                                                          0.0,
                                                                      endIndent:
                                                                          0.0,
                                                                      color: Color(
                                                                          0xFFD4D1D1),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              37.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '6c9oi606' /* Item : 1 */,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              34.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'n0l38ba4' /* Sub total : 20.00 */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          0.5,
                                                                      indent:
                                                                          0.0,
                                                                      endIndent:
                                                                          0.0,
                                                                      color: Color(
                                                                          0xFFD4D1D1),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          3.0,
                                                                          0.0,
                                                                          30.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '1t0ddnzl' /* NET : */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 28.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'jpt8a33r' /* 20.00 */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 28.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          0.5,
                                                                      indent:
                                                                          0.0,
                                                                      endIndent:
                                                                          0.0,
                                                                      color: Color(
                                                                          0xFFD4D1D1),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '25d3h5dz' /* PAYMENT MODE : */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'hpzwprty' /* CASH */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          0.5,
                                                                      indent:
                                                                          0.0,
                                                                      endIndent:
                                                                          0.0,
                                                                      color: Color(
                                                                          0xFFD4D1D1),
                                                                    ),
                                                                    if (printerSelectionScreenFooterRecord?.footerText1 !=
                                                                            null &&
                                                                        printerSelectionScreenFooterRecord?.footerText1 !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              printerSelectionScreenFooterRecord?.footerText1,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (printerSelectionScreenFooterRecord?.footerText2 !=
                                                                            null &&
                                                                        printerSelectionScreenFooterRecord?.footerText2 !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              printerSelectionScreenFooterRecord?.footerText2,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (printerSelectionScreenFooterRecord?.footerText3 !=
                                                                            null &&
                                                                        printerSelectionScreenFooterRecord?.footerText3 !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              printerSelectionScreenFooterRecord?.footerText3,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (printerSelectionScreenFooterRecord?.footerText4 !=
                                                                            null &&
                                                                        printerSelectionScreenFooterRecord?.footerText4 !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              printerSelectionScreenFooterRecord?.footerText4,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (printerSelectionScreenFooterRecord?.footerText5 !=
                                                                            null &&
                                                                        printerSelectionScreenFooterRecord?.footerText5 !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              printerSelectionScreenFooterRecord?.footerText5,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 7.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
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
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.55,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.71,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor1,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  3.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          5.0,
                                                                          5.0),
                                                                  child:
                                                                      FlutterFlowCheckboxGroup(
                                                                    options: [
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'qeakrsl5' /* In Progress   */,
                                                                      )
                                                                    ],
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.checkboxGroupValues2 =
                                                                                val),
                                                                    controller: _model
                                                                            .checkboxGroupValueController2 ??=
                                                                        FormFieldController<
                                                                            List<String>>(
                                                                      [],
                                                                    ),
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                    checkboxBorderColor:
                                                                        Color(
                                                                            0xFF95A1AC),
                                                                    textStyle: FlutterFlowTheme.of(
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
                                                                    labelPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    initialized:
                                                                        _model.checkboxGroupValues2 !=
                                                                            null,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          25.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            160.0,
                                                                        height:
                                                                            160.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).customColor2,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () {
                                                                          print(
                                                                              'ButtonSyncLogo pressed ...');
                                                                        },
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'j113zy8p' /* Sync Logo */,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              180.0,
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                color: FlutterFlowTheme.of(context).lineColor,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBtnText,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
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
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.4,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.71,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor1,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.4,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.71,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .customColor1,
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, -0.9),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(3.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    if (containerHeaderRecord?.title !=
                                                                            null &&
                                                                        containerHeaderRecord?.title !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.title,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontSize: 22.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.subtitleAddress !=
                                                                            null &&
                                                                        containerHeaderRecord?.subtitleAddress !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.subtitleAddress,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.address !=
                                                                            null &&
                                                                        containerHeaderRecord?.address !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.address,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.gstNo !=
                                                                            null &&
                                                                        containerHeaderRecord?.gstNo !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.gstNo,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.contactNo !=
                                                                            null &&
                                                                        containerHeaderRecord?.contactNo !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.contactNo,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.email !=
                                                                            null &&
                                                                        containerHeaderRecord?.email !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.email,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.serialNo !=
                                                                            null &&
                                                                        containerHeaderRecord?.serialNo !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.serialNo,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.taxInvoice !=
                                                                            null &&
                                                                        containerHeaderRecord?.taxInvoice !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.taxInvoice,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.bankName !=
                                                                            null &&
                                                                        containerHeaderRecord?.bankName !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.bankName,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.bankBranch !=
                                                                            null &&
                                                                        containerHeaderRecord?.bankBranch !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.bankBranch,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.ifscCode !=
                                                                            null &&
                                                                        containerHeaderRecord?.ifscCode !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.ifscCode,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (containerHeaderRecord?.accountNumber !=
                                                                            null &&
                                                                        containerHeaderRecord?.accountNumber !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              containerHeaderRecord?.accountNumber,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    Divider(
                                                                      thickness:
                                                                          0.5,
                                                                      indent:
                                                                          0.0,
                                                                      endIndent:
                                                                          0.0,
                                                                      color: Color(
                                                                          0xFFD4D1D1),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -0.75,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-0.4, 0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'gfc3xqaa' /* SERIAL NO  */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.55, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(175.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'anold0qj' /* DATE */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -0.55,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '3tpjnqms' /* BILL NO: */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.55, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(188.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '9d7h3pnd' /* TIME */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          0.5,
                                                                      indent:
                                                                          0.0,
                                                                      endIndent:
                                                                          0.0,
                                                                      color: Color(
                                                                          0xFFD4D1D1),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'u4b40icu' /* ITEM NAME */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.55,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                70.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'lj7czqnl' /* QTY */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              30.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'rwkh9svg' /* RATE */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'ybsjng1b' /* AMT */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          0.5,
                                                                      indent:
                                                                          0.0,
                                                                      endIndent:
                                                                          0.0,
                                                                      color: Color(
                                                                          0xFFD4D1D1),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '6u1inmti' /* ITEM 1 */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.55,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                100.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'fgly5lkm' /* 2.00 */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              32.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '6m6qb1by' /* 10.00 */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              30.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'a1p38s9h' /* 20.00 */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          0.5,
                                                                      indent:
                                                                          0.0,
                                                                      endIndent:
                                                                          0.0,
                                                                      color: Color(
                                                                          0xFFD4D1D1),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              37.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'fjrbcb8k' /* Item : 1 */,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              34.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'sf7b32ys' /* Sub total : 20.00 */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          0.5,
                                                                      indent:
                                                                          0.0,
                                                                      endIndent:
                                                                          0.0,
                                                                      color: Color(
                                                                          0xFFD4D1D1),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          3.0,
                                                                          0.0,
                                                                          30.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'uce3ccvx' /* NET : */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 28.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'tjmtejnk' /* 20.00 */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 28.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          0.5,
                                                                      indent:
                                                                          0.0,
                                                                      endIndent:
                                                                          0.0,
                                                                      color: Color(
                                                                          0xFFD4D1D1),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'cmbsus94' /* PAYMENT MODE : */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'wgjagh9x' /* CASH */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          0.5,
                                                                      indent:
                                                                          0.0,
                                                                      endIndent:
                                                                          0.0,
                                                                      color: Color(
                                                                          0xFFD4D1D1),
                                                                    ),
                                                                    if (printerSelectionScreenFooterRecord?.footerText1 !=
                                                                            null &&
                                                                        printerSelectionScreenFooterRecord?.footerText1 !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              printerSelectionScreenFooterRecord?.footerText1,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (printerSelectionScreenFooterRecord?.footerText2 !=
                                                                            null &&
                                                                        printerSelectionScreenFooterRecord?.footerText2 !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              printerSelectionScreenFooterRecord?.footerText2,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (printerSelectionScreenFooterRecord?.footerText3 !=
                                                                            null &&
                                                                        printerSelectionScreenFooterRecord?.footerText3 !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              printerSelectionScreenFooterRecord?.footerText3,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (printerSelectionScreenFooterRecord?.footerText4 !=
                                                                            null &&
                                                                        printerSelectionScreenFooterRecord?.footerText4 !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              printerSelectionScreenFooterRecord?.footerText4,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (printerSelectionScreenFooterRecord?.footerText5 !=
                                                                            null &&
                                                                        printerSelectionScreenFooterRecord?.footerText5 !=
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              printerSelectionScreenFooterRecord?.footerText5,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
