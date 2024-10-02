import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'editproduct_new_m_model.dart';
export 'editproduct_new_m_model.dart';

class EditproductNewMWidget extends StatefulWidget {
  const EditproductNewMWidget({
    super.key,
    this.codeLen,
    this.proRef,
    this.id,
    this.productDocument,
  });

  final int? codeLen;
  final DocumentReference? proRef;
  final String? id;
  final ProductRecord? productDocument;

  @override
  State<EditproductNewMWidget> createState() => _EditproductNewMWidgetState();
}

class _EditproductNewMWidgetState extends State<EditproductNewMWidget> {
  late EditproductNewMModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditproductNewMModel());

    _model.textFieldCodeFocusNode ??= FocusNode();

    _model.textFieldSellingPriceFocusNode ??= FocusNode();

    _model.textFieldMRPPriceFocusNode ??= FocusNode();

    _model.textFieldPurchasePriceFocusNode ??= FocusNode();

    _model.textFieldRegionalNameFocusNode ??= FocusNode();

    _model.textFieldRecorderLevelFocusNode ??= FocusNode();

    _model.textFieldDiscountPerFocusNode ??= FocusNode();

    _model.textFieldDiscountAmtFocusNode ??= FocusNode();

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.textFieldBarcodeTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().barcode,
      '0',
    ));
    _model.textFieldBarcodeFocusNode ??= FocusNode();

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
        title: 'editproductNewM',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).parkingPrimary,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 100.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
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
                                  context.pushNamed('productListNewM');
                                },
                              ),
                              AutoSizeText(
                                FFLocalizations.of(context).getText(
                                  'm2r8jsjr' /* Edit Vechicle     */,
                                ),
                                textAlign: TextAlign.center,
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
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 45.0,
                                icon: Icon(
                                  Icons.add,
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  size: 0.0,
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
                ),
                Expanded(
                  flex: 24,
                  child: StreamBuilder<List<ProductRecord>>(
                    stream: queryProductRecord(
                      parent: FFAppState().outletIdRef,
                      queryBuilder: (productRecord) => productRecord.where(
                        'id',
                        isEqualTo: widget!.proRef?.id,
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
                      List<ProductRecord> containerProductRecordList =
                          snapshot.data!;
                      final containerProductRecord =
                          containerProductRecordList.isNotEmpty
                              ? containerProductRecordList.first
                              : null;

                      return Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .parkingPrimaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.84,
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 3.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'mwozbcse' /* Code : */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.3,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.05,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: TextFormField(
                                                        controller: _model
                                                                .textFieldCodeTextController ??=
                                                            TextEditingController(
                                                          text:
                                                              containerProductRecord
                                                                  ?.code
                                                                  ?.toString(),
                                                        ),
                                                        focusNode: _model
                                                            .textFieldCodeFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldCodeTextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: true,
                                                        readOnly: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'gap60is2' /* code */,
                                                          ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lora',
                                                                    color: Color(
                                                                        0xFFEDD28A),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            'Lora'),
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      2000.0),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      2000.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      100.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      1.0),
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      2000.0),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      2000.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      100.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      1.0),
                                                            ),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      2000.0),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      2000.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      100.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      1.0),
                                                            ),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      2000.0),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      2000.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      100.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      1.0),
                                                            ),
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: _model
                                                            .textFieldCodeTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.06,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        StreamBuilder<
                                                            List<
                                                                ProductMasterRecord>>(
                                                          stream:
                                                              queryProductMasterRecord(),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  child:
                                                                      SpinKitFadingCircle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 40.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<ProductMasterRecord>
                                                                productDropDownProductMasterRecordList =
                                                                snapshot.data!;

                                                            return FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .productDropDownValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model.productDropDownValue ??=
                                                                    containerProductRecord
                                                                        ?.name,
                                                              ),
                                                              options:
                                                                  productDropDownProductMasterRecordList
                                                                      .map((e) =>
                                                                          e.name)
                                                                      .toList(),
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.productDropDownValue =
                                                                          val),
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.9,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.06,
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
                                                              elevation: 0.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor2,
                                                              borderWidth: 0.0,
                                                              borderRadius:
                                                                  10.0,
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
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                                .textFieldSellingPriceTextController ??=
                                                            TextEditingController(
                                                          text:
                                                              containerProductRecord
                                                                  ?.sellingPrice
                                                                  ?.toString(),
                                                        ),
                                                        focusNode: _model
                                                            .textFieldSellingPriceFocusNode,
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            '0y0ebdba' /*  Price (1 Hr) */,
                                                          ),
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelMediumFamily),
                                                                  ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodySmallFamily),
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                        textAlign:
                                                            TextAlign.center,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: _model
                                                            .textFieldSellingPriceTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                  if (false)
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                                  .textFieldMRPPriceTextController ??=
                                                              TextEditingController(
                                                            text:
                                                                containerProductRecord
                                                                    ?.mrpPrice
                                                                    ?.toString(),
                                                          ),
                                                          focusNode: _model
                                                              .textFieldMRPPriceFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'n3qul1rw' /* MRP Price */,
                                                            ),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelMediumFamily),
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodySmallFamily),
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
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
                                                          textAlign:
                                                              TextAlign.center,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          validator: _model
                                                              .textFieldMRPPriceTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  if (false)
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                                  .textFieldPurchasePriceTextController ??=
                                                              TextEditingController(
                                                            text: containerProductRecord
                                                                ?.purchasePrice
                                                                ?.toString(),
                                                          ),
                                                          focusNode: _model
                                                              .textFieldPurchasePriceFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'dg6ji4if' /* Purchace Price */,
                                                            ),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelMediumFamily),
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
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
                                                          textAlign:
                                                              TextAlign.center,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          validator: _model
                                                              .textFieldPurchasePriceTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'q3mactys' /* Category */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: StreamBuilder<
                                                        CategoryRecord>(
                                                      stream: CategoryRecord
                                                          .getDocument(
                                                              containerProductRecord!
                                                                  .categoryRef!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              child:
                                                                  SpinKitFadingCircle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 40.0,
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        final containerCategoryRecord =
                                                            snapshot.data!;

                                                        return ClipRRect(
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: StreamBuilder<
                                                                List<
                                                                    CategoryRecord>>(
                                                              stream:
                                                                  queryCategoryRecord(
                                                                parent: FFAppState()
                                                                    .outletIdRef,
                                                                queryBuilder:
                                                                    (categoryRecord) =>
                                                                        categoryRecord
                                                                            .where(
                                                                  'type',
                                                                  isEqualTo: 0,
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          40.0,
                                                                      child:
                                                                          SpinKitFadingCircle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            40.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<CategoryRecord>
                                                                    catDropDownCategoryRecordList =
                                                                    snapshot
                                                                        .data!;

                                                                return FlutterFlowDropDown<
                                                                    String>(
                                                                  controller: _model
                                                                          .catDropDownValueController ??=
                                                                      FormFieldController<
                                                                          String>(
                                                                    _model.catDropDownValue ??=
                                                                        containerCategoryRecord
                                                                            .name,
                                                                  ),
                                                                  options: catDropDownCategoryRecordList
                                                                      .map((e) =>
                                                                          e.name)
                                                                      .toList(),
                                                                  onChanged: (val) =>
                                                                      safeSetState(() =>
                                                                          _model.catDropDownValue =
                                                                              val),
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.6,
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
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      2.0,
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderWidth:
                                                                      0.0,
                                                                  borderRadius:
                                                                      10.0,
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
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (false)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: _model
                                                                .textFieldRegionalNameTextController ??=
                                                            TextEditingController(
                                                          text:
                                                              containerProductRecord
                                                                  ?.regionalName,
                                                        ),
                                                        focusNode: _model
                                                            .textFieldRegionalNameFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldRegionalNameTextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'bwzuxnku' /* Regional Name */,
                                                          ),
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelMediumFamily),
                                                                  ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodySmallFamily),
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                        validator: _model
                                                            .textFieldRegionalNameTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                                  .textFieldRecorderLevelTextController ??=
                                                              TextEditingController(
                                                            text: containerProductRecord
                                                                ?.reorderLevel
                                                                ?.toString(),
                                                          ),
                                                          focusNode: _model
                                                              .textFieldRecorderLevelFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textFieldRecorderLevelTextController',
                                                            Duration(
                                                                milliseconds:
                                                                    2000),
                                                            () => safeSetState(
                                                                () {}),
                                                          ),
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'xjie3g9a' /* Reorder Level */,
                                                            ),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelMediumFamily),
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
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
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          validator: _model
                                                              .textFieldRecorderLevelTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (false)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: _model
                                                                .textFieldDiscountPerTextController ??=
                                                            TextEditingController(
                                                          text:
                                                              containerProductRecord
                                                                  ?.discountPer
                                                                  ?.toString(),
                                                        ),
                                                        focusNode: _model
                                                            .textFieldDiscountPerFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldDiscountPerTextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'z8zrxvjv' /* Discount(%) */,
                                                          ),
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelMediumFamily),
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: _model
                                                            .textFieldDiscountPerTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                                  .textFieldDiscountAmtTextController ??=
                                                              TextEditingController(
                                                            text: containerProductRecord
                                                                ?.discountAmt
                                                                ?.toString(),
                                                          ),
                                                          focusNode: _model
                                                              .textFieldDiscountAmtFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textFieldDiscountAmtTextController',
                                                            Duration(
                                                                milliseconds:
                                                                    2000),
                                                            () => safeSetState(
                                                                () {}),
                                                          ),
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'qizja75z' /* Discount (Amt) */,
                                                            ),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelMediumFamily),
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
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
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          validator: _model
                                                              .textFieldDiscountAmtTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (false)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Theme(
                                                        data: ThemeData(
                                                          unselectedWidgetColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .customColor1,
                                                        ),
                                                        child: CheckboxListTile(
                                                          value: _model
                                                                  .wightCheckboValue ??=
                                                              containerProductRecord!
                                                                  .weightable,
                                                          onChanged:
                                                              (newValue) async {
                                                            safeSetState(() =>
                                                                _model.wightCheckboValue =
                                                                    newValue!);
                                                          },
                                                          title: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '13rc0n85' /* Weightable */,
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
                                                          tileColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .customColor1,
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .parkingSecondaryBackground,
                                                          checkColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBtnText,
                                                          dense: true,
                                                          controlAffinity:
                                                              ListTileControlAffinity
                                                                  .leading,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Theme(
                                                        data: ThemeData(
                                                          unselectedWidgetColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .customColor1,
                                                        ),
                                                        child: CheckboxListTile(
                                                          value: _model
                                                                  .stockCheckboxValue ??=
                                                              containerProductRecord!
                                                                  .stockable,
                                                          onChanged:
                                                              (newValue) async {
                                                            safeSetState(() =>
                                                                _model.stockCheckboxValue =
                                                                    newValue!);
                                                          },
                                                          title: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'ayn5thev' /* Stockable */,
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
                                                          tileColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .customColor1,
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .parkingSecondaryBackground,
                                                          checkColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBtnText,
                                                          dense: true,
                                                          controlAffinity:
                                                              ListTileControlAffinity
                                                                  .leading,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (false)
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        child:
                                                            ExpandableNotifier(
                                                          controller: _model
                                                              .expandableExpandableController1,
                                                          child:
                                                              ExpandablePanel(
                                                            header: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'u0g7zmdz' /* More Details */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelLargeFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            collapsed:
                                                                Container(),
                                                            expanded: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
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
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'koygu4ba' /* Sub Category */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            StreamBuilder<List<SubCategoryRecord>>(
                                                                              stream: querySubCategoryRecord(
                                                                                queryBuilder: (subCategoryRecord) => subCategoryRecord.where(
                                                                                  'id',
                                                                                  isEqualTo: containerProductRecord?.subCategoryRefId,
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
                                                                                List<SubCategoryRecord> containerSubCategoryRecordList = snapshot.data!;
                                                                                final containerSubCategoryRecord = containerSubCategoryRecordList.isNotEmpty ? containerSubCategoryRecordList.first : null;

                                                                                return Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.44,
                                                                                  height: MediaQuery.sizeOf(context).height * 0.055,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: StreamBuilder<List<SubCategoryRecord>>(
                                                                                    stream: querySubCategoryRecord(),
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
                                                                                      List<SubCategoryRecord> subDropDownSubCategoryRecordList = snapshot.data!;

                                                                                      return FlutterFlowDropDown<String>(
                                                                                        controller: _model.subDropDownValueController ??= FormFieldController<String>(
                                                                                          _model.subDropDownValue ??= containerSubCategoryRecord != null ? containerSubCategoryRecord?.name : '#',
                                                                                        ),
                                                                                        options: subDropDownSubCategoryRecordList.map((e) => e.name).toList(),
                                                                                        onChanged: (val) => safeSetState(() => _model.subDropDownValue = val),
                                                                                        width: MediaQuery.sizeOf(context).width * 0.6,
                                                                                        height: 50.0,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                            ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).customColor2,
                                                                                        borderWidth: 0.5,
                                                                                        borderRadius: 5.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                        hidesUnderline: true,
                                                                                        isSearchable: false,
                                                                                        isMultiSelect: false,
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'endxs0pa' /* Service point */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          StreamBuilder<
                                                                              List<ServicePointOutletRecord>>(
                                                                            stream:
                                                                                queryServicePointOutletRecord(
                                                                              parent: FFAppState().outletIdRef,
                                                                              queryBuilder: (servicePointOutletRecord) => servicePointOutletRecord.where(
                                                                                'id',
                                                                                isEqualTo: containerProductRecord?.serviceOutletRef?.id,
                                                                              ),
                                                                              singleRecord: true,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<ServicePointOutletRecord> containerServicePointOutletRecordList = snapshot.data!;
                                                                              final containerServicePointOutletRecord = containerServicePointOutletRecordList.isNotEmpty ? containerServicePointOutletRecordList.first : null;

                                                                              return Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.44,
                                                                                height: MediaQuery.sizeOf(context).height * 0.055,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: StreamBuilder<List<ServicePointOutletRecord>>(
                                                                                  stream: queryServicePointOutletRecord(
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
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 40.0,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                    List<ServicePointOutletRecord> serviceDropDownServicePointOutletRecordList = snapshot.data!;

                                                                                    return FlutterFlowDropDown<String>(
                                                                                      controller: _model.serviceDropDownValueController ??= FormFieldController<String>(
                                                                                        _model.serviceDropDownValue ??= containerServicePointOutletRecord != null ? containerServicePointOutletRecord?.name : '#',
                                                                                      ),
                                                                                      options: serviceDropDownServicePointOutletRecordList.map((e) => e.name).toList(),
                                                                                      onChanged: (val) => safeSetState(() => _model.serviceDropDownValue = val),
                                                                                      width: MediaQuery.sizeOf(context).width * 0.6,
                                                                                      height: 50.0,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                          ),
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      elevation: 2.0,
                                                                                      borderColor: FlutterFlowTheme.of(context).customColor2,
                                                                                      borderWidth: 0.5,
                                                                                      borderRadius: 5.0,
                                                                                      margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                      hidesUnderline: true,
                                                                                      isSearchable: false,
                                                                                      isMultiSelect: false,
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
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
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'f7j6ulcz' /* Unit Type */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            StreamBuilder<List<UnitTypeRecord>>(
                                                                              stream: queryUnitTypeRecord(
                                                                                queryBuilder: (unitTypeRecord) => unitTypeRecord.where(
                                                                                  'id',
                                                                                  isEqualTo: containerProductRecord?.unitRef?.id,
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
                                                                                List<UnitTypeRecord> containerUnitTypeRecordList = snapshot.data!;
                                                                                final containerUnitTypeRecord = containerUnitTypeRecordList.isNotEmpty ? containerUnitTypeRecordList.first : null;

                                                                                return Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.44,
                                                                                  height: MediaQuery.sizeOf(context).height * 0.055,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: StreamBuilder<List<UnitTypeRecord>>(
                                                                                    stream: queryUnitTypeRecord(),
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
                                                                                      List<UnitTypeRecord> unitDropDownUnitTypeRecordList = snapshot.data!;

                                                                                      return FlutterFlowDropDown<String>(
                                                                                        controller: _model.unitDropDownValueController ??= FormFieldController<String>(
                                                                                          _model.unitDropDownValue ??= containerUnitTypeRecord != null ? containerUnitTypeRecord?.name : '#',
                                                                                        ),
                                                                                        options: unitDropDownUnitTypeRecordList.map((e) => e.name).toList(),
                                                                                        onChanged: (val) => safeSetState(() => _model.unitDropDownValue = val),
                                                                                        width: MediaQuery.sizeOf(context).width * 0.6,
                                                                                        height: 50.0,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                            ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).customColor2,
                                                                                        borderWidth: 0.5,
                                                                                        borderRadius: 5.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                        hidesUnderline: true,
                                                                                        isSearchable: false,
                                                                                        isMultiSelect: false,
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'hlbk7taq' /* Tax */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          StreamBuilder<
                                                                              List<TaxMasterRecord>>(
                                                                            stream:
                                                                                queryTaxMasterRecord(
                                                                              queryBuilder: (taxMasterRecord) => taxMasterRecord.where(
                                                                                'id',
                                                                                isEqualTo: containerProductRecord?.taxRef?.id,
                                                                              ),
                                                                              singleRecord: true,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<TaxMasterRecord> containerTax1TaxMasterRecordList = snapshot.data!;
                                                                              final containerTax1TaxMasterRecord = containerTax1TaxMasterRecordList.isNotEmpty ? containerTax1TaxMasterRecordList.first : null;

                                                                              return Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.44,
                                                                                height: MediaQuery.sizeOf(context).height * 0.055,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: StreamBuilder<List<TaxMasterRecord>>(
                                                                                  stream: queryTaxMasterRecord(),
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
                                                                                    List<TaxMasterRecord> taxDropDownTaxMasterRecordList = snapshot.data!;

                                                                                    return FlutterFlowDropDown<String>(
                                                                                      controller: _model.taxDropDownValueController ??= FormFieldController<String>(
                                                                                        _model.taxDropDownValue ??= containerTax1TaxMasterRecord != null ? containerTax1TaxMasterRecord?.name : '#',
                                                                                      ),
                                                                                      options: taxDropDownTaxMasterRecordList.map((e) => e.name).toList(),
                                                                                      onChanged: (val) => safeSetState(() => _model.taxDropDownValue = val),
                                                                                      width: 180.0,
                                                                                      height: 50.0,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                          ),
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      elevation: 2.0,
                                                                                      borderColor: FlutterFlowTheme.of(context).customColor2,
                                                                                      borderWidth: 0.5,
                                                                                      borderRadius: 0.0,
                                                                                      margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                      hidesUnderline: true,
                                                                                      isSearchable: false,
                                                                                      isMultiSelect: false,
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
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
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (false)
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        child:
                                                            ExpandableNotifier(
                                                          controller: _model
                                                              .expandableExpandableController2,
                                                          child:
                                                              ExpandablePanel(
                                                            header: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1p6y497u' /* Barcode & HSN */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelLargeFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            collapsed:
                                                                Container(),
                                                            expanded: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            15.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.38,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.05,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'y93m50ki' /* Scan */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                    ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.1,
                                                                                height: MediaQuery.sizeOf(context).height * 0.05,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                ),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    _model.barcode = await FlutterBarcodeScanner.scanBarcode(
                                                                                      '#C62828', // scanning line color
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '128s60j5' /* Cancel */,
                                                                                      ), // cancel button text
                                                                                      true, // whether to show the flash icon
                                                                                      ScanMode.QR,
                                                                                    );

                                                                                    FFAppState().barcode = _model.barcode!;
                                                                                    FFAppState().update(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.qr_code_scanner,
                                                                                    color: Colors.black,
                                                                                    size: 28.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '2ru6ketz' /* or */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                              ),
                                                                        ),
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
                                                                            _model.barcode2 =
                                                                                await actions.barcodeRandomGenerated();
                                                                            FFAppState().barcode =
                                                                                _model.barcode2!;
                                                                            FFAppState().update(() {});

                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.38,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.05,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'gxrfxhsb' /* Create Barcode */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              3.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.48,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.05,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: TextFormField(
                                                                                    controller: _model.textFieldBarcodeTextController,
                                                                                    focusNode: _model.textFieldBarcodeFocusNode,
                                                                                    autofocus: false,
                                                                                    readOnly: true,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      hintText: containerProductRecord?.barcode,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0x00000000),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          topLeft: Radius.circular(4.0),
                                                                                          topRight: Radius.circular(4.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                    validator: _model.textFieldBarcodeTextControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              3.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.4,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.05,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.textController10 ??= TextEditingController(
                                                                                text: containerProductRecord?.hsncode?.toString(),
                                                                              ),
                                                                              focusNode: _model.textFieldFocusNode,
                                                                              autofocus: true,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'pyhsrck5' /* HSN Code */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                    ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              validator: _model.textController10Validator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
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
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.5,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.07,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.4,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.05,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      await containerProductRecord!
                                                                          .reference
                                                                          .update(
                                                                              createProductRecordData(
                                                                        name: _model
                                                                            .productDropDownValue,
                                                                        sellingPrice: double.tryParse(_model
                                                                            .textFieldSellingPriceTextController
                                                                            .text),
                                                                        mrpPrice: double.tryParse(_model
                                                                            .textFieldMRPPriceTextController
                                                                            .text),
                                                                      ));
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Product'),
                                                                            content:
                                                                                Text('Product Update successfully'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );

                                                                      context.pushNamed(
                                                                          'productListNewM');

                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'product updated',
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                        ),
                                                                      );
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'r4bp4g8a' /* Update */,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          150.0,
                                                                      height:
                                                                          50.0,
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .parkingSecondaryBackground,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBtnText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                          ),
                                                                      elevation:
                                                                          2.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
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
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
