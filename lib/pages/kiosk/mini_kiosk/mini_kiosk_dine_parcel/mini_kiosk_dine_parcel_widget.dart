import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mini_kiosk_dine_parcel_model.dart';
export 'mini_kiosk_dine_parcel_model.dart';

class MiniKioskDineParcelWidget extends StatefulWidget {
  const MiniKioskDineParcelWidget({
    super.key,
    this.userdoc,
    this.shiftdoc,
    this.appSetting,
    this.taxcollection,
  });

  final DocumentReference? userdoc;
  final dynamic shiftdoc;
  final AppSettingsRecord? appSetting;
  final List<TaxMasterRecord>? taxcollection;

  @override
  State<MiniKioskDineParcelWidget> createState() =>
      _MiniKioskDineParcelWidgetState();
}

class _MiniKioskDineParcelWidgetState extends State<MiniKioskDineParcelWidget>
    with TickerProviderStateMixin {
  late MiniKioskDineParcelModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiniKioskDineParcelModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.footer = await queryFooterRecordOnce(
        parent: FFAppState().outletIdRef,
        singleRecord: true,
      ).then((s) => s.firstOrNull);
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.35, 1.35),
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: Color(0xFFFFDD42),
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.35, 1.35),
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: Color(0xFFFFDD42),
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
        title: 'MiniKioskDineParcel',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Color(0xFFF4ECE5),
              body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    alignment: AlignmentDirectional(1.0, 0.0),
                    image: Image.asset(
                      'assets/images/Top_img_5.png',
                    ).image,
                  ),
                ),
                child: Transform.rotate(
                  angle: 90.0 * (math.pi / 180),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '8lm0f3n3' /* Choose Order Type  */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displayLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .displayLargeFamily,
                                color: FlutterFlowTheme.of(context).info,
                                fontSize: 40.0,
                                letterSpacing: 5.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .displayLargeFamily),
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {},
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.6,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 12.0,
                                  color: Color(0x26000000),
                                  offset: Offset(
                                    9.0,
                                    9.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(60.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      Icons.dinner_dining,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 50.0,
                                    ).animateOnPageLoad(animationsMap[
                                        'iconOnPageLoadAnimation1']!),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '18q747zy' /* Dine In */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .displayLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .displayLargeFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 36.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (!valueOrDefault<bool>(
                        widget!.appSetting?.settingList
                            ?.where((e) => e.title == 'hideParcelButton')
                            .toList()
                            ?.first
                            ?.value,
                        false,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 50.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.6,
                              height: MediaQuery.sizeOf(context).height * 0.1,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 12.0,
                                    color: Color(0x27000000),
                                    offset: Offset(
                                      9.0,
                                      9.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(60.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Icon(
                                        Icons.takeout_dining_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        size: 45.0,
                                      ).animateOnPageLoad(animationsMap[
                                          'iconOnPageLoadAnimation2']!),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'cb099ksu' /* Parcel */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .displayLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displayLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontSize: 36.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayLargeFamily),
                                            ),
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
                ),
              ),
            ),
          ),
        ));
  }
}
