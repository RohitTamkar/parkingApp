import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kiosk_cart_model.dart';
export 'kiosk_cart_model.dart';

class KioskCartWidget extends StatefulWidget {
  const KioskCartWidget({
    super.key,
    this.doc,
    this.shiftdetails,
    this.appsetting,
    this.taxcollection,
  });

  final DocumentReference? doc;
  final dynamic shiftdetails;
  final AppSettingsRecord? appsetting;
  final List<TaxMasterRecord>? taxcollection;

  @override
  State<KioskCartWidget> createState() => _KioskCartWidgetState();
}

class _KioskCartWidgetState extends State<KioskCartWidget> {
  late KioskCartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KioskCartModel());

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
        title: 'KioskCart',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: AlignmentDirectional(0.0, -1.0),
                    image: Image.asset(
                      'assets/images/Top_img_4.png',
                    ).image,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 15.0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.14,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: wrapWithModel(
                                  model: _model.kioskHeaderModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: KioskHeaderWidget(),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 20.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          borderRadius: 15.0,
                                          borderWidth: 0.5,
                                          buttonSize: 65.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          icon: Icon(
                                            Icons.keyboard_backspace_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 40.0,
                                          ),
                                          onPressed: () async {
                                            context.pushNamed(
                                              'KioskBillScreen',
                                              queryParameters: {
                                                'doc': serializeParam(
                                                  widget!.doc,
                                                  ParamType.DocumentReference,
                                                ),
                                                'shiftdoc': serializeParam(
                                                  widget!.shiftdetails,
                                                  ParamType.JSON,
                                                ),
                                                'appsetting': serializeParam(
                                                  widget!.appsetting,
                                                  ParamType.Document,
                                                ),
                                                'taxcollection': serializeParam(
                                                  widget!.taxcollection,
                                                  ParamType.Document,
                                                  isList: true,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'appsetting':
                                                    widget!.appsetting,
                                                'taxcollection':
                                                    widget!.taxcollection,
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '770ul0ha' /* Confirm Your Order */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 30.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 5.0,
                                        buttonSize: 75.0,
                                        icon: Icon(
                                          Icons.keyboard_backspace_outlined,
                                          color: Colors.transparent,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      if (FFAppState().orderType == 'DINE IN')
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'xjiq6xxv' /* Dine In */,
                                          ),
                                          icon: Icon(
                                            Icons.dinner_dining_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 30.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 65.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0x00B6001A),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 24.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      if (FFAppState().orderType == 'PARCEL')
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'rck93vde' /* Parcel */,
                                          ),
                                          icon: Icon(
                                            Icons.takeout_dining_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 30.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 65.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0x00B6001A),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 24.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 0.0, 25.0, 20.0),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF0FFF0),
                                  borderRadius: BorderRadius.circular(40.0),
                                  border: Border.all(
                                    color: Color(0xFF61D36B),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25.0, 25.0, 25.0, 75.0),
                                        child: Builder(
                                          builder: (context) {
                                            final listview = functions
                                                .filterBillList(
                                                    FFAppState().selBill,
                                                    FFAppState()
                                                        .allBillsList
                                                        .toList())
                                                .toList();

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: listview.length,
                                              itemBuilder:
                                                  (context, listviewIndex) {
                                                final listviewItem =
                                                    listview[listviewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 7.0,
                                                          color:
                                                              Color(0x25000000),
                                                          offset: Offset(
                                                            3.0,
                                                            5.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(15.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            flex: 2,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                getJsonField(
                                                                  listviewItem,
                                                                  r'''$.imageUrl''',
                                                                ).toString(),
                                                                width: 300.0,
                                                                height: 110.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 8,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      functions.returnTitlecase(getJsonField(
                                                                                        listviewItem,
                                                                                        r'''$.name''',
                                                                                      ).toString()),
                                                                                      '0',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                          color: Color(0xFF033BE8),
                                                                                          fontSize: 18.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                if (!valueOrDefault<bool>(
                                                                                  widget!.appsetting?.settingList?.where((e) => e.title == 'hideRegionalLanguage').toList()?.first?.value,
                                                                                  false,
                                                                                ))
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        listviewItem,
                                                                                        r'''$.regionalName''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                            color: Color(0xFF033BE8),
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '5ctume8n' /* ₹  */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                          color: Color(0xFF0046D3),
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                        ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: getJsonField(
                                                                                      listviewItem,
                                                                                      r'''$.price''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                          color: Color(0xFF0046D3),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                        ),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                      color: Color(0xFF0046D3),
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                    ),
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              25.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                170.0,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.033,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFC6E88C),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(12.0),
                                                                                bottomRight: Radius.circular(12.0),
                                                                                topLeft: Radius.circular(12.0),
                                                                                topRight: Radius.circular(12.0),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 12.0,
                                                                                    buttonSize: double.infinity,
                                                                                    fillColor: Color(0xFFA7D348),
                                                                                    icon: Icon(
                                                                                      Icons.remove_sharp,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 20.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      _model.res2cart = await actions.reduceQuantityHoldListkiosk(
                                                                                        listviewItem,
                                                                                        FFAppState().selBill,
                                                                                        widget!.taxcollection!.toList(),
                                                                                        functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                          widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.first?.value,
                                                                                          false,
                                                                                        )),
                                                                                      );
                                                                                      _model.res2345 = await actions.calSubTotalForHoldListkiosk(
                                                                                        valueOrDefault<String>(
                                                                                          FFAppState().selBill.toString(),
                                                                                          '1',
                                                                                        ),
                                                                                        FFAppState().allBillsList.toList(),
                                                                                        functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                          widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.first?.value,
                                                                                          false,
                                                                                        )),
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
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        listviewItem,
                                                                                        r'''$.quantity''',
                                                                                      ).toString(),
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                            fontSize: 15.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 12.0,
                                                                                    buttonSize: double.infinity,
                                                                                    fillColor: Color(0xFFA7D348),
                                                                                    icon: Icon(
                                                                                      Icons.add,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 20.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      _model.resultkioskcart = await actions.plusQuantityHoldListkiosk(
                                                                                        getJsonField(
                                                                                          listviewItem,
                                                                                          r'''$''',
                                                                                        ),
                                                                                        FFAppState().selBill,
                                                                                        widget!.taxcollection!.toList(),
                                                                                        functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                          widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.first?.value,
                                                                                          false,
                                                                                        )),
                                                                                      );
                                                                                      _model.res23456 = await actions.calSubTotalForHoldListkiosk(
                                                                                        valueOrDefault<String>(
                                                                                          FFAppState().selBill.toString(),
                                                                                          '1',
                                                                                        ),
                                                                                        FFAppState().allBillsList.toList(),
                                                                                        functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                          widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.first?.value,
                                                                                          false,
                                                                                        )),
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
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'tsogvgdy' /* Sub Total : */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                            color: Color(0xFF00A03F),
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  RichText(
                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        TextSpan(
                                                                                          text: FFLocalizations.of(context).getText(
                                                                                            'w0u1zlir' /* ₹  */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                color: Color(0xFF00A03F),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: functions
                                                                                              .getTotal(
                                                                                                  getJsonField(
                                                                                                    listviewItem,
                                                                                                    r'''$.quantity''',
                                                                                                  ),
                                                                                                  getJsonField(
                                                                                                    listviewItem,
                                                                                                    r'''$.price''',
                                                                                                  ))
                                                                                              .toString(),
                                                                                          style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                                color: Color(0xFF00A03F),
                                                                                                fontSize: 15.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                                              ),
                                                                                        )
                                                                                      ],
                                                                                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                            color: Color(0xFF0046D3),
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                          ),
                                                                                    ),
                                                                                    textAlign: TextAlign.center,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            FlutterFlowIconButton(
                                                                              borderColor: FlutterFlowTheme.of(context).primary,
                                                                              borderRadius: 12.0,
                                                                              borderWidth: 0.5,
                                                                              buttonSize: 40.0,
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              icon: Icon(
                                                                                Icons.delete_rounded,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 18.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                _model.res20Copy = await actions.removeHoldListItem(
                                                                                  listviewItem,
                                                                                  FFAppState().selBill,
                                                                                );
                                                                                _model.res21Copy = await actions.calSubTotalForHoldList(
                                                                                  FFAppState().selBill.toString(),
                                                                                  FFAppState().allBillsList.toList(),
                                                                                );
                                                                                _model.reuslt22Copy = await actions.calBillAmt(
                                                                                  valueOrDefault<double>(
                                                                                    FFAppState().disAmt,
                                                                                    0.0,
                                                                                  ),
                                                                                  valueOrDefault<double>(
                                                                                    FFAppState().delCharges,
                                                                                    0.0,
                                                                                  ),
                                                                                );
                                                                                FFAppState().removeFromCartItem(functions.returnidRef(
                                                                                    getJsonField(
                                                                                      listviewItem,
                                                                                      r'''$.id''',
                                                                                    ).toString(),
                                                                                    FFAppState().outletIdRef!.id)!);
                                                                                safeSetState(() {});

                                                                                safeSetState(() {});
                                                                              },
                                                                            ),
                                                                          ],
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
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 100.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (false)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              FFAppState().orderId =
                                                  FFAppState().orderId + 10;
                                              FFAppState().paytmOrderId =
                                                  'ORD-${FFAppState().orderId.toString()}${getCurrentTimestamp.millisecondsSinceEpoch.toString()}';
                                              safeSetState(() {});
                                              _model.closeUnixTime =
                                                  await actions
                                                      .setCloseUnixTime(
                                                getCurrentTimestamp,
                                                10,
                                              );
                                              _model.qrResp =
                                                  await RazorpayQRCreationCall
                                                      .call(
                                                type: 'upi_qr',
                                                name: 'Mrunaal Nerlikar',
                                                paymentAmount:
                                                    FFAppState().finalAmt,
                                                description: 'Bill',
                                                closeBy: _model.closeUnixTime
                                                    ?.secondsSinceEpoch,
                                                isProd: true,
                                                purpose: 'Bill',
                                                fixedAmount: true,
                                                orderId:
                                                    FFAppState().paytmOrderId,
                                                posId: FFAppState().outletId,
                                              );

                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Response'),
                                                    content: Text((_model.qrResp
                                                                ?.jsonBody ??
                                                            '')
                                                        .toString()),
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

                                              context.pushNamed(
                                                'KioskPayment',
                                                queryParameters: {
                                                  'doc': serializeParam(
                                                    widget!.doc,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'shiftdetails':
                                                      serializeParam(
                                                    widget!.shiftdetails,
                                                    ParamType.JSON,
                                                  ),
                                                  'qrJson': serializeParam(
                                                    (_model.qrResp?.jsonBody ??
                                                        ''),
                                                    ParamType.JSON,
                                                  ),
                                                  'paytmOrderId':
                                                      serializeParam(
                                                    FFAppState().paytmOrderId,
                                                    ParamType.String,
                                                  ),
                                                  'isPaytm': serializeParam(
                                                    false,
                                                    ParamType.bool,
                                                  ),
                                                  'appsettings': serializeParam(
                                                    widget!.appsetting,
                                                    ParamType.Document,
                                                  ),
                                                  'taxcollection':
                                                      serializeParam(
                                                    widget!.taxcollection,
                                                    ParamType.Document,
                                                    isList: true,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'appsettings':
                                                      widget!.appsetting,
                                                  'taxcollection':
                                                      widget!.taxcollection,
                                                },
                                              );

                                              safeSetState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'mhpv2zkx' /* Proceed to Razorpay for paymen... */,
                                            ),
                                            icon: Icon(
                                              Icons.chevron_right,
                                              size: 25.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.4,
                                              height: 65.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLargeFamily,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily),
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Container(
                                width: double.infinity,
                                height: 95.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Are You Sure You Want To Cancel This Order ?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child:
                                                              Text('Confirm'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          await actions.removeFromAllBillList(
                                            FFAppState().selBill,
                                          );
                                          await actions.clearValue();
                                          FFAppState().subTotal = 0.0;
                                          FFAppState().update(() {});
                                          FFAppState().finalAmt = 0.0;
                                          FFAppState().billAmt = 0.0;
                                          FFAppState().count =
                                              FFAppState().count;
                                          FFAppState().cartItem = [];
                                          FFAppState().isBillPrinted = true;
                                          FFAppState().noOfItems = 0;
                                          FFAppState().update(() {});

                                          context.pushNamed(
                                            'KioskBillScreen',
                                            queryParameters: {
                                              'doc': serializeParam(
                                                widget!.doc,
                                                ParamType.DocumentReference,
                                              ),
                                              'shiftdoc': serializeParam(
                                                widget!.shiftdetails,
                                                ParamType.JSON,
                                              ),
                                              'appsetting': serializeParam(
                                                widget!.appsetting,
                                                ParamType.Document,
                                              ),
                                              'taxcollection': serializeParam(
                                                widget!.taxcollection,
                                                ParamType.Document,
                                                isList: true,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'appsetting': widget!.appsetting,
                                              'taxcollection':
                                                  widget!.taxcollection,
                                            },
                                          );
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        's9g1enft' /* Cancel Order */,
                                      ),
                                      icon: Icon(
                                        Icons.close,
                                        size: 24.0,
                                      ),
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.25,
                                        height: 95.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0x00B6001A),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Icon(
                                            Icons.shopping_cart_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            FFAppState().noOfItems.toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displayLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily,
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displayLargeFamily),
                                              ),
                                        ),
                                      ],
                                    ),
                                    RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '9dk0mden' /* ₹  */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmallFamily),
                                                ),
                                          ),
                                          TextSpan(
                                            text: FFAppState()
                                                .finalAmt
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmallFamily),
                                                ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (FFAppState().isPrinterConnected) {
                                            _model.outletDOc =
                                                await queryOutletRecordOnce(
                                              queryBuilder: (outletRecord) =>
                                                  outletRecord.where(
                                                'id',
                                                isEqualTo: FFAppState()
                                                    .outletIdRef
                                                    ?.id,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _model.qrDocumentcount =
                                                await queryQrTransactionsRecordOnce(
                                              parent: FFAppState().outletIdRef,
                                              queryBuilder:
                                                  (qrTransactionsRecord) =>
                                                      qrTransactionsRecord
                                                          .orderBy(
                                                              'createdDate',
                                                              descending: true),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            if (_model.qrDocumentcount !=
                                                null) {
                                              FFAppState().count =
                                                  valueOrDefault<int>(
                                                functions.returncount(
                                                    valueOrDefault<String>(
                                                  _model
                                                      .qrDocumentcount?.orderId,
                                                  '0',
                                                )),
                                                0,
                                              );
                                              safeSetState(() {});
                                            } else {
                                              FFAppState().count = 0;
                                              safeSetState(() {});
                                            }

                                            if (functions
                                                .filterBillList(
                                                    FFAppState().selBill,
                                                    FFAppState()
                                                        .allBillsList
                                                        .toList())
                                                .isNotEmpty) {
                                              if (_model.outletDOc
                                                          ?.merchantId !=
                                                      null &&
                                                  _model.outletDOc
                                                          ?.merchantId !=
                                                      '') {
                                                if (getJsonField(
                                                  widget!.shiftdetails,
                                                  r'''$.shiftExists''',
                                                )) {
                                                  FFAppState().count =
                                                      FFAppState().count + 1;
                                                  safeSetState(() {});
                                                } else {
                                                  FFAppState().count =
                                                      FFAppState().count + 1;
                                                  safeSetState(() {});
                                                }

                                                FFAppState().orderId =
                                                    FFAppState().orderId + 10;
                                                FFAppState().paytmOrderId =
                                                    valueOrDefault<String>(
                                                  'ORD-${functions.genInvoiceNum(FFAppState().count, getJsonField(
                                                        widget!.shiftdetails,
                                                        r'''$.shiftCount''',
                                                      ))}',
                                                  '0',
                                                );
                                                FFAppState().outletId =
                                                    _model.outletDOc!.id;
                                                safeSetState(() {});
                                                _model.paymentQrResponse =
                                                    await CreateQRCall.call(
                                                  mid: valueOrDefault<String>(
                                                    _model
                                                        .outletDOc?.merchantId,
                                                    '0',
                                                  ),
                                                  orderId:
                                                      FFAppState().paytmOrderId,
                                                  amount: functions.toDecimal(
                                                      FFAppState().finalAmt),
                                                  businessType: 'UPI_QR_CODE',
                                                  posId: FFAppState().outletId,
                                                  mKey: valueOrDefault<String>(
                                                    _model
                                                        .outletDOc?.merchantKey,
                                                    '0',
                                                  ),
                                                  isProd:
                                                      _model.outletDOc?.isProd,
                                                );

                                                context.pushNamed(
                                                  'KioskPayment',
                                                  queryParameters: {
                                                    'doc': serializeParam(
                                                      widget!.doc,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'shiftdetails':
                                                        serializeParam(
                                                      widget!.shiftdetails,
                                                      ParamType.JSON,
                                                    ),
                                                    'qrJson': serializeParam(
                                                      (_model.paymentQrResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                      ParamType.JSON,
                                                    ),
                                                    'paytmOrderId':
                                                        serializeParam(
                                                      FFAppState().paytmOrderId,
                                                      ParamType.String,
                                                    ),
                                                    'isPaytm': serializeParam(
                                                      true,
                                                      ParamType.bool,
                                                    ),
                                                    'appsettings':
                                                        serializeParam(
                                                      widget!.appsetting,
                                                      ParamType.Document,
                                                    ),
                                                    'taxcollection':
                                                        serializeParam(
                                                      widget!.taxcollection,
                                                      ParamType.Document,
                                                      isList: true,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'appsettings':
                                                        widget!.appsetting,
                                                    'taxcollection':
                                                        widget!.taxcollection,
                                                  },
                                                );
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Merchant Id  Is Not Available Contact Support!'),
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
                                                    content:
                                                        Text('Cart Is Empty !'),
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

                                              context.pushNamed(
                                                'KioskBillScreen',
                                                queryParameters: {
                                                  'doc': serializeParam(
                                                    widget!.doc,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'shiftdoc': serializeParam(
                                                    widget!.shiftdetails,
                                                    ParamType.JSON,
                                                  ),
                                                  'appsetting': serializeParam(
                                                    widget!.appsetting,
                                                    ParamType.Document,
                                                  ),
                                                  'taxcollection':
                                                      serializeParam(
                                                    widget!.taxcollection,
                                                    ParamType.Document,
                                                    isList: true,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'appsetting':
                                                      widget!.appsetting,
                                                  'taxcollection':
                                                      widget!.taxcollection,
                                                },
                                              );
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'Printer Not Connected !'),
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
                                            _model.connectdeviceCOPY23 =
                                                await actions.connectDevice(
                                              FFAppState().printerDevice,
                                              FFAppState().printerIndex,
                                            );
                                          }

                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'sq4xgrw1' /* Proceed to Payment */,
                                        ),
                                        icon: Icon(
                                          Icons.chevron_right,
                                          size: 25.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.35,
                                          height: 95.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF00A03F),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
          ),
        ));
  }
}
