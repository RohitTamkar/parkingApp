import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/discount_and_delivery_copy/discount_and_delivery_copy_widget.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'product_and_list_new_copy_model.dart';
export 'product_and_list_new_copy_model.dart';

class ProductAndListNewCopyWidget extends StatefulWidget {
  const ProductAndListNewCopyWidget({
    super.key,
    this.billDetails,
    this.doc,
    this.shiftDetails,
    required this.taxcollection,
  });

  final DocumentReference? billDetails;
  final DocumentReference? doc;
  final dynamic shiftDetails;
  final List<TaxMasterRecord>? taxcollection;

  @override
  State<ProductAndListNewCopyWidget> createState() =>
      _ProductAndListNewCopyWidgetState();
}

class _ProductAndListNewCopyWidgetState
    extends State<ProductAndListNewCopyWidget> with TickerProviderStateMixin {
  late ProductAndListNewCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  var hasContainerTriggered3 = false;
  var hasContainerTriggered4 = false;
  var hasContainerTriggered5 = false;
  var hasContainerTriggered6 = false;
  var hasContainerTriggered7 = false;
  var hasContainerTriggered8 = false;
  var hasContainerTriggered9 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductAndListNewCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.hideStatusBar();
      FFAppState().shiftDocExists = getJsonField(
        widget!.shiftDetails,
        r'''$.shiftExists''',
      );
      FFAppState().update(() {});
      FFAppState().shiftDetailsNEw = widget!.shiftDetails!;
      safeSetState(() {});
      FFAppState().shiftDetailsJson = widget!.shiftDetails!;
      safeSetState(() {});
      _model.hiveProductList = await actions.getProductlistHive();
      _model.categoryListHive = await actions.getCategorylistHive();
      FFAppState().productHive =
          _model.hiveProductList!.toList().cast<ProductStructStruct>();
      safeSetState(() {});
      FFAppState().categoryHive =
          _model.categoryListHive!.toList().cast<CategoryStructStruct>();
      safeSetState(() {});
    });

    _model.searchTextController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textFieldsearchTextController ??= TextEditingController();
    _model.textFieldsearchFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: Offset(0.92, 0.92),
            end: Offset(1.0, 1.0),
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 180.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 180.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 180.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 180.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: Offset(0.92, 0.92),
            end: Offset(1.0, 1.0),
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 120.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.0, 1.0),
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 120.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: Offset(0.92, 0.92),
            end: Offset(1.0, 1.0),
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: Offset(0.92, 0.92),
            end: Offset(1.0, 1.0),
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: Offset(0.92, 0.92),
            end: Offset(1.0, 1.0),
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: Offset(0.92, 0.92),
            end: Offset(1.0, 1.0),
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return StreamBuilder<List<AppSettingsRecord>>(
      stream: queryAppSettingsRecord(
        parent: FFAppState().outletIdRef,
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<AppSettingsRecord> productAndListNewCopyAppSettingsRecordList =
            snapshot.data!;
        final productAndListNewCopyAppSettingsRecord =
            productAndListNewCopyAppSettingsRecordList.isNotEmpty
                ? productAndListNewCopyAppSettingsRecordList.first
                : null;

        return Title(
            title: 'ProductAndListNewCopy',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                drawer: Container(
                  width: MediaQuery.sizeOf(context).width * 0.11,
                  child: Drawer(
                    elevation: 16.0,
                    child: wrapWithModel(
                      model: _model.menuDrawerModel,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuDrawerWidget(
                        billdetails: widget!.billDetails,
                        doc: widget!.doc,
                        shiftDetails: widget!.shiftDetails,
                      ),
                    ),
                  ),
                ),
                endDrawer: Container(
                  width: MediaQuery.sizeOf(context).width * 0.45,
                  child: Drawer(
                    elevation: 16.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        StreamBuilder<List<PartyRecord>>(
                          stream: queryPartyRecord(
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
                            List<PartyRecord> containerPartyRecordList =
                                snapshot.data!;

                            return Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.1,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.chevron_left,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 22.0,
                                            ),
                                            onPressed: () async {
                                              context.pop();
                                            },
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'zj9xoimz' /* CUSTOMER DETAILS */,
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
                                              ],
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.person_add,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 22.0,
                                            ),
                                            onPressed: () async {
                                              context.pushNamed('AddCustomer');
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        child: Container(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.1,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 0.0, 0.0, 0.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .textFieldsearchTextController,
                                                    focusNode: _model
                                                        .textFieldsearchFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.textFieldsearchTextController',
                                                      Duration(
                                                          milliseconds: 2000),
                                                      () async {
                                                        safeSetState(() {
                                                          _model.simpleSearchResults =
                                                              TextSearch(
                                                            containerPartyRecordList
                                                                .map(
                                                                  (record) => TextSearchItem
                                                                      .fromTerms(
                                                                          record,
                                                                          [
                                                                        record
                                                                            .name!
                                                                      ]),
                                                                )
                                                                .toList(),
                                                          )
                                                                  .search(_model
                                                                      .textFieldsearchTextController
                                                                      .text)
                                                                  .map((r) =>
                                                                      r.object)
                                                                  .take(5)
                                                                  .toList();
                                                          ;
                                                        });
                                                        FFAppState()
                                                                .isCustListShown =
                                                            false;
                                                        FFAppState()
                                                            .update(() {});
                                                      },
                                                    ),
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'vjayztv0' /* Search Customer */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                    validator: _model
                                                        .textFieldsearchTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.06,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.1,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 1.0,
                                                  buttonSize: 50.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  icon: Icon(
                                                    Icons.search,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    size: 22.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.7,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color(0x33000000),
                                              offset: Offset(
                                                0.0,
                                                1.0,
                                              ),
                                            )
                                          ],
                                        ),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.7,
                                          child: Stack(
                                            children: [
                                              if (FFAppState()
                                                      .isCustListShown ==
                                                  true)
                                                Builder(
                                                  builder: (context) {
                                                    final containerVar =
                                                        containerPartyRecordList
                                                            .toList();

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          containerVar.length,
                                                      itemBuilder: (context,
                                                          containerVarIndex) {
                                                        final containerVarItem =
                                                            containerVar[
                                                                containerVarIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            FFAppState()
                                                                    .setCustName =
                                                                containerVarItem
                                                                    .name;
                                                            FFAppState()
                                                                    .setCustMobNo =
                                                                containerVarItem
                                                                    .mobile;
                                                            FFAppState()
                                                                .update(() {});
                                                            FFAppState()
                                                                    .setCustRef =
                                                                containerVarItem
                                                                    .reference;
                                                            FFAppState()
                                                                    .isCustListShown =
                                                                true;
                                                            FFAppState()
                                                                .update(() {});
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Card(
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
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
                                                                      60.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .account_circle,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 30.0,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'IconButton pressed ...');
                                                                  },
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        170.0,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.14,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          containerVarItem
                                                                              .name,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          containerVarItem
                                                                              .mobile,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
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
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        if (containerVarItem
                                                                            .credit)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'bdcd6bab' /* Balance:  */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  containerVarItem.oldBalance.toString(),
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.06,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.14,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              30.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              60.0,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.chevron_right,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              'EditCustomer',
                                                                              queryParameters: {
                                                                                'custRef': serializeParam(
                                                                                  containerVarItem.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
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
                                                      controller:
                                                          _model.custListView,
                                                    );
                                                  },
                                                ),
                                              if (FFAppState()
                                                      .isCustListShown ==
                                                  false)
                                                Builder(
                                                  builder: (context) {
                                                    final list = _model
                                                        .simpleSearchResults
                                                        .toList();

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: list.length,
                                                      itemBuilder:
                                                          (context, listIndex) {
                                                        final listItem =
                                                            list[listIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            FFAppState()
                                                                    .setCustName =
                                                                listItem.name;
                                                            FFAppState()
                                                                    .setCustMobNo =
                                                                listItem.mobile;
                                                            FFAppState()
                                                                .update(() {});
                                                            FFAppState()
                                                                    .setCustRef =
                                                                listItem
                                                                    .reference;
                                                            FFAppState()
                                                                    .isCustListShown =
                                                                true;
                                                            FFAppState()
                                                                .update(() {});
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Card(
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
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
                                                                      60.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .account_circle,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 30.0,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'IconButton pressed ...');
                                                                  },
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        170.0,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.14,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          listItem
                                                                              .name,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          listItem
                                                                              .mobile,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
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
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        if (listItem
                                                                            .credit)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'ka4nsrvy' /* Balance:  */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  listItem.oldBalance.toString(),
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.08,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.14,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              30.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              60.0,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.chevron_right,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              'EditCustomer',
                                                                              queryParameters: {
                                                                                'custRef': serializeParam(
                                                                                  listItem.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
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
                                                      controller:
                                                          _model.searchListView,
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
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.05,
                            height: MediaQuery.sizeOf(context).height * 0.05,
                            decoration: BoxDecoration(),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onLongPress: () async {
                                await actions.deleteAllcategory();
                                await actions.deleteAllinvoice();
                                await actions.deleteAllproduct();
                                await actions.deleteAllshift();
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Alert'),
                                      content: Text('Deleted'),
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
                              },
                              child: Image.asset(
                                'assets/images/IMG_20220412_140945.png',
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 100.0,
                              height: MediaQuery.sizeOf(context).height * 0.06,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 3.0, 0.0),
                                              child: Text(
                                                FFAppState().outletName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 6.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'aibd3vg9' /* Admin */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily),
                                                        ),
                                              ),
                                            ),
                                            Container(
                                              width: 100.0,
                                              height: 45.0,
                                              child: custom_widgets
                                                  .NewCustomWidget(
                                                width: 100.0,
                                                height: 45.0,
                                                outletRef:
                                                    FFAppState().outletIdRef!,
                                                userDoc: widget!.doc!,
                                              ),
                                            ),
                                            Container(
                                              width: 200.0,
                                              height: 40.0,
                                              child: custom_widgets
                                                  .Datetimecountdown(
                                                width: 200.0,
                                                height: 40.0,
                                                parameter: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          FFAppState().userName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 18,
                              child: Container(
                                width: 100.0,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.065,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .customColor2,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 3.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          scaffoldKey.currentState!
                                              .openDrawer();
                                          if (animationsMap[
                                                  'containerOnActionTriggerAnimation1'] !=
                                              null) {
                                            safeSetState(() =>
                                                hasContainerTriggered1 = true);
                                            SchedulerBinding.instance
                                                .addPostFrameCallback((_) async =>
                                                    await animationsMap[
                                                            'containerOnActionTriggerAnimation1']!
                                                        .controller
                                                        .forward(from: 0.0));
                                          }
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.115,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.07,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.menu_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 18.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ).animateOnActionTrigger(
                                          animationsMap[
                                              'containerOnActionTriggerAnimation1']!,
                                          hasBeenTriggered:
                                              hasContainerTriggered1),
                                    ),
                                    Expanded(
                                      flex: 19,
                                      child: Container(
                                        width: 100.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.08,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x32000000),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.searchTextController,
                                                focusNode:
                                                    _model.searchFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.searchTextController',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    await actions
                                                        .newCustomAction4(
                                                      FFAppState()
                                                          .productHive
                                                          .toList(),
                                                      FFAppState().selBill,
                                                      FFAppState()
                                                          .selBill
                                                          .toString(),
                                                      FFAppState().disAmt,
                                                      FFAppState().delCharges,
                                                      widget!.taxcollection!
                                                          .toList(),
                                                      productAndListNewCopyAppSettingsRecord!,
                                                      _model
                                                          .searchTextController
                                                          .text,
                                                    );
                                                    safeSetState(() {
                                                      _model
                                                          .searchTextController
                                                          ?.clear();
                                                    });
                                                  },
                                                ),
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '0jwto6fg' /* Label here... */,
                                                  ),
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
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
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
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
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                validator: _model
                                                    .searchTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (FFAppState().barcodeSetting)
                                      Expanded(
                                        flex: 19,
                                        child: Container(
                                          width: 100.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.08,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x32000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 750.0,
                                                height: 50.0,
                                                child: custom_widgets
                                                    .SearchHiveprd2(
                                                  width: 750.0,
                                                  height: 50.0,
                                                  billno: FFAppState().selBill,
                                                  billnum: FFAppState()
                                                      .selBill
                                                      .toString(),
                                                  disAmt: FFAppState().disAmt,
                                                  delChargs:
                                                      FFAppState().delCharges,
                                                  document:
                                                      _model.hiveProductList!,
                                                  taxcollection:
                                                      widget!.taxcollection!,
                                                  appSettingsRecord:
                                                      productAndListNewCopyAppSettingsRecord!,
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
                            Expanded(
                              flex: 10,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 100.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.065,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().holdBillCount =
                                              FFAppState().holdBillCount + 1;
                                          FFAppState().addToAllBillsList(
                                              functions.generateBillDetailsJson(
                                                  0.0,
                                                  0.0,
                                                  0.0,
                                                  'CASH',
                                                  0.0,
                                                  0.0,
                                                  FFAppState().billAmt,
                                                  0.0,
                                                  FFAppState().finalAmt,
                                                  '0',
                                                  FFAppState()
                                                      .itemCartList
                                                      .toList(),
                                                  FFAppState().holdBillCount));
                                          FFAppState().update(() {});
                                        },
                                        child: Container(
                                          width: 36.0,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 3.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              buttonSize: 35.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              disabledColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              icon: Icon(
                                                Icons.add,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 16.0,
                                              ),
                                              onPressed:
                                                  !productAndListNewCopyAppSettingsRecord!
                                                          .showHoldListButton
                                                      ? null
                                                      : () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Builder(
                                          builder: (context) {
                                            final holdListPL = FFAppState()
                                                .allBillsList
                                                .map((e) => getJsonField(
                                                      e,
                                                      r'''$''',
                                                    ))
                                                .toList();

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: holdListPL.length,
                                              itemBuilder:
                                                  (context, holdListPLIndex) {
                                                final holdListPLItem =
                                                    holdListPL[holdListPLIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 3.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState()
                                                          .activeHoldBill = [];
                                                      FFAppState()
                                                          .addToActiveHoldBill(
                                                              getJsonField(
                                                        holdListPLItem,
                                                        r'''$.billno''',
                                                      ));
                                                      FFAppState()
                                                          .update(() {});
                                                      FFAppState().selBill =
                                                          getJsonField(
                                                        holdListPLItem,
                                                        r'''$.billno''',
                                                      );
                                                      FFAppState()
                                                          .update(() {});
                                                      _model.res11 = await actions
                                                          .calSubTotalForHoldList(
                                                        FFAppState()
                                                            .selBill
                                                            .toString(),
                                                        FFAppState()
                                                            .allBillsList
                                                            .toList(),
                                                      );
                                                      await actions.calBillAmt(
                                                        FFAppState().disAmt,
                                                        FFAppState().delCharges,
                                                      );
                                                      FFAppState()
                                                              .holdListColor =
                                                          getJsonField(
                                                        holdListPLItem,
                                                        r'''$.billno''',
                                                      );
                                                      FFAppState()
                                                          .update(() {});

                                                      safeSetState(() {});
                                                    },
                                                    onLongPress: () async {
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Delete Bill..?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'Cancel'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'Confirm'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        await actions
                                                            .removeFromAllBillList(
                                                          getJsonField(
                                                            holdListPLItem,
                                                            r'''$.billno''',
                                                          ),
                                                        );
                                                      } else {
                                                        return;
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 40.0,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: getJsonField(
                                                                  holdListPLItem,
                                                                  r'''$.billno''',
                                                                ) ==
                                                                FFAppState()
                                                                    .holdListColor
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        7.0,
                                                                        0.0,
                                                                        7.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                holdListPLItem,
                                                                r'''$.billno''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              controller:
                                                  _model.listViewController1,
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.04,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 0.5,
                                          ),
                                        ),
                                        child: FlutterFlowIconButton(
                                          icon: Icon(
                                            Icons.auto_delete,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                          onPressed: () async {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Delete All Bills..?'),
                                                          content: Text(
                                                              'Are you sure you want to delete all Bills..'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'cancle'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'confirm'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (!confirmDialogResponse) {
                                              return;
                                            }
                                            FFAppState().holdBillCount = 0;
                                            FFAppState().allBillsList = [];
                                            FFAppState().update(() {});
                                            FFAppState().itemCartList = [];
                                            FFAppState().update(() {});
                                            await actions.clearValue();
                                            FFAppState().noOfItems = 0;
                                            FFAppState().update(() {});
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
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 3.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 18,
                                child: Container(
                                  width: 100.0,
                                  height: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        3.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.115,
                                                              height: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(),
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
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            1.5),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await actions
                                                                            .hideAppbar();
                                                                        FFAppState().categoryColor =
                                                                            '';
                                                                        FFAppState()
                                                                            .update(() {});
                                                                        FFAppState().outletCatRef =
                                                                            FFAppState().catRef;
                                                                        FFAppState()
                                                                            .update(() {});
                                                                        FFAppState()
                                                                            .catAllColor = FlutterFlowTheme.of(
                                                                                context)
                                                                            .primary;
                                                                        FFAppState()
                                                                            .update(() {});
                                                                        FFAppState().categoryID =
                                                                            '';
                                                                        safeSetState(
                                                                            () {});
                                                                        FFAppState().productHive = _model
                                                                            .hiveProductList!
                                                                            .toList()
                                                                            .cast<ProductStructStruct>();
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            FFAppState().catAllColor,
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor1,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(3.0, 12.0, 3.0, 12.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'jo5mcv8s' /* All */,
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                      color: FlutterFlowTheme.of(context).lineColor,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          3.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final categoryList =
                                                                                FFAppState().categoryHive.toList();

                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: categoryList.length,
                                                                              itemBuilder: (context, categoryListIndex) {
                                                                                final categoryListItem = categoryList[categoryListIndex];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.5),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      FFAppState().catAllColor = Color(4292855973);
                                                                                      safeSetState(() {});
                                                                                      FFAppState().categoryColor = categoryListItem.id;
                                                                                      FFAppState().update(() {});
                                                                                      FFAppState().categoryID = categoryListItem.id;
                                                                                      safeSetState(() {});
                                                                                      FFAppState().productHive = _model.hiveProductList!.where((e) => e.categoryId == categoryListItem.id).toList().cast<ProductStructStruct>();
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FFAppState().categoryColor == categoryListItem.id ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondary,
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(3.0, 12.0, 3.0, 12.0),
                                                                                            child: Text(
                                                                                              categoryListItem.name.maybeHandleOverflow(
                                                                                                maxChars: 9,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).lineColor,
                                                                                                    fontSize: 15.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              controller: _model.listViewController2,
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
                                                          Expanded(
                                                            flex: 19,
                                                            child: Container(
                                                              width: 100.0,
                                                              height: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Stack(
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            1.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final productList = FFAppState()
                                                                              .productHive
                                                                              .toList();
                                                                          if (productList
                                                                              .isEmpty) {
                                                                            return Center(
                                                                              child: Image.asset(
                                                                                'assets/images/9091-empty-sad-shopping-bag.gif',
                                                                                width: MediaQuery.sizeOf(context).width * 0.28,
                                                                              ),
                                                                            );
                                                                          }

                                                                          return GridView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            gridDelegate:
                                                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                                              crossAxisCount: 4,
                                                                              crossAxisSpacing: 3.0,
                                                                              mainAxisSpacing: 4.0,
                                                                              childAspectRatio: 1.3,
                                                                            ),
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                productList.length,
                                                                            itemBuilder:
                                                                                (context, productListIndex) {
                                                                              final productListItem = productList[productListIndex];
                                                                              return Container(
                                                                                width: 113.0,
                                                                                height: 100.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).customColor2,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                ),
                                                                                child: Stack(
                                                                                  children: [
                                                                                    if (!productAndListNewCopyAppSettingsRecord!.showProductImage && !productAndListNewCopyAppSettingsRecord!.regionalLanguage)
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          if (FFAppState().holdBillCount == 0) {
                                                                                            FFAppState().holdBillCount = FFAppState().holdBillCount + 1;
                                                                                            FFAppState().addToAllBillsList(functions.generateBillDetailsJson(0.0, 0.0, 0.0, 'CASH', 0.0, 0.0, FFAppState().billAmt, 0.0, FFAppState().finalAmt, '0', FFAppState().itemCartList.toList(), FFAppState().holdBillCount));
                                                                                            FFAppState().selBill = 1;
                                                                                          }
                                                                                          _model.addtosavebill = await actions.addToHoldListprdCopy(
                                                                                            productListItem,
                                                                                            FFAppState().selBill,
                                                                                            widget!.taxcollection!.toList(),
                                                                                            functions.enabletaxinclusive(productAndListNewCopyAppSettingsRecord!.inclusiveTax),
                                                                                          );
                                                                                          _model.calculateResult = await actions.calSubTotalForHoldList(
                                                                                            FFAppState().selBill.toString(),
                                                                                            _model.addtosavebill!.toList(),
                                                                                          );
                                                                                          _model.calbillAmt = await actions.calBillAmt(
                                                                                            FFAppState().disAmt,
                                                                                            FFAppState().delCharges,
                                                                                          );
                                                                                          await _model.listViewprd?.animateTo(
                                                                                            _model.listViewprd!.position.maxScrollExtent,
                                                                                            duration: Duration(milliseconds: 100),
                                                                                            curve: Curves.ease,
                                                                                          );

                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        onDoubleTap: () async {},
                                                                                        onLongPress: () async {
                                                                                          context.pushNamed(
                                                                                            'UpdateProductNew',
                                                                                            queryParameters: {
                                                                                              'hivekey': serializeParam(
                                                                                                productListItem.hivekey,
                                                                                                ParamType.int,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                          );

                                                                                          _model.getproductForupdate = await actions.hiveGetProduct(
                                                                                            productListItem.hivekey,
                                                                                          );
                                                                                          FFAppState().productHiveput = _model.getproductForupdate!;
                                                                                          safeSetState(() {});

                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FFAppState().productColor == productListItem.id ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            borderRadius: BorderRadius.circular(5.0),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsets.all(2.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
                                                                                                  child: Text(
                                                                                                    productListItem.name.maybeHandleOverflow(maxChars: 25),
                                                                                                    textAlign: TextAlign.center,
                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'hv6ny1u6' /* ₹  */,
                                                                                                          ),
                                                                                                          textAlign: TextAlign.center,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          productListItem.sellingPrice.toString(),
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
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ).animateOnActionTrigger(animationsMap['containerOnActionTriggerAnimation3']!, hasBeenTriggered: hasContainerTriggered3),
                                                                                  ],
                                                                                ),
                                                                              ).animateOnActionTrigger(animationsMap['containerOnActionTriggerAnimation2']!, hasBeenTriggered: hasContainerTriggered2);
                                                                            },
                                                                            controller:
                                                                                _model.gridViewController,
                                                                          );
                                                                        },
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
                              ),
                              Expanded(
                                flex: 10,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 100.0,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (FFAppState().fabButtonHide)
                                            Container(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.045,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.003,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 1.0,
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.09,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.045,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController2,
                                                            focusNode: _model
                                                                .textFieldFocusNode1,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.textController2',
                                                              Duration(
                                                                  milliseconds:
                                                                      2000),
                                                              () =>
                                                                  safeSetState(
                                                                      () {}),
                                                            ),
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'avzheplm' /* Amt. */,
                                                              ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
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
                                                              enabledBorder:
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
                                                            textAlign: TextAlign
                                                                .center,
                                                            validator: _model
                                                                .textController2Validator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                      Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 1.0,
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.09,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.045,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController3,
                                                            focusNode: _model
                                                                .textFieldFocusNode2,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.textController3',
                                                              Duration(
                                                                  milliseconds:
                                                                      2000),
                                                              () =>
                                                                  safeSetState(
                                                                      () {}),
                                                            ),
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'puxbxmap' /* Qty */,
                                                              ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
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
                                                              enabledBorder:
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
                                                            textAlign: TextAlign
                                                                .center,
                                                            validator: _model
                                                                .textController3Validator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                      Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 1.0,
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.09,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.045,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController4,
                                                            focusNode: _model
                                                                .textFieldFocusNode3,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.textController4',
                                                              Duration(
                                                                  milliseconds:
                                                                      2000),
                                                              () =>
                                                                  safeSetState(
                                                                      () {}),
                                                            ),
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '4ot1x3pu' /* Price */,
                                                              ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
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
                                                              enabledBorder:
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
                                                            textAlign: TextAlign
                                                                .center,
                                                            validator: _model
                                                                .textController4Validator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 1.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: 100.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.03,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 28,
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.12,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
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
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'u7mwrk2k' /* Item Name */,
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
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 15,
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.08,
                                                            height: 100.0,
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
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'cjluuhkz' /* Qty */,
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
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 10,
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.08,
                                                            height: 100.0,
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
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '6t8ixmay' /* Amt */,
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
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 5,
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
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
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 2.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 100.0,
                                                decoration: BoxDecoration(),
                                                child: Builder(
                                                  builder: (context) {
                                                    final bill = functions
                                                        .filterBillList(
                                                            FFAppState()
                                                                .selBill,
                                                            FFAppState()
                                                                .allBillsList
                                                                .toList())
                                                        .toList();

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: bill.length,
                                                      itemBuilder:
                                                          (context, billIndex) {
                                                        final billItem =
                                                            bill[billIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.49,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.07,
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
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          5.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 28,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.265,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    billItem,
                                                                                    r'''$.name''',
                                                                                  ).toString().maybeHandleOverflow(
                                                                                        maxChars: 15,
                                                                                        replacement: '…',
                                                                                      ),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 15.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'ydg1jqm3' /* ₹  */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      billItem,
                                                                                      r'''$.price''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                                  Expanded(
                                                                    flex: 14,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          1.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.08,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(1.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Expanded(
                                                                                flex: 7,
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    _model.resultminus = await actions.addToHoldListprdminus(
                                                                                      ProductStructStruct.maybeFromMap(billItem)!,
                                                                                      FFAppState().selBill,
                                                                                      widget!.taxcollection!.toList(),
                                                                                      functions.enabletaxinclusive(productAndListNewCopyAppSettingsRecord!.inclusiveTax),
                                                                                    );
                                                                                    _model.resultmi = await actions.calSubTotalForHoldListminus(
                                                                                      FFAppState().selBill.toString(),
                                                                                      _model.resultminus!.toList(),
                                                                                    );
                                                                                    _model.reu34 = await actions.calBillAmt(
                                                                                      valueOrDefault<double>(
                                                                                        FFAppState().disAmt,
                                                                                        0.0,
                                                                                      ),
                                                                                      FFAppState().delCharges,
                                                                                    );

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.03,
                                                                                    height: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 5.0,
                                                                                          color: Color(0x27000000),
                                                                                          offset: Offset(
                                                                                            -4.0,
                                                                                            1.0,
                                                                                          ),
                                                                                          spreadRadius: 1.0,
                                                                                        )
                                                                                      ],
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(5.0),
                                                                                        bottomRight: Radius.circular(0.0),
                                                                                        topLeft: Radius.circular(5.0),
                                                                                        topRight: Radius.circular(0.0),
                                                                                      ),
                                                                                    ),
                                                                                    child: Icon(
                                                                                      Icons.remove,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 20.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 10,
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.02,
                                                                                  height: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        getJsonField(
                                                                                          billItem,
                                                                                          r'''$.quantity''',
                                                                                        ).toString(),
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 7,
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    _model.resultplus = await actions.addToHoldListprdplus(
                                                                                      ProductStructStruct.maybeFromMap(billItem)!,
                                                                                      FFAppState().selBill,
                                                                                      widget!.taxcollection!.toList(),
                                                                                      functions.enabletaxinclusive(productAndListNewCopyAppSettingsRecord!.inclusiveTax),
                                                                                    );
                                                                                    _model.res13 = await actions.calSubTotalForHoldList(
                                                                                      FFAppState().selBill.toString(),
                                                                                      _model.resultplus!.toList(),
                                                                                    );
                                                                                    _model.reuslt12 = await actions.calBillAmt(
                                                                                      valueOrDefault<double>(
                                                                                        FFAppState().disAmt,
                                                                                        0.0,
                                                                                      ),
                                                                                      FFAppState().delCharges,
                                                                                    );

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.03,
                                                                                    height: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 5.0,
                                                                                          color: Color(0x25000000),
                                                                                          offset: Offset(
                                                                                            4.0,
                                                                                            1.0,
                                                                                          ),
                                                                                          spreadRadius: 1.0,
                                                                                        )
                                                                                      ],
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(0.0),
                                                                                        bottomRight: Radius.circular(5.0),
                                                                                        topLeft: Radius.circular(0.0),
                                                                                        topRight: Radius.circular(5.0),
                                                                                      ),
                                                                                    ),
                                                                                    child: Icon(
                                                                                      Icons.add,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 20.0,
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
                                                                  Expanded(
                                                                    flex: 9,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          1.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.042,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.08,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            functions
                                                                                .getTotal(
                                                                                    valueOrDefault<double>(
                                                                                      getJsonField(
                                                                                        billItem,
                                                                                        r'''$.quantity''',
                                                                                      ),
                                                                                      0.0,
                                                                                    ),
                                                                                    valueOrDefault<double>(
                                                                                      getJsonField(
                                                                                        billItem,
                                                                                        r'''$.price''',
                                                                                      ),
                                                                                      0.0,
                                                                                    ))
                                                                                .toString(),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.03,
                                                                      decoration:
                                                                          BoxDecoration(),
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
                                                                          _model.res20 =
                                                                              await actions.removeHoldListItem(
                                                                            getJsonField(
                                                                              billItem,
                                                                              r'''$''',
                                                                            ),
                                                                            FFAppState().selBill,
                                                                          );
                                                                          _model.res21 =
                                                                              await actions.calSubTotalForHoldList(
                                                                            FFAppState().selBill.toString(),
                                                                            FFAppState().allBillsList.toList(),
                                                                          );
                                                                          _model.reuslt22 =
                                                                              await actions.calBillAmt(
                                                                            valueOrDefault<double>(
                                                                              FFAppState().disAmt,
                                                                              0.0,
                                                                            ),
                                                                            FFAppState().delCharges,
                                                                          );

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .delete,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      controller:
                                                          _model.listViewprd,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.07,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 15.0,
                                                  color: Color(0x40000000),
                                                  offset: Offset(
                                                    2.0,
                                                    -2.0,
                                                  ),
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (productAndListNewCopyAppSettingsRecord
                                                          ?.askCustomerInBillCreation ??
                                                      true)
                                                    Expanded(
                                                      flex: 11,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    2.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            scaffoldKey
                                                                .currentState!
                                                                .openEndDrawer();
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.075,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.03,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.03,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        width:
                                                                            0.5,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await actions
                                                                            .deleteAllcategory();
                                                                        await actions
                                                                            .deleteAllproduct();
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .person,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            17.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
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
                                                                        Text(
                                                                          FFAppState()
                                                                              .setCustName,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          FFAppState()
                                                                              .setCustMobNo,
                                                                          textAlign:
                                                                              TextAlign.center,
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
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '0dm0cw57' /* Item */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                        ),
                                                        Text(
                                                          FFAppState()
                                                              .noOfItems
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'fh3dvfn1' /* Qty */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            FFAppState()
                                                                .totalQuantity
                                                                .toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 6,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  3.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '9gth0o7l' /* Sub Total */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
                                                                ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '2wigtihp' /* ₹  */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                    ),
                                                              ),
                                                              Text(
                                                                FFAppState()
                                                                    .billAmt
                                                                    .toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.085,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                2.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          barrierColor:
                                                              Color(0x00000000),
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () =>
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    Container(
                                                                  height: 360.0,
                                                                  child:
                                                                      DiscountAndDeliveryCopyWidget(
                                                                    appsetting:
                                                                        productAndListNewCopyAppSettingsRecord,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));

                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation4'] !=
                                                            null) {
                                                          safeSetState(() =>
                                                              hasContainerTriggered4 =
                                                                  true);
                                                          SchedulerBinding
                                                              .instance
                                                              .addPostFrameCallback((_) async =>
                                                                  await animationsMap[
                                                                          'containerOnActionTriggerAnimation4']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                        }
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.032,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.032,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                            width: 0.5,
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .receipt,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                            size: 16.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'containerOnActionTriggerAnimation4']!,
                                                        hasBeenTriggered:
                                                            hasContainerTriggered4),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation5'] !=
                                                              null) {
                                                            safeSetState(() =>
                                                                hasContainerTriggered5 =
                                                                    true);
                                                            SchedulerBinding
                                                                .instance
                                                                .addPostFrameCallback((_) async => await animationsMap[
                                                                        'containerOnActionTriggerAnimation5']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0));
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.085,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 3.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                  1.0,
                                                                  1.0,
                                                                ),
                                                                spreadRadius:
                                                                    2.0,
                                                              )
                                                            ],
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'sm9hvpzc' /* Last Bill */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        't7zo4hkb' /* ₹ */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).lineColor,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        FFAppState()
                                                                            .lastBill
                                                                            .toString(),
                                                                        '00.00',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).lineColor,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'containerOnActionTriggerAnimation5']!,
                                                          hasBeenTriggered:
                                                              hasContainerTriggered5),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.02,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 3.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                1.0,
                                                                1.0,
                                                              ),
                                                              spreadRadius: 2.0,
                                                            )
                                                          ],
                                                        ),
                                                        child: StreamBuilder<
                                                            List<
                                                                PaymentModeRecord>>(
                                                          stream:
                                                              queryPaymentModeRecord(),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      Color(
                                                                          0x00B6001A),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<PaymentModeRecord>
                                                                dropDownPaymentModeRecordList =
                                                                snapshot.data!;

                                                            return FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .dropDownValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model.dropDownValue ??=
                                                                    FFAppState()
                                                                        .defPayMode,
                                                              ),
                                                              options:
                                                                  dropDownPaymentModeRecordList
                                                                      .map((e) =>
                                                                          e.name)
                                                                      .toList(),
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.dropDownValue =
                                                                          val),
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'en5qpl4r' /* Pay Mode */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                                size: 22.0,
                                                              ),
                                                              elevation: 2.0,
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderWidth: 0.0,
                                                              borderRadius: 0.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          7.0,
                                                                          4.0,
                                                                          5.0,
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
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.125,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.085,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '3pq7b8bs' /* Final Amt */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'uq9sjp9j' /* ₹  */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).lineColor,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      FFAppState()
                                                                          .finalAmt
                                                                          .toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).lineColor,
                                                                            fontSize:
                                                                                26.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
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
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (productAndListNewCopyAppSettingsRecord
                                                      ?.couponSaveBill ??
                                                  true)
                                                Expanded(
                                                  flex: 8,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                1.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation6'] !=
                                                            null) {
                                                          safeSetState(() =>
                                                              hasContainerTriggered6 =
                                                                  true);
                                                          SchedulerBinding
                                                              .instance
                                                              .addPostFrameCallback((_) async =>
                                                                  await animationsMap[
                                                                          'containerOnActionTriggerAnimation6']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                        }
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.15,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.085,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'dk6u9xfi' /* Coupon */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'containerOnActionTriggerAnimation6']!,
                                                        hasBeenTriggered:
                                                            hasContainerTriggered6),
                                                  ),
                                                ),
                                              if (productAndListNewCopyAppSettingsRecord
                                                      ?.upiButton ??
                                                  true)
                                                Expanded(
                                                  flex: 8,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                1.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation7'] !=
                                                            null) {
                                                          safeSetState(() =>
                                                              hasContainerTriggered7 =
                                                                  true);
                                                          SchedulerBinding
                                                              .instance
                                                              .addPostFrameCallback((_) async =>
                                                                  await animationsMap[
                                                                          'containerOnActionTriggerAnimation7']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                        }
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.15,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.085,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'g8bc0mo3' /* UPI */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'containerOnActionTriggerAnimation7']!,
                                                        hasBeenTriggered:
                                                            hasContainerTriggered7),
                                                  ),
                                                ),
                                              if (!productAndListNewCopyAppSettingsRecord!
                                                      .saveButton &&
                                                  !productAndListNewCopyAppSettingsRecord!
                                                      .upiButton)
                                                Expanded(
                                                  flex: 8,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                1.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.15,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.085,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          if (functions
                                                                  .filterBillList(
                                                                      FFAppState()
                                                                          .selBill,
                                                                      FFAppState()
                                                                          .allBillsList
                                                                          .toList())
                                                                  .length >
                                                              0) {
                                                            if (!getJsonField(
                                                              FFAppState()
                                                                  .shiftDetailsJson,
                                                              r'''$.shiftExists''',
                                                            )) {
                                                              FFAppState()
                                                                      .count =
                                                                  FFAppState()
                                                                          .count +
                                                                      1;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                            _model.prdlistsavebill =
                                                                await actions
                                                                    .filterProducts2(
                                                              FFAppState()
                                                                  .selBill,
                                                              FFAppState()
                                                                  .allBillsList
                                                                  .toList(),
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            _model.hiveInvoiceDataCopyCopy =
                                                                await actions
                                                                    .addInvoiceBillhive(
                                                              '',
                                                              functions.genInvoiceNum(
                                                                  FFAppState()
                                                                      .count,
                                                                  FFAppState()
                                                                      .shiftCount),
                                                              FFAppState()
                                                                  .setCustName,
                                                              functions
                                                                  .timestampToMili(
                                                                      getCurrentTimestamp),
                                                              functions
                                                                  .getDayId(),
                                                              _model
                                                                  .dropDownValue!,
                                                              valueOrDefault<
                                                                  double>(
                                                                FFAppState()
                                                                    .disAmt,
                                                                0.0,
                                                              ),
                                                              valueOrDefault<
                                                                  double>(
                                                                FFAppState()
                                                                    .disPer,
                                                                0.0,
                                                              ),
                                                              valueOrDefault<
                                                                  double>(
                                                                FFAppState()
                                                                    .delCharges,
                                                                0.0,
                                                              ),
                                                              FFAppState()
                                                                  .taxamt,
                                                              valueOrDefault<
                                                                  double>(
                                                                FFAppState()
                                                                    .billAmt,
                                                                0.0,
                                                              ),
                                                              valueOrDefault<
                                                                  double>(
                                                                FFAppState()
                                                                    .finalAmt,
                                                                0.0,
                                                              ),
                                                              0.0,
                                                              _model
                                                                  .prdlistsavebill
                                                                  ?.toList(),
                                                              getJsonField(
                                                                FFAppState()
                                                                    .shiftDetailsJson,
                                                                r'''$.shiftId''',
                                                              ).toString(),
                                                              false,
                                                              FFAppState()
                                                                  .invoiceStructVersion,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if (getJsonField(
                                                              FFAppState()
                                                                  .shiftDetailsJson,
                                                              r'''$.shiftExists''',
                                                            )) {
                                                              _model.shiftSummarResultsNew2 =
                                                                  await actions
                                                                      .calShiftSummaryNew(
                                                                _model
                                                                    .hiveInvoiceDataCopyCopy!,
                                                                FFAppState()
                                                                    .shiftDetailsJson,
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              _model.shiftidhive2 =
                                                                  await actions
                                                                      .shiftIdtoInt(
                                                                getJsonField(
                                                                  FFAppState()
                                                                      .shiftDetailsJson,
                                                                  r'''$.shiftId''',
                                                                ).toString(),
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              _model.getOfflineShiftdetails =
                                                                  await actions
                                                                      .hiveShiftCrud(
                                                                _model
                                                                    .shiftidhive2,
                                                                FFAppState()
                                                                    .shiftDetails,
                                                                'get',
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              FFAppState()
                                                                  .updateShiftDetailsStruct(
                                                                (e) => e
                                                                  ..billCount =
                                                                      functions.lastBillCount(_model
                                                                          .getOfflineShiftdetails!
                                                                          .billCount)
                                                                  ..totalSale =
                                                                      getJsonField(
                                                                    _model
                                                                        .shiftSummarResultsNew2,
                                                                    r'''$.totalSale''',
                                                                  )
                                                                  ..deliveryCharges =
                                                                      getJsonField(
                                                                    _model
                                                                        .shiftSummarResultsNew2,
                                                                    r'''$.deliveryCharges''',
                                                                  )
                                                                  ..tax =
                                                                      getJsonField(
                                                                    _model
                                                                        .shiftSummarResultsNew2,
                                                                    r'''$.tax''',
                                                                  )
                                                                  ..lastBillNo =
                                                                      getJsonField(
                                                                    _model
                                                                        .shiftSummarResultsNew2,
                                                                    r'''$.lastBillNo''',
                                                                  ).toString()
                                                                  ..discount =
                                                                      getJsonField(
                                                                    _model
                                                                        .shiftSummarResultsNew2,
                                                                    r'''$.discount''',
                                                                  )
                                                                  ..lastBillTime =
                                                                      functions
                                                                          .timestampToMili(
                                                                              getCurrentTimestamp)
                                                                  ..cashSale =
                                                                      getJsonField(
                                                                    _model
                                                                        .shiftSummarResultsNew2,
                                                                    r'''$.cashSale''',
                                                                  )
                                                                  ..paymentJson =
                                                                      getJsonField(
                                                                    _model
                                                                        .shiftSummarResultsNew2,
                                                                    r'''$.paymentJson''',
                                                                  ).toString()
                                                                  ..dayId =
                                                                      getJsonField(
                                                                    _model
                                                                        .shiftSummarResultsNew2,
                                                                    r'''$.dayId''',
                                                                  ).toString()
                                                                  ..code =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .code
                                                                  ..endTime =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .endTime
                                                                  ..advanceAmtTotal =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .advanceAmtTotal
                                                                  ..customerReciveAmtTotal =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .customerReciveAmtTotal
                                                                  ..expensesAmtTotal =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .expensesAmtTotal
                                                                  ..openingAmt =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .openingAmt
                                                                  ..receiveAmtTotal =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .receiveAmtTotal
                                                                  ..refoundAmount =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .refoundAmount
                                                                  ..roundOff =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .roundOff
                                                                  ..cashInHand =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .cashInHand
                                                                  ..startTime =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .startTime
                                                                  ..inActive =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .inActive
                                                                  ..shiftNo =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .shiftNo
                                                                  ..subTotalBill =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .subTotalBill
                                                                  ..userId =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .userId
                                                                  ..deviceId =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .deviceId
                                                                  ..version =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .version
                                                                  ..shiftId =
                                                                      getJsonField(
                                                                    _model
                                                                        .shiftSummarResultsNew2,
                                                                    r'''$.shiftId''',
                                                                  ).toString()
                                                                  ..synC =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .synC
                                                                  ..newIDShift =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .newIDShift
                                                                  ..hivekey =
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .hivekey
                                                                  ..id = FFAppState()
                                                                      .shiftDetails
                                                                      .id,
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                              _model.updatedShift =
                                                                  await actions
                                                                      .hiveShiftCrud(
                                                                _model
                                                                    .getOfflineShiftdetails
                                                                    ?.newIDShift,
                                                                FFAppState()
                                                                    .shiftDetails,
                                                                'update',
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              await actions
                                                                  .removeFromAllBillList(
                                                                FFAppState()
                                                                    .selBill,
                                                              );
                                                              FFAppState()
                                                                      .lastBill =
                                                                  FFAppState()
                                                                      .finalAmt;
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              await actions
                                                                  .clearValue();
                                                              FFAppState()
                                                                  .noOfItems = 0;
                                                              FFAppState()
                                                                      .subTotal =
                                                                  0.0;
                                                              FFAppState()
                                                                      .count =
                                                                  _model
                                                                      .updatedShift!
                                                                      .billCount;
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                      .finalAmt =
                                                                  0.0;
                                                              FFAppState()
                                                                      .billAmt =
                                                                  0.0;
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Login again to start Shift ',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      Color(
                                                                          0x00000000),
                                                                ),
                                                              );
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                          } else {
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '1i0hsrrk' /* Save Bill */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                  ),
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
                                                    ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'containerOnActionTriggerAnimation8']!,
                                                        hasBeenTriggered:
                                                            hasContainerTriggered8),
                                                  ),
                                                ),
                                              Expanded(
                                                flex: 8,
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation9'] !=
                                                        null) {
                                                      safeSetState(() =>
                                                          hasContainerTriggered9 =
                                                              true);
                                                      SchedulerBinding.instance
                                                          .addPostFrameCallback((_) async =>
                                                              await animationsMap[
                                                                      'containerOnActionTriggerAnimation9']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0));
                                                    }
                                                  },
                                                  child: ClipRRect(
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.15,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.085,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                      child: StreamBuilder<
                                                          OutletRecord>(
                                                        stream: OutletRecord
                                                            .getDocument(
                                                                FFAppState()
                                                                    .outletIdRef!),
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

                                                          final buttonOutletRecord =
                                                              snapshot.data!;

                                                          return FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              var _shouldSetState =
                                                                  false;
                                                              if (!getJsonField(
                                                                FFAppState()
                                                                    .shiftDetailsJson,
                                                                r'''$.shiftExists''',
                                                              )) {
                                                                FFAppState()
                                                                        .count =
                                                                    FFAppState()
                                                                            .count +
                                                                        1;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                              _model.prdlinstnewtx =
                                                                  await actions
                                                                      .filterProducts2(
                                                                FFAppState()
                                                                    .selBill,
                                                                FFAppState()
                                                                    .allBillsList
                                                                    .toList(),
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              _model.appsettingnew =
                                                                  await queryAppSettingsRecordOnce(
                                                                parent: FFAppState()
                                                                    .outletIdRef,
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);
                                                              _shouldSetState =
                                                                  true;
                                                              _model.hiveInvoiceData =
                                                                  await actions
                                                                      .addInvoiceBillhive(
                                                                '',
                                                                functions.genInvoiceNum(
                                                                    FFAppState()
                                                                        .count,
                                                                    FFAppState()
                                                                        .shiftCount),
                                                                FFAppState()
                                                                    .setCustName,
                                                                functions
                                                                    .timestampToMili(
                                                                        getCurrentTimestamp),
                                                                functions
                                                                    .getDayId(),
                                                                _model
                                                                    .dropDownValue!,
                                                                valueOrDefault<
                                                                    double>(
                                                                  FFAppState()
                                                                      .disAmt,
                                                                  0.0,
                                                                ),
                                                                valueOrDefault<
                                                                    double>(
                                                                  FFAppState()
                                                                      .disPer,
                                                                  0.0,
                                                                ),
                                                                valueOrDefault<
                                                                    double>(
                                                                  FFAppState()
                                                                      .delCharges,
                                                                  0.0,
                                                                ),
                                                                FFAppState()
                                                                    .taxamt,
                                                                valueOrDefault<
                                                                    double>(
                                                                  FFAppState()
                                                                      .billAmt,
                                                                  0.0,
                                                                ),
                                                                valueOrDefault<
                                                                    double>(
                                                                  FFAppState()
                                                                      .finalAmt,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                _model
                                                                    .prdlinstnewtx
                                                                    ?.toList(),
                                                                getJsonField(
                                                                  FFAppState()
                                                                      .shiftDetailsJson,
                                                                  r'''$.shiftId''',
                                                                ).toString(),
                                                                false,
                                                                FFAppState()
                                                                    .invoiceStructVersion,
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              if (getJsonField(
                                                                FFAppState()
                                                                    .shiftDetailsJson,
                                                                r'''$.shiftExists''',
                                                              )) {
                                                                _model.shiftSummarResultsNew =
                                                                    await actions
                                                                        .calShiftSummaryNew(
                                                                  _model
                                                                      .hiveInvoiceData!,
                                                                  FFAppState()
                                                                      .shiftDetailsJson,
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                FFAppState()
                                                                    .updateShiftDetailsStruct(
                                                                  (e) => e
                                                                    ..billCount =
                                                                        valueOrDefault<
                                                                            int>(
                                                                      functions.lastBillCount(FFAppState()
                                                                          .shiftDetails
                                                                          .billCount),
                                                                      0,
                                                                    )
                                                                    ..totalSale =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.totalSale''',
                                                                    )
                                                                    ..deliveryCharges =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.deliveryCharges''',
                                                                    )
                                                                    ..tax =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.tax''',
                                                                    )
                                                                    ..lastBillNo =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.lastBillNo''',
                                                                    ).toString()
                                                                    ..discount =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.discount''',
                                                                    )
                                                                    ..lastBillTime =
                                                                        functions
                                                                            .timestampToMili(getCurrentTimestamp)
                                                                    ..cashSale =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.cashSale''',
                                                                    )
                                                                    ..paymentJson =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.paymentJson''',
                                                                    ).toString()
                                                                    ..dayId =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.dayId''',
                                                                    ).toString()
                                                                    ..shiftId =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.shiftId''',
                                                                    ).toString()
                                                                    ..hivekey = FFAppState()
                                                                        .shiftDetails
                                                                        .hivekey
                                                                    ..newIDShift =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .newIDShift
                                                                    ..code = FFAppState()
                                                                        .shiftDetails
                                                                        .code
                                                                    ..endTime = FFAppState()
                                                                        .shiftDetails
                                                                        .endTime
                                                                    ..advanceAmtTotal =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .advanceAmtTotal
                                                                    ..customerReciveAmtTotal =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .customerReciveAmtTotal
                                                                    ..expensesAmtTotal =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .expensesAmtTotal
                                                                    ..openingAmt =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .openingAmt
                                                                    ..receiveAmtTotal =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .receiveAmtTotal
                                                                    ..refoundAmount =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .refoundAmount
                                                                    ..roundOff =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .roundOff
                                                                    ..cashInHand =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .cashInHand
                                                                    ..startTime =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .startTime
                                                                    ..inActive =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .inActive
                                                                    ..shiftNo = FFAppState()
                                                                        .shiftDetails
                                                                        .shiftNo
                                                                    ..subTotalBill =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .subTotalBill
                                                                    ..version = FFAppState()
                                                                        .shiftDetails
                                                                        .version
                                                                    ..userId = FFAppState()
                                                                        .shiftDetails
                                                                        .userId
                                                                    ..deviceId =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .deviceId
                                                                    ..synC = FFAppState()
                                                                        .shiftDetails
                                                                        .synC
                                                                    ..id = FFAppState()
                                                                        .shiftDetails
                                                                        .id,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                                _model.updatedShiftDetails =
                                                                    await actions
                                                                        .hiveShiftCrud(
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .newIDShift,
                                                                  FFAppState()
                                                                      .shiftDetails,
                                                                  'update',
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Login again to start Shift ',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        Color(
                                                                            0x00000000),
                                                                  ),
                                                                );
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }

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
                                                              await actions
                                                                  .connectDevice(
                                                                FFAppState()
                                                                    .printerDevice,
                                                                FFAppState()
                                                                    .printerIndex,
                                                              );
                                                              if (FFAppState()
                                                                          .printerName !=
                                                                      null &&
                                                                  FFAppState()
                                                                          .printerName !=
                                                                      '') {
                                                                FFAppState()
                                                                        .lastBill =
                                                                    FFAppState()
                                                                        .finalAmt;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                _model.returnedList2 =
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
                                                                await actions
                                                                    .printBillnewhive(
                                                                  _model
                                                                      .returnedList2!
                                                                      .toList(),
                                                                  _model.device!
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .isPrinterConnected,
                                                                  FFAppState()
                                                                      .printerName,
                                                                  getJsonField(
                                                                    functions
                                                                        .outletDocToJson(
                                                                            buttonOutletRecord),
                                                                    r'''$''',
                                                                  ),
                                                                  _model
                                                                      .hiveInvoiceData!,
                                                                  FFAppState()
                                                                      .paperSize,
                                                                  _model
                                                                      .appsettingnew!,
                                                                );
                                                                await actions
                                                                    .removeFromAllBillList(
                                                                  FFAppState()
                                                                      .selBill,
                                                                );
                                                                await actions
                                                                    .clearValue();
                                                                FFAppState()
                                                                        .subTotal =
                                                                    0.0;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                        .finalAmt =
                                                                    0.0;
                                                                FFAppState()
                                                                        .billAmt =
                                                                    0.0;
                                                                FFAppState()
                                                                        .count =
                                                                    _model
                                                                        .updatedShiftDetails!
                                                                        .billCount;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
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
                                                                      content: Text(
                                                                          'printer not connected'),
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
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '8vokykva' /* Print Bill */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 130.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                  ),
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
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation9']!,
                                                    hasBeenTriggered:
                                                        hasContainerTriggered9),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
              ),
            ));
      },
    );
  }
}
