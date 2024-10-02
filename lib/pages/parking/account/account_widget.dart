import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'account_model.dart';
export 'account_model.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({
    super.key,
    this.isList,
  });

  final bool? isList;

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget>
    with TickerProviderStateMixin {
  late AccountModel _model;

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
  var hasContainerTriggered10 = false;
  var hasContainerTriggered11 = false;
  var hasContainerTriggered12 = false;
  var hasContainerTriggered13 = false;
  var hasContainerTriggered14 = false;
  var hasContainerTriggered15 = false;
  var hasContainerTriggered16 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.88, 0.88),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 375.0.ms,
            begin: 1.0,
            end: 0.8,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 375.0.ms,
            begin: Offset(1.2, 1.2),
            end: Offset(0.0, 0.0),
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
            duration: 300.0.ms,
            begin: Offset(0.88, 0.88),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 375.0.ms,
            begin: 1.0,
            end: 0.8,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 375.0.ms,
            begin: Offset(1.2, 1.2),
            end: Offset(0.0, 0.0),
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
            duration: 300.0.ms,
            begin: Offset(0.88, 0.88),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 375.0.ms,
            begin: 1.0,
            end: 0.8,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 375.0.ms,
            begin: Offset(1.2, 1.2),
            end: Offset(0.0, 0.0),
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
            duration: 300.0.ms,
            begin: Offset(0.88, 0.88),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 375.0.ms,
            begin: 1.0,
            end: 0.8,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 375.0.ms,
            begin: Offset(1.2, 1.2),
            end: Offset(0.0, 0.0),
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
            duration: 300.0.ms,
            begin: Offset(0.88, 0.88),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 375.0.ms,
            begin: 1.0,
            end: 0.8,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 375.0.ms,
            begin: Offset(1.2, 1.2),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation11': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.88, 0.88),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation12': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 375.0.ms,
            begin: 1.0,
            end: 0.8,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 375.0.ms,
            begin: Offset(1.2, 1.2),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation13': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.88, 0.88),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation14': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 375.0.ms,
            begin: 1.0,
            end: 0.8,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 375.0.ms,
            begin: Offset(1.2, 1.2),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation15': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.88, 0.88),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation16': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 375.0.ms,
            begin: 1.0,
            end: 0.8,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 375.0.ms,
            begin: Offset(1.2, 1.2),
            end: Offset(0.0, 0.0),
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
        title: 'account',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).parkingPrimary,
              body: StreamBuilder<List<UserProfileRecord>>(
                stream: queryUserProfileRecord(
                  queryBuilder: (userProfileRecord) => userProfileRecord.where(
                    'mobile',
                    isEqualTo: valueOrDefault<String>(
                      FFAppState().currentMobileString,
                      '0',
                    ),
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
                  List<UserProfileRecord> containerUserProfileRecordList =
                      snapshot.data!;
                  final containerUserProfileRecord =
                      containerUserProfileRecordList.isNotEmpty
                          ? containerUserProfileRecordList.first
                          : null;

                  return Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 3,
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
                                      0.0, 0.0, 0.0, 15.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.85,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.2,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.1,
                                              decoration: BoxDecoration(),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.chevron_left,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  context.safePop();
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.1,
                                              decoration: BoxDecoration(),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.1,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.15,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Icon(
                                                    Icons.person_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lineColor,
                                                    size: 28.0,
                                                  ),
                                                  Icon(
                                                    Icons.phone,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lineColor,
                                                    size: 20.0,
                                                  ),
                                                  Icon(
                                                    Icons.group_work_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lineColor,
                                                    size: 20.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.6,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.15,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AutoSizeText(
                                                    valueOrDefault<String>(
                                                      containerUserProfileRecord
                                                          ?.name,
                                                      'null',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily),
                                                        ),
                                                  ),
                                                  AutoSizeText(
                                                    valueOrDefault<String>(
                                                      containerUserProfileRecord
                                                          ?.mobile,
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily),
                                                        ),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      containerUserProfileRecord
                                                          ?.role,
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLargeFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.15,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.15,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 8.0,
                                                    buttonSize: 45.0,
                                                    icon: Icon(
                                                      Icons.addchart,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor,
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 8.0,
                                                    buttonSize: 45.0,
                                                    icon: Icon(
                                                      Icons.home,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor,
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () async {
                                                      _model.outletDoc =
                                                          await queryOutletRecordOnce(
                                                        queryBuilder:
                                                            (outletRecord) =>
                                                                outletRecord
                                                                    .where(
                                                          'id',
                                                          isEqualTo:
                                                              FFAppState()
                                                                  .outletIdRef
                                                                  ?.id,
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);

                                                      context.pushNamed(
                                                        'dashboard',
                                                        queryParameters: {
                                                          'outletId':
                                                              serializeParam(
                                                            FFAppState()
                                                                .outletIdRef,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'userId':
                                                              serializeParam(
                                                            containerUserProfileRecord
                                                                ?.id,
                                                            ParamType.String,
                                                          ),
                                                          'mobile':
                                                              serializeParam(
                                                            FFAppState()
                                                                .currentMobile,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30.0,
                                                    buttonSize: 45.0,
                                                    icon: Icon(
                                                      Icons.edit_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor,
                                                      size: 22.0,
                                                    ),
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                        'editUserprofile',
                                                        queryParameters: {
                                                          'docRef':
                                                              serializeParam(
                                                            containerUserProfileRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'docRef':
                                                              containerUserProfileRecord,
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ],
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
                        Expanded(
                          flex: 7,
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
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
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (FFAppState().outletIdRef !=
                                                null) {
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation2'] !=
                                                  null) {
                                                safeSetState(() =>
                                                    hasContainerTriggered2 =
                                                        true);
                                                SchedulerBinding.instance
                                                    .addPostFrameCallback(
                                                        (_) async =>
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation2']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0));
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation1'] !=
                                                  null) {
                                                safeSetState(() =>
                                                    hasContainerTriggered1 =
                                                        true);
                                                SchedulerBinding.instance
                                                    .addPostFrameCallback(
                                                        (_) async =>
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation1']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0));
                                              }
                                              if (containerUserProfileRecord
                                                      ?.role ==
                                                  'admin') {
                                                context.pushNamed(
                                                  'businessProfileAdminfinal',
                                                  queryParameters: {
                                                    'mobileNo': serializeParam(
                                                      FFAppState()
                                                          .currentMobileString,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                context.pushNamed(
                                                  'businessProfileAdminfinal',
                                                  queryParameters: {
                                                    'mobileNo': serializeParam(
                                                      FFAppState()
                                                          .currentMobileString,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }

                                              return;
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Alert'),
                                                    content: Text(
                                                        'Please Add outlet'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('OK'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              if (containerUserProfileRecord
                                                      ?.role ==
                                                  'admin') {
                                                context.pushNamed(
                                                  'businessProfileAdminfinal',
                                                  queryParameters: {
                                                    'mobileNo': serializeParam(
                                                      FFAppState()
                                                          .currentMobileString,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                context.pushNamed(
                                                  'businessProfileAdminfinal',
                                                  queryParameters: {
                                                    'mobileNo': serializeParam(
                                                      valueOrDefault<String>(
                                                        FFAppState()
                                                            .currentMobileString,
                                                        '7066998333',
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }

                                              return;
                                            }
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.06,
                                            decoration: BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x4C989FDE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation2']!,
                                                    hasBeenTriggered:
                                                        hasContainerTriggered2),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.15,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 60.0,
                                                          icon: Icon(
                                                            Icons
                                                                .add_business_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () {
                                                            print(
                                                                'IconButton pressed ...');
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'b4gcbxte' /* Outlet List */,
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
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).animateOnActionTrigger(
                                            animationsMap[
                                                'containerOnActionTriggerAnimation1']!,
                                            hasBeenTriggered:
                                                hasContainerTriggered1),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                      indent: 40.0,
                                      endIndent: 40.0,
                                      color: FlutterFlowTheme.of(context)
                                          .customColor1,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (FFAppState().outletIdRef !=
                                                null) {
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation2'] !=
                                                  null) {
                                                safeSetState(() =>
                                                    hasContainerTriggered2 =
                                                        true);
                                                SchedulerBinding.instance
                                                    .addPostFrameCallback(
                                                        (_) async =>
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation2']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0));
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation1'] !=
                                                  null) {
                                                safeSetState(() =>
                                                    hasContainerTriggered1 =
                                                        true);
                                                SchedulerBinding.instance
                                                    .addPostFrameCallback(
                                                        (_) async =>
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation1']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0));
                                              }
                                              if (containerUserProfileRecord
                                                      ?.role ==
                                                  'admin') {
                                                context.pushNamed('mastersNew');
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'User Permission Is Not Authorised',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                  ),
                                                );
                                                return;
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Alert'),
                                                    content: Text(
                                                        'Please Add outlet'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('OK'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );

                                              context.pushNamed(
                                                'businessProfileAdminfinal',
                                                queryParameters: {
                                                  'mobileNo': serializeParam(
                                                    FFAppState()
                                                        .currentMobileString,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              return;
                                            }
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.06,
                                            decoration: BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x4C989FDE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation4']!,
                                                    hasBeenTriggered:
                                                        hasContainerTriggered4),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.15,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 60.0,
                                                          icon: Icon(
                                                            Icons.content_paste,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () {
                                                            print(
                                                                'IconButton pressed ...');
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '6vwby0ln' /* Masters */,
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
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).animateOnActionTrigger(
                                            animationsMap[
                                                'containerOnActionTriggerAnimation3']!,
                                            hasBeenTriggered:
                                                hasContainerTriggered3),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                      indent: 40.0,
                                      endIndent: 40.0,
                                      color: FlutterFlowTheme.of(context)
                                          .customColor1,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation6'] !=
                                                null) {
                                              safeSetState(() =>
                                                  hasContainerTriggered6 =
                                                      true);
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback((_) async =>
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation6']!
                                                          .controller
                                                          .forward(from: 0.0));
                                            }
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation5'] !=
                                                null) {
                                              safeSetState(() =>
                                                  hasContainerTriggered5 =
                                                      true);
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback((_) async =>
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation5']!
                                                          .controller
                                                          .forward(from: 0.0));
                                            }
                                            if (containerUserProfileRecord
                                                    ?.role ==
                                                'admin') {
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'User Permission Is Not Authorised',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                ),
                                              );
                                              return;
                                            }
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.06,
                                            decoration: BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.15,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 60.0,
                                                          icon: Icon(
                                                            Icons.attach_money,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 25.0,
                                                          ),
                                                          onPressed: () {
                                                            print(
                                                                'IconButton pressed ...');
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'm3n7okd8' /* Subscription */,
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
                                                    ],
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
                                                  onTap: () async {
                                                    context.pushNamed(
                                                        'subscriptionNew2');
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x4C989FDE),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                  ),
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation6']!,
                                                    hasBeenTriggered:
                                                        hasContainerTriggered6),
                                              ],
                                            ),
                                          ),
                                        ).animateOnActionTrigger(
                                            animationsMap[
                                                'containerOnActionTriggerAnimation5']!,
                                            hasBeenTriggered:
                                                hasContainerTriggered5),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                      indent: 40.0,
                                      endIndent: 40.0,
                                      color: FlutterFlowTheme.of(context)
                                          .customColor1,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation7'] !=
                                                null) {
                                              safeSetState(() =>
                                                  hasContainerTriggered7 =
                                                      true);
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback((_) async =>
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation7']!
                                                          .controller
                                                          .forward(from: 0.0));
                                            }

                                            context
                                                .pushNamed('PrintersettingCar');
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.06,
                                            decoration: BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.15,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 60.0,
                                                          icon: Icon(
                                                            Icons.print_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 25.0,
                                                          ),
                                                          onPressed: () {
                                                            print(
                                                                'IconButton pressed ...');
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'wnj2guip' /* Printer Setting */,
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
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x4C989FDE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation8']!,
                                                    hasBeenTriggered:
                                                        hasContainerTriggered8),
                                              ],
                                            ),
                                          ),
                                        ).animateOnActionTrigger(
                                            animationsMap[
                                                'containerOnActionTriggerAnimation7']!,
                                            hasBeenTriggered:
                                                hasContainerTriggered7),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                      indent: 40.0,
                                      endIndent: 40.0,
                                      color: FlutterFlowTheme.of(context)
                                          .customColor1,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation10'] !=
                                                null) {
                                              safeSetState(() =>
                                                  hasContainerTriggered10 =
                                                      true);
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback((_) async =>
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation10']!
                                                          .controller
                                                          .forward(from: 0.0));
                                            }
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
                                                          .forward(from: 0.0));
                                            }
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.06,
                                            decoration: BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x4C989FDE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation10']!,
                                                    hasBeenTriggered:
                                                        hasContainerTriggered10),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.15,
                                                      height: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        icon: Icon(
                                                          Icons.chat,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '4fen2ss6' /* About */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).animateOnActionTrigger(
                                            animationsMap[
                                                'containerOnActionTriggerAnimation9']!,
                                            hasBeenTriggered:
                                                hasContainerTriggered9),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                      indent: 40.0,
                                      endIndent: 40.0,
                                      color: FlutterFlowTheme.of(context)
                                          .customColor1,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation12'] !=
                                                null) {
                                              safeSetState(() =>
                                                  hasContainerTriggered12 =
                                                      true);
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback((_) async =>
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation12']!
                                                          .controller
                                                          .forward(from: 0.0));
                                            }
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation11'] !=
                                                null) {
                                              safeSetState(() =>
                                                  hasContainerTriggered11 =
                                                      true);
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback((_) async =>
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation11']!
                                                          .controller
                                                          .forward(from: 0.0));
                                            }

                                            context.pushNamed('Deviceqr');
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.06,
                                            decoration: BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x4C989FDE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation12']!,
                                                    hasBeenTriggered:
                                                        hasContainerTriggered12),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.15,
                                                      height: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        icon: Icon(
                                                          Icons.devices_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '7inj276m' /* Device */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).animateOnActionTrigger(
                                            animationsMap[
                                                'containerOnActionTriggerAnimation11']!,
                                            hasBeenTriggered:
                                                hasContainerTriggered11),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                      indent: 40.0,
                                      endIndent: 40.0,
                                      color: FlutterFlowTheme.of(context)
                                          .customColor1,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation14'] !=
                                                null) {
                                              safeSetState(() =>
                                                  hasContainerTriggered14 =
                                                      true);
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback((_) async =>
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation14']!
                                                          .controller
                                                          .forward(from: 0.0));
                                            }
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation13'] !=
                                                null) {
                                              safeSetState(() =>
                                                  hasContainerTriggered13 =
                                                      true);
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback((_) async =>
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation13']!
                                                          .controller
                                                          .forward(from: 0.0));
                                            }
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.06,
                                            decoration: BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x4C989FDE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation14']!,
                                                    hasBeenTriggered:
                                                        hasContainerTriggered14),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.15,
                                                      height: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        icon: Icon(
                                                          Icons.business,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '818avsdq' /* Sensible Connect Solutions */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).animateOnActionTrigger(
                                            animationsMap[
                                                'containerOnActionTriggerAnimation13']!,
                                            hasBeenTriggered:
                                                hasContainerTriggered13),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                      indent: 40.0,
                                      endIndent: 40.0,
                                      color: FlutterFlowTheme.of(context)
                                          .customColor1,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation16'] !=
                                                null) {
                                              safeSetState(() =>
                                                  hasContainerTriggered16 =
                                                      true);
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback((_) async =>
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation16']!
                                                          .controller
                                                          .forward(from: 0.0));
                                            }
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation15'] !=
                                                null) {
                                              safeSetState(() =>
                                                  hasContainerTriggered15 =
                                                      true);
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback((_) async =>
                                                      await animationsMap[
                                                              'containerOnActionTriggerAnimation15']!
                                                          .controller
                                                          .forward(from: 0.0));
                                            }
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            await authManager.signOut();
                                            GoRouter.of(context)
                                                .clearRedirectLocation();

                                            context.goNamedAuth(
                                                'StartScreen', context.mounted);
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.06,
                                            decoration: BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x4C989FDE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation16']!,
                                                    hasBeenTriggered:
                                                        hasContainerTriggered16),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.15,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 60.0,
                                                          icon: Icon(
                                                            Icons.logout,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () {
                                                            print(
                                                                'IconButton pressed ...');
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            't5jubjjz' /* Logout */,
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
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).animateOnActionTrigger(
                                            animationsMap[
                                                'containerOnActionTriggerAnimation15']!,
                                            hasBeenTriggered:
                                                hasContainerTriggered15),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                      indent: 40.0,
                                      endIndent: 40.0,
                                      color: FlutterFlowTheme.of(context)
                                          .customColor2,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.06,
                                          decoration: BoxDecoration(
                                            color: Color(0x00FFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.15,
                                                height: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.settings_sharp,
                                                  size: 0.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'vlpbhdgi' /* Settings */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmallFamily,
                                                        color:
                                                            Color(0x00F4F3F8),
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
                  );
                },
              ),
            ),
          ),
        ));
  }
}
