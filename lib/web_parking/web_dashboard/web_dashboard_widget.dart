import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/web_parking/nav_bar_web_parking/nav_bar_web_parking_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'web_dashboard_model.dart';
export 'web_dashboard_model.dart';

class WebDashboardWidget extends StatefulWidget {
  const WebDashboardWidget({
    super.key,
    this.outletId,
    this.shiftRef,
    this.userId,
    this.mobile,
  });

  final DocumentReference? outletId;
  final DocumentReference? shiftRef;
  final String? userId;
  final String? mobile;

  @override
  State<WebDashboardWidget> createState() => _WebDashboardWidgetState();
}

class _WebDashboardWidgetState extends State<WebDashboardWidget> {
  late WebDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebDashboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.shiftExist = await actions.isValidShift(
        FFAppState().outletId,
        functions.getDayId(),
      );
      FFAppState().isVisible = _model.shiftExist!;
      safeSetState(() {});
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

    return StreamBuilder<List<ShiftRecord>>(
      stream: queryShiftRecord(
        parent: FFAppState().outletIdRef,
        queryBuilder: (shiftRecord) => shiftRecord.where(
          'dayId',
          isEqualTo: functions.getDayId() != '' ? functions.getDayId() : null,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
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
        List<ShiftRecord> webDashboardShiftRecordList = snapshot.data!;

        return Title(
            title: 'WebDashboard',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  key: scaffoldKey,
                  body: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 2,
                        child: wrapWithModel(
                          model: _model.navBarWebParkingModel,
                          updateCallback: () => safeSetState(() {}),
                          child: NavBarWebParkingWidget(),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 2,
                              child: StreamBuilder<OutletRecord>(
                                stream: OutletRecord.getDocument(
                                    FFAppState().outletIdRef!),
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

                                  final outletNameOutletRecord = snapshot.data!;

                                  return Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30.0, 10.0, 30.0, 15.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.7,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.09,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 3.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'e6nl00gw' /* Outlet Name  */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: Color(
                                                                    0xFF0D0801),
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          outletNameOutletRecord
                                                              .name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLargeFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineLargeFamily),
                                                              ),
                                                        ),
                                                      ),
                                                      AutoSizeText(
                                                        outletNameOutletRecord
                                                            .branch,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 5.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 10.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 45.0,
                                                    icon: Icon(
                                                      Icons
                                                          .account_circle_outlined,
                                                      color: Color(0xFF0D0801),
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                        'VehicleEntry',
                                                        queryParameters: {
                                                          'shiftDoc':
                                                              serializeParam(
                                                            FFAppState()
                                                                .shiftDetailsNEw,
                                                            ParamType.JSON,
                                                          ),
                                                          'userRef':
                                                              serializeParam(
                                                            currentUserReference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '5ljc9mla' /* Account */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          color:
                                                              Color(0xFF0D0801),
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily),
                                                        ),
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
                            Expanded(
                              flex: 12,
                              child: StreamBuilder<List<ShiftRecord>>(
                                stream: queryShiftRecord(
                                  parent: FFAppState().outletIdRef,
                                  queryBuilder: (shiftRecord) =>
                                      shiftRecord.where(
                                    'shiftId',
                                    isEqualTo: _model.choiceChipsValue != ''
                                        ? _model.choiceChipsValue
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
                                  List<ShiftRecord> rowShiftRecordList =
                                      snapshot.data!;
                                  final rowShiftRecord =
                                      rowShiftRecordList.isNotEmpty
                                          ? rowShiftRecordList.first
                                          : null;

                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(30.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'nodbznbp' /* Today's Overview  */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmallFamily,
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily),
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 25.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'sbk97oxm' /* 22-11-2024, Friday */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLargeFamily,
                                                          color:
                                                              Color(0xFF01020D),
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily),
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 15.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(15.0),
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
                                                                        20.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.fire_truck,
                                                              color: Color(
                                                                  0xFFEFED91),
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
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
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '6ab3l0pz' /* 15 */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'lzzsqsfc' /* Vendor */,
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
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 15.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(15.0),
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
                                                                        20.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.two_wheeler,
                                                              color: Color(
                                                                  0xFFFFA6B4),
                                                              size: 40.0,
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
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
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ndgzyr6l' /* 24 */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'p3u3q6yp' /* Two Wheelers */,
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
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 15.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(15.0),
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
                                                                        20.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .directions_bus_sharp,
                                                              color: Color(
                                                                  0xFF98EDBD),
                                                              size: 40.0,
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
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
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '50uiore8' /* 2 */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '9e3lknr0' /* Bus */,
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
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 15.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(15.0),
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
                                                                        20.0,
                                                                        0.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .carSide,
                                                              color: Color(
                                                                  0xFFA3BEF0),
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
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
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '3yvqv6g9' /* 9 */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'xap1xv7u' /* Four Wheelers */,
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
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: Container(
                                          height: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 14,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
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
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0.0),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    10.0,
                                                                    20.0,
                                                                    10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.03,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'ghmsyv3x' /* Last Sync */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'z7xns8x1' /* 1 min ago */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ],
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
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: ListView(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          200.0,
                                                                      child:
                                                                          Text(
                                                                        functions
                                                                            .totalShiftSale(rowShiftRecord!,
                                                                                rowShiftRecord!.totalSale)
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    FlutterFlowChoiceChips(
                                                                      options: webDashboardShiftRecordList
                                                                          .map((e) => e
                                                                              .shiftId)
                                                                          .toList()
                                                                          .map((label) =>
                                                                              ChipData(label))
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.choiceChipsValue = val?.firstOrNull),
                                                                      selectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                        iconColor:
                                                                            Color(0x00000000),
                                                                        iconSize:
                                                                            18.0,
                                                                        labelPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            15.0,
                                                                            2.0,
                                                                            15.0,
                                                                            2.0),
                                                                        elevation:
                                                                            2.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      unselectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).accent4,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                        iconColor:
                                                                            Color(0x00000000),
                                                                        iconSize:
                                                                            18.0,
                                                                        labelPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        elevation:
                                                                            0.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      chipSpacing:
                                                                          8.0,
                                                                      rowSpacing:
                                                                          12.0,
                                                                      multiselect:
                                                                          false,
                                                                      initialized:
                                                                          _model.choiceChipsValue !=
                                                                              null,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      controller: _model
                                                                              .choiceChipsValueController ??=
                                                                          FormFieldController<
                                                                              List<String>>(
                                                                        [
                                                                          '${functions.getDayId()}-1'
                                                                        ],
                                                                      ),
                                                                      wrapped:
                                                                          true,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Stack(
                                                                children: [
                                                                  StreamBuilder<
                                                                      List<
                                                                          ShiftRecord>>(
                                                                    stream:
                                                                        queryShiftRecord(
                                                                      parent: FFAppState()
                                                                          .outletIdRef,
                                                                      queryBuilder:
                                                                          (shiftRecord) =>
                                                                              shiftRecord.where(
                                                                        'shiftId',
                                                                        isEqualTo: _model.choiceChipsValue !=
                                                                                ''
                                                                            ? _model.choiceChipsValue
                                                                            : null,
                                                                      ),
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
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            child:
                                                                                SpinKitFadingCircle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 40.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<ShiftRecord>
                                                                          containerShiftRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      final containerShiftRecord = containerShiftRecordList
                                                                              .isNotEmpty
                                                                          ? containerShiftRecordList
                                                                              .first
                                                                          : null;

                                                                      return Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          primary:
                                                                              false,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.stretch,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        width: 100.0,
                                                                                        decoration: BoxDecoration(
                                                                                          gradient: LinearGradient(
                                                                                            colors: [
                                                                                              Color(0xFFEA6C95),
                                                                                              Color(0xFFA90035)
                                                                                            ],
                                                                                            stops: [0.0, 1.0],
                                                                                            begin: AlignmentDirectional(0.98, -1.0),
                                                                                            end: AlignmentDirectional(-0.98, 1.0),
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(5.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(20.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
                                                                                                child: FaIcon(
                                                                                                  FontAwesomeIcons.coins,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  size: 30.0,
                                                                                                ),
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                    child: AutoSizeText(
                                                                                                      '₹${rowShiftRecord?.totalSale?.toString()}',
                                                                                                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            fontSize: 20.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'q8ga6y36' /* Total Sale */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          fontSize: 16.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                                        ),
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
                                                                                        width: 100.0,
                                                                                        decoration: BoxDecoration(
                                                                                          gradient: LinearGradient(
                                                                                            colors: [
                                                                                              Color(0xFF45CF3A),
                                                                                              Color(0xFF097000)
                                                                                            ],
                                                                                            stops: [0.0, 1.0],
                                                                                            begin: AlignmentDirectional(0.98, -1.0),
                                                                                            end: AlignmentDirectional(-0.98, 1.0),
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(5.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(20.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
                                                                                                child: FaIcon(
                                                                                                  FontAwesomeIcons.moneyBillAlt,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  size: 30.0,
                                                                                                ),
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                          child: Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'deu2ap15' /* ₹ */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  fontSize: 20.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        AutoSizeText(
                                                                                                          functions.paymentModeStrToJson(rowShiftRecord!.paymentJson, 'cash'),
                                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                fontSize: 20.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'npe0ex3c' /* Cash in Hand */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          fontSize: 16.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                                        ),
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
                                                                                        width: 100.0,
                                                                                        decoration: BoxDecoration(
                                                                                          gradient: LinearGradient(
                                                                                            colors: [
                                                                                              Color(0xFF605CE8),
                                                                                              Color(0xFF16137F)
                                                                                            ],
                                                                                            stops: [0.0, 1.0],
                                                                                            begin: AlignmentDirectional(0.98, -1.0),
                                                                                            end: AlignmentDirectional(-0.98, 1.0),
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(5.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(20.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
                                                                                                child: Icon(
                                                                                                  Icons.install_mobile_outlined,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  size: 30.0,
                                                                                                ),
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                          child: Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'gfpdu4iw' /* ₹ */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  fontSize: 20.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        AutoSizeText(
                                                                                                          functions.paymentModeStrToJson(rowShiftRecord!.paymentJson, 'googlepay + paytm + phonepe'),
                                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                fontSize: 20.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'axlisxdl' /* UPI Sale */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          fontSize: 16.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 15.0)),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.95,
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(0.0),
                                                                                            bottomRight: Radius.circular(10.0),
                                                                                            topLeft: Radius.circular(10.0),
                                                                                            topRight: Radius.circular(0.0),
                                                                                          ),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                              child: AutoSizeText(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'x1kl1yx0' /* Payment Modes */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Container(
                                                                                                      width: 100.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                              child: AutoSizeText(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'ovwrvm3b' /* GPay */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      'rl1miu2r' /* ₹ */,
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                AutoSizeText(
                                                                                                                  functions.paymentModeStrToJson(containerShiftRecord!.paymentJson, 'googlepay'),
                                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                                      ),
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
                                                                                                      width: 100.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                              child: AutoSizeText(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'szr4jeit' /* Paytm */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      'nqx6n7kz' /* ₹ */,
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                AutoSizeText(
                                                                                                                  functions.paymentModeStrToJson(containerShiftRecord!.paymentJson, 'paytm'),
                                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                                      ),
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
                                                                                                      width: 100.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                              child: AutoSizeText(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  '8onom4sq' /* PhonePe */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      's8y5yoe9' /* ₹ */,
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                AutoSizeText(
                                                                                                                  functions.paymentModeStrToJson(containerShiftRecord!.paymentJson, 'phonepe'),
                                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                                      ),
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
                                                                                                      width: 100.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                              child: AutoSizeText(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  '433kfs8x' /* Cash */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      '7mgr8tl0' /* ₹ */,
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                AutoSizeText(
                                                                                                                  functions.paymentModeStrToJson(containerShiftRecord!.paymentJson, 'cash'),
                                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 10.0)),
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Container(
                                                                                                    width: 100.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      borderRadius: BorderRadius.circular(5.0),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                            child: AutoSizeText(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'j92bljzf' /* Card */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'mfwsq3iw' /* ₹ */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              AutoSizeText(
                                                                                                                functions.paymentModeStrToJson(containerShiftRecord!.paymentJson, 'card'),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                                    ),
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
                                                                                                    width: 100.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      borderRadius: BorderRadius.circular(5.0),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                            child: AutoSizeText(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'n713blzr' /* Cheque */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'hirehmw8' /* ₹ */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              AutoSizeText(
                                                                                                                functions.paymentModeStrToJson(containerShiftRecord!.paymentJson, 'cheque'),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                                    ),
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
                                                                                                    width: 100.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      borderRadius: BorderRadius.circular(5.0),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                            child: AutoSizeText(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                '36ufo7sq' /* Other */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'w6piacdz' /* ₹ */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              AutoSizeText(
                                                                                                                functions.paymentModeStrToJson(containerShiftRecord!.paymentJson, 'other'),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                                    ),
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
                                                                                                    width: 100.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      borderRadius: BorderRadius.circular(5.0),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                            child: AutoSizeText(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'bkuvds3g' /* Credit */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                    fontSize: 14.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'cykkymri' /* ₹ */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        fontSize: 14.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              AutoSizeText(
                                                                                                                functions.paymentModeStrToJson(containerShiftRecord!.paymentJson, 'credit'),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      fontSize: 16.0,
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
                                                                                              ].divide(SizedBox(width: 10.0)),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(20.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                              child: AutoSizeText(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'cc3e6do0' /* Summary */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  AutoSizeText(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'kj3bvda8' /* No. of Bills */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  AutoSizeText(
                                                                                                    valueOrDefault<String>(
                                                                                                      containerShiftRecord?.billCount?.toString(),
                                                                                                      '0',
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
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  AutoSizeText(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'w8mbdunx' /* Total Tax */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            '0kdmr12u' /* ₹ */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      AutoSizeText(
                                                                                                        valueOrDefault<String>(
                                                                                                          containerShiftRecord?.tax?.toString(),
                                                                                                          '0',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  AutoSizeText(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'vg8hw0vz' /* Refund Amount */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            '743pwats' /* ₹ */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      AutoSizeText(
                                                                                                        valueOrDefault<String>(
                                                                                                          containerShiftRecord?.refoundAmount?.toString(),
                                                                                                          '0',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  AutoSizeText(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '4dmdsnmv' /* Total Discount */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'qv8td3vk' /* ₹ */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      AutoSizeText(
                                                                                                        valueOrDefault<String>(
                                                                                                          containerShiftRecord?.discount?.toString(),
                                                                                                          '0',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  AutoSizeText(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'afydr36j' /* Opening Blnc */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'cuq5anyt' /* ₹ */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      AutoSizeText(
                                                                                                        valueOrDefault<String>(
                                                                                                          containerShiftRecord?.openingAmt?.toString(),
                                                                                                          '0',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                AutoSizeText(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '0pnyccih' /* Extra/Dlvr Ch. */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                      ),
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                      child: Text(
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'w4jkt761' /* ₹ */,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    AutoSizeText(
                                                                                                      valueOrDefault<String>(
                                                                                                        containerShiftRecord?.deliveryCharges?.toString(),
                                                                                                        '0',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
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
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(20.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                              child: AutoSizeText(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'jxht7n1y' /* Expenses */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  AutoSizeText(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'a95yg1wu' /* Total Expense */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'kk894qmp' /* ₹ */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      AutoSizeText(
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'w7ennhzq' /* 0 */,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  AutoSizeText(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'eekcvubz' /* Received Amt. of Customer Cred... */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            '8606yte0' /* ₹ */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      AutoSizeText(
                                                                                                        valueOrDefault<String>(
                                                                                                          containerShiftRecord?.customerReciveAmtTotal?.toString(),
                                                                                                          '0',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  AutoSizeText(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'zbitcj6p' /* Advance */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            '0v7n36vo' /* ₹ */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      AutoSizeText(
                                                                                                        valueOrDefault<String>(
                                                                                                          containerShiftRecord?.advanceAmtTotal?.toString(),
                                                                                                          '0',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                AutoSizeText(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'ypdhqj2i' /* Extra Rcvd Amt */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                      ),
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                      child: Text(
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '32rkzdgp' /* ₹ */,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    AutoSizeText(
                                                                                                      valueOrDefault<String>(
                                                                                                        containerShiftRecord?.receiveAmtTotal?.toString(),
                                                                                                        '0',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
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
                                                                                ].divide(SizedBox(width: 25.0)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                  if (!FFAppState()
                                                                      .isVisible)
                                                                    SingleChildScrollView(
                                                                      primary:
                                                                          false,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.stretch,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                10.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.95,
                                                                                  height: MediaQuery.sizeOf(context).height * 0.65,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(5.0),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                        child: AutoSizeText(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '6g74up39' /* Please select Shift */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
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
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    if (!FFAppState().isVisible)
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
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
                                                                    40.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    40.0),
                                                          ),
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
                                                                '2h0j9btx' /* No Data Available */,
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
              ),
            ));
      },
    );
  }
}
