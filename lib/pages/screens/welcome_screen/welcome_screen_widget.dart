import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'welcome_screen_model.dart';
export 'welcome_screen_model.dart';

class WelcomeScreenWidget extends StatefulWidget {
  const WelcomeScreenWidget({super.key});

  @override
  State<WelcomeScreenWidget> createState() => _WelcomeScreenWidgetState();
}

class _WelcomeScreenWidgetState extends State<WelcomeScreenWidget>
    with TickerProviderStateMixin {
  late WelcomeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.res = await actions.checkPlatform(
        isWeb.toString(),
      );
      await actions.hideAppbar();
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: 1.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 1.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1100.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 1100.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
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

    return Title(
        title: 'welcomeScreen',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF1E2429),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).customColor3,
                  FlutterFlowTheme.of(context).error
                ],
                stops: [1.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/sensible-logo.png',
                  width: 200.0,
                  height: 180.0,
                  fit: BoxFit.contain,
                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
                Stack(
                  children: [
                    if (isWeb)
                      StreamBuilder<List<DeviceRecord>>(
                        stream: queryDeviceRecord(
                          queryBuilder: (deviceRecord) => deviceRecord.where(
                            'deviceId',
                            isEqualTo: valueOrDefault<String>(
                                      _model.res,
                                      '0',
                                    ) !=
                                    ''
                                ? valueOrDefault<String>(
                                    _model.res,
                                    '0',
                                  )
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
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 40.0,
                                ),
                              ),
                            );
                          }
                          List<DeviceRecord> containerDeviceRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final containerDeviceRecord =
                              containerDeviceRecordList.isNotEmpty
                                  ? containerDeviceRecordList.first
                                  : null;

                          return Container(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  containerDeviceRecord!.outletName,
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily),
                                      ),
                                ),
                                Text(
                                  containerDeviceRecord!.branch,
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily),
                                      ),
                                ),
                                Text(
                                  containerDeviceRecord!.active.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily),
                                      ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    if (!isWeb)
                      FutureBuilder<ApiCallResponse>(
                        future: GetDeviceCall.call(
                          deviceId: _model.res,
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
                          final containerGetDeviceResponse = snapshot.data!;

                          return Container(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  getJsonField(
                                    containerGetDeviceResponse.jsonBody,
                                    r'''$''',
                                  ).toString(),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily),
                                      ),
                                ),
                                Text(
                                  getJsonField(
                                    containerGetDeviceResponse.jsonBody,
                                    r'''$''',
                                  ).toString(),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily),
                                      ),
                                ),
                                Text(
                                  getJsonField(
                                    containerGetDeviceResponse.jsonBody,
                                    r'''$''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily),
                                      ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var _shouldSetState = false;
                      _model.docRes = await actions.getPlatformDetails(
                        isWeb.toString(),
                      );
                      _shouldSetState = true;
                      _model.result1 = await actions.deviceExists(
                        FFAppState().dId,
                        FFAppState().targetPlatform,
                      );
                      _shouldSetState = true;
                      if (_model.result1 == true) {
                        context.pushNamed(
                          'LoginPage',
                          queryParameters: {
                            'deviceDocId': serializeParam(
                              _model.res,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );

                        if (_shouldSetState) safeSetState(() {});
                        return;
                      } else {
                        if (FFAppState().targetPlatform == 'windows') {
                          await actions.createDeviceCopy(
                            getJsonField(
                              _model.docRes,
                              r'''$''',
                            ),
                          );
                        } else {
                          _model.ref = await actions.createDevice(
                            getJsonField(
                              _model.docRes,
                              r'''$''',
                            ),
                          );
                          _shouldSetState = true;

                          await _model.ref!.update(createDeviceRecordData(
                            id: functions.getDeviceIdByRef(_model.ref!),
                          ));
                        }

                        context.pushNamed(
                          'LoginPage',
                          queryParameters: {
                            'deviceDocId': serializeParam(
                              FFAppState().dId,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      }

                      if (_shouldSetState) safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'uoi4jzqu' /* Continue */,
                    ),
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
        ));
  }
}
