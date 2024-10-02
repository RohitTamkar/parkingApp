import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_product_model.dart';
export 'add_product_model.dart';

class AddProductWidget extends StatefulWidget {
  const AddProductWidget({super.key});

  @override
  State<AddProductWidget> createState() => _AddProductWidgetState();
}

class _AddProductWidgetState extends State<AddProductWidget> {
  late AddProductModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddProductModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??=
        TextEditingController(text: FFAppState().codeLenght.toString());
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textController6 ??= TextEditingController();
    _model.textFieldFocusNode6 ??= FocusNode();

    _model.textController7 ??= TextEditingController();
    _model.textFieldFocusNode7 ??= FocusNode();

    _model.textController8 ??= TextEditingController();
    _model.textFieldFocusNode8 ??= FocusNode();

    _model.textFieldsellingPriceTextController ??= TextEditingController();
    _model.textFieldsellingPriceFocusNode ??= FocusNode();

    _model.textController10 ??= TextEditingController();
    _model.textFieldFocusNode9 ??= FocusNode();

    _model.textController11 ??= TextEditingController();
    _model.textFieldFocusNode10 ??= FocusNode();

    _model.textController12 ??= TextEditingController();
    _model.textFieldFocusNode11 ??= FocusNode();

    _model.textController13 ??= TextEditingController();
    _model.textFieldFocusNode12 ??= FocusNode();

    _model.textController14 ??= TextEditingController();
    _model.textFieldFocusNode13 ??= FocusNode();

    _model.textController15 ??= TextEditingController();
    _model.textFieldFocusNode14 ??= FocusNode();

    _model.textController16 ??= TextEditingController();
    _model.textFieldFocusNode15 ??= FocusNode();

    _model.textController17 ??= TextEditingController();
    _model.textFieldFocusNode16 ??= FocusNode();

    _model.textController18 ??= TextEditingController();
    _model.textFieldFocusNode17 ??= FocusNode();

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
        title: 'AddProduct',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
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
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'gugvrfuf' /* Add Product  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMediumFamily),
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
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.79,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.79,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 7.0, 5.0, 5.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.14,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'spfg8fi4' /* Name* */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                          ),
                                                        ),
                                                        StreamBuilder<
                                                            List<
                                                                ProductRecord>>(
                                                          stream:
                                                              queryProductRecord(
                                                            parent: FFAppState()
                                                                .outletIdRef,
                                                            singleRecord: true,
                                                          ),
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
                                                            List<ProductRecord>
                                                                containerProductRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final containerProductRecord =
                                                                containerProductRecordList
                                                                        .isNotEmpty
                                                                    ? containerProductRecordList
                                                                        .first
                                                                    : null;

                                                            return Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.3,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.08,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          5.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          5.0),
                                                                ),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor2,
                                                                  width: 0.5,
                                                                ),
                                                              ),
                                                              child: StreamBuilder<
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
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        child:
                                                                            SpinKitFadingCircle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              40.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<ProductMasterRecord>
                                                                      dropDownProductMasterRecordList =
                                                                      snapshot
                                                                          .data!;

                                                                  return FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .dropDownValueController1 ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model.dropDownValue1 ??=
                                                                          containerProductRecord
                                                                              ?.name,
                                                                    ),
                                                                    options: dropDownProductMasterRecordList
                                                                        .map((e) =>
                                                                            e.name)
                                                                        .toList(),
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.dropDownValue1 =
                                                                                val),
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.3,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.09,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'u53whxlr' /* Select Product */,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor3,
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
                                                                            10.0,
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
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'ri3sme8x' /* Regional Name */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.3,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.09,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textController1,
                                                              focusNode: _model
                                                                  .textFieldFocusNode1,
                                                              autofocus: false,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: false,
                                                                hintText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  'w54d42a5' /* Regional Name */,
                                                                ),
                                                                hintStyle: FlutterFlowTheme.of(
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor2,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            4.0),
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
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            4.0),
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
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            4.0),
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
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .customColor3,
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
                                                              validator: _model
                                                                  .textController1Validator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'u15ksbtk' /* Barcode */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.3,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.09,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textController2,
                                                              focusNode: _model
                                                                  .textFieldFocusNode2,
                                                              autofocus: false,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: false,
                                                                hintText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  '0xmed7xh' /* Barcode */,
                                                                ),
                                                                hintStyle: FlutterFlowTheme.of(
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor2,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            4.0),
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
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            4.0),
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
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            4.0),
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
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .customColor3,
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
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              validator: _model
                                                                  .textController2Validator
                                                                  .asValidator(
                                                                      context),
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
                                          Divider(
                                            thickness: 0.5,
                                            indent: 10.0,
                                            endIndent: 10.0,
                                            color: FlutterFlowTheme.of(context)
                                                .customColor2,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        1.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.3,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.14,
                                                              decoration:
                                                                  BoxDecoration(),
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
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '0ksimgde' /* Category */,
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
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.25,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.08,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).customColor2,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          StreamBuilder<
                                                                              List<CategoryRecord>>(
                                                                            stream:
                                                                                queryCategoryRecord(
                                                                              parent: FFAppState().outletIdRef,
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
                                                                              List<CategoryRecord> dropDownCategoryRecordList = snapshot.data!;

                                                                              return FlutterFlowDropDown<String>(
                                                                                controller: _model.dropDownValueController2 ??= FormFieldController<String>(null),
                                                                                options: dropDownCategoryRecordList.map((e) => e.name).toList(),
                                                                                onChanged: (val) => safeSetState(() => _model.dropDownValue2 = val),
                                                                                width: 180.0,
                                                                                height: 50.0,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: Colors.black,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'al5fq3ih' /* Please select... */,
                                                                                ),
                                                                                elevation: 2.0,
                                                                                borderColor: Colors.transparent,
                                                                                borderWidth: 0.0,
                                                                                borderRadius: 0.0,
                                                                                margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                hidesUnderline: true,
                                                                                isSearchable: false,
                                                                                isMultiSelect: false,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        1.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.3,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.14,
                                                              decoration:
                                                                  BoxDecoration(),
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
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'k3zi4rj6' /* GST Rate */,
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
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.25,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.08,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).customColor2,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          StreamBuilder<
                                                                              List<TaxMasterRecord>>(
                                                                            stream:
                                                                                queryTaxMasterRecord(),
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
                                                                              List<TaxMasterRecord> dropDownTaxMasterRecordList = snapshot.data!;

                                                                              return FlutterFlowDropDown<String>(
                                                                                controller: _model.dropDownValueController3 ??= FormFieldController<String>(null),
                                                                                options: dropDownTaxMasterRecordList.map((e) => e.name).toList(),
                                                                                onChanged: (val) => safeSetState(() => _model.dropDownValue3 = val),
                                                                                width: 180.0,
                                                                                height: 50.0,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: Colors.black,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'mrd93c3x' /* Please select... */,
                                                                                ),
                                                                                elevation: 2.0,
                                                                                borderColor: Colors.transparent,
                                                                                borderWidth: 0.0,
                                                                                borderRadius: 0.0,
                                                                                margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                hidesUnderline: true,
                                                                                isSearchable: false,
                                                                                isMultiSelect: false,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        1.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.3,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.14,
                                                              decoration:
                                                                  BoxDecoration(),
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
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '2egb66hc' /* Unit Type */,
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
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.25,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.08,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).customColor2,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          StreamBuilder<
                                                                              List<UnitTypeRecord>>(
                                                                            stream:
                                                                                queryUnitTypeRecord(),
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
                                                                              List<UnitTypeRecord> dropDownUnitTypeRecordList = snapshot.data!;

                                                                              return FlutterFlowDropDown<String>(
                                                                                controller: _model.dropDownValueController4 ??= FormFieldController<String>(null),
                                                                                options: dropDownUnitTypeRecordList.map((e) => e.name).toList(),
                                                                                onChanged: (val) => safeSetState(() => _model.dropDownValue4 = val),
                                                                                width: 180.0,
                                                                                height: 50.0,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: Colors.black,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'n95zyx96' /* Please select... */,
                                                                                ),
                                                                                elevation: 2.0,
                                                                                borderColor: Colors.transparent,
                                                                                borderWidth: 0.0,
                                                                                borderRadius: 0.0,
                                                                                margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                hidesUnderline: true,
                                                                                isSearchable: false,
                                                                                isMultiSelect: false,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        1.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.3,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.14,
                                                              decoration:
                                                                  BoxDecoration(),
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
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'sl0y22vo' /* Service point */,
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
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.25,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.08,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).customColor2,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          StreamBuilder<
                                                                              List<ServicePointOutletRecord>>(
                                                                            stream:
                                                                                queryServicePointOutletRecord(
                                                                              parent: FFAppState().outletIdRef,
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
                                                                              List<ServicePointOutletRecord> dropDownServicePointOutletRecordList = snapshot.data!;

                                                                              return FlutterFlowDropDown<String>(
                                                                                controller: _model.dropDownValueController5 ??= FormFieldController<String>(null),
                                                                                options: dropDownServicePointOutletRecordList.map((e) => e.name).toList(),
                                                                                onChanged: (val) => safeSetState(() => _model.dropDownValue5 = val),
                                                                                width: 180.0,
                                                                                height: 50.0,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: Colors.black,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'akwf4m1t' /* Please select... */,
                                                                                ),
                                                                                elevation: 2.0,
                                                                                borderColor: Colors.transparent,
                                                                                borderWidth: 0.0,
                                                                                borderRadius: 0.0,
                                                                                margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                hidesUnderline: true,
                                                                                isSearchable: false,
                                                                                isMultiSelect: false,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
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
                                                  Divider(
                                                    thickness: 1.0,
                                                    indent: 10.0,
                                                    endIndent: 10.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (!FFAppState()
                                                                  .show)
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            1.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.3,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.14,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                't6szy133' /* Best Before */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2.0,
                                                                                5.0,
                                                                                3.0,
                                                                                0.0),
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 2.0,
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.09,
                                                                                decoration: BoxDecoration(
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'xckgdwxa' /* Days */,
                                                                                        ),
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                  ),
                                                                ),
                                                              if (!FFAppState()
                                                                  .show)
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            1.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.3,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.14,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'mklrw790' /* Batch No */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2.0,
                                                                                5.0,
                                                                                3.0,
                                                                                0.0),
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 2.0,
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.09,
                                                                                decoration: BoxDecoration(
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: TextFormField(
                                                                                        controller: _model.textController3,
                                                                                        focusNode: _model.textFieldFocusNode3,
                                                                                        autofocus: false,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            '2agy6ze4' /* Batch No */,
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
                                                                                        keyboardType: TextInputType.number,
                                                                                        validator: _model.textController3Validator.asValidator(context),
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
                                                                  ),
                                                                ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          1.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.3,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.14,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'bbwggi0r' /* Search Code */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              5.0,
                                                                              3.0,
                                                                              0.0),
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                2.0,
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.sizeOf(context).height * 0.09,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: TextFormField(
                                                                                      controller: _model.textController4,
                                                                                      focusNode: _model.textFieldFocusNode4,
                                                                                      autofocus: false,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'ripj0wi2' /* Search Code */,
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
                                                                                      keyboardType: TextInputType.number,
                                                                                      validator: _model.textController4Validator.asValidator(context),
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
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          1.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.3,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.14,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '9b4aq4kq' /* Short Name */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              5.0,
                                                                              3.0,
                                                                              0.0),
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                2.0,
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.sizeOf(context).height * 0.09,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: TextFormField(
                                                                                      controller: _model.textController5,
                                                                                      focusNode: _model.textFieldFocusNode5,
                                                                                      autofocus: false,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          '206ldspl' /* Short Name */,
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
                                                                                      validator: _model.textController5Validator.asValidator(context),
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
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.3,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.14,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'baggecrz' /* HSN Code */,
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
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              2.0,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.09,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                    child: TextFormField(
                                                                                      controller: _model.textController6,
                                                                                      focusNode: _model.textFieldFocusNode6,
                                                                                      autofocus: false,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          '6ddfarbq' /* HSN Code */,
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
                                                                                      validator: _model.textController6Validator.asValidator(context),
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
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            indent: 10.0,
                                                            endIndent: 10.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor2,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (!FFAppState()
                                                                    .show)
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          1.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.3,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.14,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '0iugjiav' /* CESS Percent */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 5.0, 3.0, 0.0),
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 2.0,
                                                                                child: Container(
                                                                                  height: MediaQuery.sizeOf(context).height * 0.09,
                                                                                  decoration: BoxDecoration(
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: TextFormField(
                                                                                          controller: _model.textController7,
                                                                                          focusNode: _model.textFieldFocusNode7,
                                                                                          autofocus: false,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              'vbmnigev' /* CESS Percent */,
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
                                                                                          keyboardType: TextInputType.number,
                                                                                          validator: _model.textController7Validator.asValidator(context),
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
                                                                    ),
                                                                  ),
                                                                if (!FFAppState()
                                                                    .show)
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          1.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.3,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.14,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '3pt6o8ts' /* CESS Amt. */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 5.0, 3.0, 0.0),
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 2.0,
                                                                                child: Container(
                                                                                  height: MediaQuery.sizeOf(context).height * 0.09,
                                                                                  decoration: BoxDecoration(
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: TextFormField(
                                                                                          controller: _model.textController8,
                                                                                          focusNode: _model.textFieldFocusNode8,
                                                                                          autofocus: false,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              '0v796m0f' /* CESS Amt */,
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
                                                                                          keyboardType: TextInputType.number,
                                                                                          validator: _model.textController8Validator.asValidator(context),
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
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            1.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.3,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.14,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '49lsdrza' /* Selling  Price */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2.0,
                                                                                5.0,
                                                                                3.0,
                                                                                0.0),
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 2.0,
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.09,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: TextFormField(
                                                                                        controller: _model.textFieldsellingPriceTextController,
                                                                                        focusNode: _model.textFieldsellingPriceFocusNode,
                                                                                        autofocus: false,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            '78uf4aqa' /* Selling Price */,
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
                                                                                        keyboardType: TextInputType.number,
                                                                                        validator: _model.textFieldsellingPriceTextControllerValidator.asValidator(context),
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
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            1.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.3,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.14,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'v9649qlt' /* Purchace  Price */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2.0,
                                                                                5.0,
                                                                                3.0,
                                                                                0.0),
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 2.0,
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.09,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: TextFormField(
                                                                                        controller: _model.textController10,
                                                                                        focusNode: _model.textFieldFocusNode9,
                                                                                        autofocus: false,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'l5rck417' /* Purchace Price */,
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
                                                                                        keyboardType: TextInputType.number,
                                                                                        validator: _model.textController10Validator.asValidator(context),
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
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.3,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.14,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '4vlmmmzc' /* MRP Price */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              5.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                2.0,
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.sizeOf(context).height * 0.09,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: TextFormField(
                                                                                      controller: _model.textController11,
                                                                                      focusNode: _model.textFieldFocusNode10,
                                                                                      autofocus: false,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'a7w8x7pv' /* MRP Price */,
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
                                                                                      keyboardType: TextInputType.number,
                                                                                      validator: _model.textController11Validator.asValidator(context),
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
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            indent: 10.0,
                                                            endIndent: 10.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            1.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.3,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.14,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '6hj3bruw' /* Discount */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2.0,
                                                                                5.0,
                                                                                3.0,
                                                                                0.0),
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 2.0,
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.09,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: TextFormField(
                                                                                        controller: _model.textController12,
                                                                                        focusNode: _model.textFieldFocusNode11,
                                                                                        autofocus: false,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'zknnztxp' /* Discount */,
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
                                                                                        keyboardType: TextInputType.number,
                                                                                        validator: _model.textController12Validator.asValidator(context),
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
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            1.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.3,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.14,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'kaftn03c' /* Dis.Amt. */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2.0,
                                                                                5.0,
                                                                                3.0,
                                                                                0.0),
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 2.0,
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.09,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: TextFormField(
                                                                                        controller: _model.textController13,
                                                                                        focusNode: _model.textFieldFocusNode12,
                                                                                        autofocus: false,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'e5exhotr' /* Discount Amt */,
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
                                                                                        keyboardType: TextInputType.number,
                                                                                        validator: _model.textController13Validator.asValidator(context),
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
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            1.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.3,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.14,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'pkv331m1' /* Current Stock */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2.0,
                                                                                5.0,
                                                                                3.0,
                                                                                0.0),
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 2.0,
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.09,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: TextFormField(
                                                                                        controller: _model.textController14,
                                                                                        focusNode: _model.textFieldFocusNode13,
                                                                                        autofocus: true,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'kjx42s6f' /* Current Stock */,
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
                                                                                        validator: _model.textController14Validator.asValidator(context),
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
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            1.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.3,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.14,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              unselectedWidgetColor: Color(0xFF95A1AC),
                                                                            ),
                                                                            child:
                                                                                CheckboxListTile(
                                                                              value: _model.checkboxListTileValue1 ??= false,
                                                                              onChanged: (newValue) async {
                                                                                safeSetState(() => _model.checkboxListTileValue1 = newValue!);
                                                                              },
                                                                              title: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'iyynlkpo' /* Weightable */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 11.0,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                              tileColor: Color(0xFFF5F5F5),
                                                                              activeColor: Color(0xFF3B58FF),
                                                                              dense: true,
                                                                              controlAffinity: ListTileControlAffinity.leading,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.3,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.14,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
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
                                                                        Theme(
                                                                          data:
                                                                              ThemeData(
                                                                            unselectedWidgetColor:
                                                                                Color(0xFF95A1AC),
                                                                          ),
                                                                          child:
                                                                              CheckboxListTile(
                                                                            value: _model.checkboxListTileValue2 ??=
                                                                                false,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.checkboxListTileValue2 = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'wk7vlqmv' /* Stockable */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                Color(0xFFF5F5F5),
                                                                            activeColor:
                                                                                Color(0xFF3B58FF),
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
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
                                                  ),
                                                  Divider(
                                                    thickness: 1.0,
                                                    indent: 10.0,
                                                    endIndent: 10.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 10.0,
                                                                5.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.32,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
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
                                                                          'rxs110p6' /* Table Price */,
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
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.3,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.09,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.textController15,
                                                                          focusNode:
                                                                              _model.textFieldFocusNode14,
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                false,
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'hdzah971' /* Table Price */,
                                                                            ),
                                                                            hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).customColor2,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).customColor3,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          validator: _model
                                                                              .textController15Validator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
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
                                                                          'q8zik6sw' /* AC Price */,
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
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.3,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.09,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.textController16,
                                                                          focusNode:
                                                                              _model.textFieldFocusNode15,
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                false,
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '95352aoc' /* AC Price */,
                                                                            ),
                                                                            hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).customColor2,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).customColor3,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          validator: _model
                                                                              .textController16Validator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
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
                                                                          '6jegrth5' /* Hall Price */,
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
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.3,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.09,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.textController17,
                                                                          focusNode:
                                                                              _model.textFieldFocusNode16,
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                false,
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'ynwj3vnz' /* Hall Price */,
                                                                            ),
                                                                            hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).customColor2,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).customColor3,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          validator: _model
                                                                              .textController17Validator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        15.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
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
                                                                            'cfbhc3xw' /* Parcel Price */,
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
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.3,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.09,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.textController18,
                                                                            focusNode:
                                                                                _model.textFieldFocusNode17,
                                                                            autofocus:
                                                                                false,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              isDense: false,
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                'm89bw3rr' /* Parcel Price */,
                                                                              ),
                                                                              hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).customColor2,
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
                                                                              filled: true,
                                                                              fillColor: FlutterFlowTheme.of(context).customColor3,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            validator:
                                                                                _model.textController18Validator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.3,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.09,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.3,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.09,
                                                                        decoration:
                                                                            BoxDecoration(),
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              StreamBuilder<List<CategoryRecord>>(
                                stream: queryCategoryRecord(
                                  parent: FFAppState().outletIdRef,
                                  queryBuilder: (categoryRecord) =>
                                      categoryRecord.where(
                                    'name',
                                    isEqualTo: _model.dropDownValue2 != ''
                                        ? _model.dropDownValue2
                                        : null,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 40.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<CategoryRecord>
                                      container1CategoryRecordList =
                                      snapshot.data!;
                                  final container1CategoryRecord =
                                      container1CategoryRecordList.isNotEmpty
                                          ? container1CategoryRecordList.first
                                          : null;

                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.95,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.11,
                                    decoration: BoxDecoration(),
                                    child: StreamBuilder<
                                        List<ServicePointOutletRecord>>(
                                      stream: queryServicePointOutletRecord(
                                        parent: FFAppState().outletIdRef,
                                        queryBuilder:
                                            (servicePointOutletRecord) =>
                                                servicePointOutletRecord.where(
                                          'name',
                                          isEqualTo: _model.dropDownValue5,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 40.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ServicePointOutletRecord>
                                            rowServicePointOutletRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final rowServicePointOutletRecord =
                                            rowServicePointOutletRecordList
                                                    .isNotEmpty
                                                ? rowServicePointOutletRecordList
                                                    .first
                                                : null;

                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            StreamBuilder<
                                                List<TaxMasterRecord>>(
                                              stream: queryTaxMasterRecord(
                                                queryBuilder:
                                                    (taxMasterRecord) =>
                                                        taxMasterRecord.where(
                                                  'name',
                                                  isEqualTo:
                                                      _model.dropDownValue3,
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
                                                      child:
                                                          SpinKitFadingCircle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 40.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<TaxMasterRecord>
                                                    rowTaxMasterRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final rowTaxMasterRecord =
                                                    rowTaxMasterRecordList
                                                            .isNotEmpty
                                                        ? rowTaxMasterRecordList
                                                            .first
                                                        : null;

                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    StreamBuilder<
                                                        List<UnitTypeRecord>>(
                                                      stream:
                                                          queryUnitTypeRecord(
                                                        queryBuilder:
                                                            (unitTypeRecord) =>
                                                                unitTypeRecord
                                                                    .where(
                                                          'name',
                                                          isEqualTo: _model
                                                              .dropDownValue4,
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
                                                        List<UnitTypeRecord>
                                                            containerUnitTypeRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final containerUnitTypeRecord =
                                                            containerUnitTypeRecordList
                                                                    .isNotEmpty
                                                                ? containerUnitTypeRecordList
                                                                    .first
                                                                : null;

                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            ProductMasterRecord>>(
                                                                      stream:
                                                                          queryProductMasterRecord(
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 40.0,
                                                                              height: 40.0,
                                                                              child: SpinKitFadingCircle(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 40.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<ProductMasterRecord>
                                                                            buttonProductMasterRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the item does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final buttonProductMasterRecord = buttonProductMasterRecordList.isNotEmpty
                                                                            ? buttonProductMasterRecordList.first
                                                                            : null;

                                                                        return FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            if (buttonProductMasterRecord?.name != null &&
                                                                                buttonProductMasterRecord?.name != '') {
                                                                              if (!(_model.textFieldsellingPriceTextController.text != null && _model.textFieldsellingPriceTextController.text != '')) {
                                                                                if (_model.formKey.currentState == null || !_model.formKey.currentState!.validate()) {
                                                                                  return;
                                                                                }
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              }
                                                                            } else {
                                                                              if (_model.formKey.currentState == null || !_model.formKey.currentState!.validate()) {
                                                                                return;
                                                                              }
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }

                                                                            var productRecordReference =
                                                                                ProductRecord.createDoc(FFAppState().outletIdRef!);
                                                                            await productRecordReference.set(createProductRecordData(
                                                                              name: _model.dropDownValue1,
                                                                              regionalName: _model.textController1.text,
                                                                              unitRef: containerUnitTypeRecord?.reference,
                                                                              taxRef: rowTaxMasterRecord?.reference,
                                                                              searchcode: int.tryParse(_model.textController4.text),
                                                                              shortName: _model.textController5.text,
                                                                              hsncode: int.tryParse(_model.textController6.text),
                                                                              price: double.tryParse(_model.textController11.text),
                                                                              categoryRef: container1CategoryRecord?.reference,
                                                                              sellingPrice: double.tryParse(_model.textFieldsellingPriceTextController.text),
                                                                              purchasePrice: double.tryParse(_model.textController10.text),
                                                                              mrpPrice: double.tryParse(_model.textController11.text),
                                                                              discountPer: double.tryParse(_model.textController12.text),
                                                                              discountAmt: double.tryParse(_model.textController13.text),
                                                                              stockable: _model.checkboxListTileValue2,
                                                                              weightable: _model.checkboxListTileValue1,
                                                                              code: int.tryParse(_model.textController4.text),
                                                                              barcode: _model.textController2.text,
                                                                              category: _model.dropDownValue2,
                                                                              productMasterRef: buttonProductMasterRecord?.reference,
                                                                              id: '',
                                                                              serviceOutletRef: rowServicePointOutletRecord?.reference,
                                                                            ));
                                                                            _model.proDoc = ProductRecord.getDocumentFromData(
                                                                                createProductRecordData(
                                                                                  name: _model.dropDownValue1,
                                                                                  regionalName: _model.textController1.text,
                                                                                  unitRef: containerUnitTypeRecord?.reference,
                                                                                  taxRef: rowTaxMasterRecord?.reference,
                                                                                  searchcode: int.tryParse(_model.textController4.text),
                                                                                  shortName: _model.textController5.text,
                                                                                  hsncode: int.tryParse(_model.textController6.text),
                                                                                  price: double.tryParse(_model.textController11.text),
                                                                                  categoryRef: container1CategoryRecord?.reference,
                                                                                  sellingPrice: double.tryParse(_model.textFieldsellingPriceTextController.text),
                                                                                  purchasePrice: double.tryParse(_model.textController10.text),
                                                                                  mrpPrice: double.tryParse(_model.textController11.text),
                                                                                  discountPer: double.tryParse(_model.textController12.text),
                                                                                  discountAmt: double.tryParse(_model.textController13.text),
                                                                                  stockable: _model.checkboxListTileValue2,
                                                                                  weightable: _model.checkboxListTileValue1,
                                                                                  code: int.tryParse(_model.textController4.text),
                                                                                  barcode: _model.textController2.text,
                                                                                  category: _model.dropDownValue2,
                                                                                  productMasterRef: buttonProductMasterRecord?.reference,
                                                                                  id: '',
                                                                                  serviceOutletRef: rowServicePointOutletRecord?.reference,
                                                                                ),
                                                                                productRecordReference);
                                                                            _shouldSetState =
                                                                                true;

                                                                            await _model.proDoc!.reference.update(createProductRecordData(
                                                                              id: functions.getDocIdFromDocRefProduct(_model.proDoc!.reference),
                                                                            ));
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  'Product Added  Successfully...!',
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                      ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 3000),
                                                                                backgroundColor: Color(0x00000000),
                                                                              ),
                                                                            );
                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '0ktxud1h' /* Save */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                160.0,
                                                                            height:
                                                                                38.0,
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
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                ),
                                                                            elevation:
                                                                                2.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(4.0),
                                                                              bottomRight: Radius.circular(4.0),
                                                                              topLeft: Radius.circular(4.0),
                                                                              topRight: Radius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                },
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
        ));
  }
}
