import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'business_profile_adminfinal_model.dart';
export 'business_profile_adminfinal_model.dart';

class BusinessProfileAdminfinalWidget extends StatefulWidget {
  const BusinessProfileAdminfinalWidget({
    super.key,
    this.mobileNo,
  });

  final String? mobileNo;

  @override
  State<BusinessProfileAdminfinalWidget> createState() =>
      _BusinessProfileAdminfinalWidgetState();
}

class _BusinessProfileAdminfinalWidgetState
    extends State<BusinessProfileAdminfinalWidget>
    with TickerProviderStateMixin {
  late BusinessProfileAdminfinalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  var hasIconButtonTriggered1 = false;
  var hasContainerTriggered3 = false;
  var hasContainerTriggered4 = false;
  var hasIconButtonTriggered2 = false;
  var hasContainerTriggered5 = false;
  var hasContainerTriggered6 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BusinessProfileAdminfinalModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userDetails = await queryUserProfileRecordOnce(
        queryBuilder: (userProfileRecord) => userProfileRecord.where(
          'mobile',
          isEqualTo: FFAppState().currentMobileString,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.output = await queryOutletRecordOnce(
        queryBuilder: (outletRecord) => outletRecord
            .where(
              'createdBy',
              isEqualTo: _model.userDetails?.reference,
            )
            .where(
              'businessMaster',
              isEqualTo: FFAppState().bmDocRef,
            ),
      );
      if (_model.output!.length <= 0) {
        FFAppState().addflag = true;
        safeSetState(() {});
      } else {
        FFAppState().addflag = false;
        safeSetState(() {});
      }
    });

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
      'iconButtonOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.3, 0.3),
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
      'iconButtonOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.3, 0.3),
            end: Offset(1.0, 1.0),
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
        title: 'businessProfileAdminfinal',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).parkingPrimary,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
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
                              20.0, 0.0, 20.0, 0.0),
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
                                  context.pushNamed(
                                    'account',
                                    queryParameters: {
                                      'isList': serializeParam(
                                        false,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                              ),
                              AutoSizeText(
                                FFLocalizations.of(context).getText(
                                  'asct6qny' /* Business Profile */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineSmallFamily,
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
                                  Icons.chevron_left,
                                  color: Colors.transparent,
                                  size: 30.0,
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
                  child: StreamBuilder<List<UserProfileRecord>>(
                    stream: queryUserProfileRecord(
                      queryBuilder: (userProfileRecord) =>
                          userProfileRecord.where(
                        'mobile',
                        isEqualTo: FFAppState().currentMobileString,
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
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.8,
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
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.1,
                          height: MediaQuery.sizeOf(context).height * 0.8,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.065,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 3.0, 0.0),
                                                  child: Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Icon(
                                                      Icons.person_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 30.0,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.65,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.07,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Wrap(
                                                          spacing: 0.0,
                                                          runSpacing: 0.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .center,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          children: [
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
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerUserProfileRecord
                                                                          ?.name,
                                                                      'Sencible Connect Solution',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
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
                                                                  ),
                                                                ),
                                                                AutoSizeText(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    containerUserProfileRecord
                                                                        ?.role,
                                                                    'admin',
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
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.08,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.07,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.03,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onLongPress: () async {},
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '9pexymsm' /* Business */,
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
                                              ),
                                              if (false)
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
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation2'] !=
                                                        null) {
                                                      safeSetState(() =>
                                                          hasContainerTriggered2 =
                                                              true);
                                                      SchedulerBinding.instance
                                                          .addPostFrameCallback((_) async =>
                                                              await animationsMap[
                                                                      'containerOnActionTriggerAnimation2']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0));
                                                    }
                                                    if (animationsMap[
                                                            'containerOnActionTriggerAnimation1'] !=
                                                        null) {
                                                      safeSetState(() =>
                                                          hasContainerTriggered1 =
                                                              true);
                                                      SchedulerBinding.instance
                                                          .addPostFrameCallback((_) async =>
                                                              await animationsMap[
                                                                      'containerOnActionTriggerAnimation1']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0));
                                                    }
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Alert'),
                                                          content: Text(
                                                              'business Already added'),
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
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.3,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        if (false)
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x4C989FDE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
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
                                                                  '4ysaux2q' /* Add Business */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelLargeFamily),
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
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.16,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: StreamBuilder<
                                              List<BusinesssMasterRecord>>(
                                            stream: queryBusinesssMasterRecord(
                                              queryBuilder:
                                                  (businesssMasterRecord) =>
                                                      businesssMasterRecord
                                                          .where(
                                                'createdBy',
                                                isEqualTo:
                                                    containerUserProfileRecord
                                                        ?.reference,
                                              ),
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<BusinesssMasterRecord>
                                                  listViewBusinesssMasterRecordList =
                                                  snapshot.data!;

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    listViewBusinesssMasterRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewBusinesssMasterRecord =
                                                      listViewBusinesssMasterRecordList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {},
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 0.55,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.7,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.09,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            border: Border.all(
                                                              color: listViewBusinesssMasterRecord
                                                                          .id ==
                                                                      listViewBusinesssMasterRecord
                                                                          .id
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor2,
                                                              width: 6.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        8.0,
                                                                        8.0,
                                                                        5.0),
                                                            child: Column(
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
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.04,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      ListView(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    children: [
                                                                      Text(
                                                                        listViewBusinesssMasterRecord
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
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
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .mode_edit,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    size: 21.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    if (animationsMap[
                                                                            'iconButtonOnActionTriggerAnimation1'] !=
                                                                        null) {
                                                                      safeSetState(() =>
                                                                          hasIconButtonTriggered1 =
                                                                              true);
                                                                      SchedulerBinding
                                                                          .instance
                                                                          .addPostFrameCallback((_) async => await animationsMap['iconButtonOnActionTriggerAnimation1']!
                                                                              .controller
                                                                              .forward(from: 0.0));
                                                                    }

                                                                    context
                                                                        .pushNamed(
                                                                      'editBusinesProfile',
                                                                      queryParameters:
                                                                          {
                                                                        'businessMRef':
                                                                            serializeParam(
                                                                          listViewBusinesssMasterRecord
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                        'id':
                                                                            serializeParam(
                                                                          listViewBusinesssMasterRecord
                                                                              .id,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                ).animateOnActionTrigger(
                                                                    animationsMap[
                                                                        'iconButtonOnActionTriggerAnimation1']!,
                                                                    hasBeenTriggered:
                                                                        hasIconButtonTriggered1),
                                                              ],
                                                            ),
                                                          ),
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.03,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '0zpzpdyo' /* Outlets List */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                      ),
                                      Expanded(
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.38,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: StreamBuilder<
                                                List<OutletRecord>>(
                                              stream: queryOutletRecord(
                                                queryBuilder: (outletRecord) =>
                                                    outletRecord
                                                        .where(
                                                          'createdBy',
                                                          isEqualTo:
                                                              containerUserProfileRecord
                                                                  ?.reference,
                                                        )
                                                        .where(
                                                          'businessMaster',
                                                          isEqualTo:
                                                              FFAppState()
                                                                  .bmDocRef,
                                                        ),
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
                                                List<OutletRecord>
                                                    listViewOutletRecordList =
                                                    snapshot.data!;
                                                if (listViewOutletRecordList
                                                    .isEmpty) {
                                                  return Image.asset(
                                                    'assets/images/noData.jpg',
                                                  );
                                                }

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewOutletRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewOutletRecord =
                                                        listViewOutletRecordList[
                                                            listViewIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: ClipRRect(
                                                        child: Container(
                                                          width: 100.0,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.17,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x4C989FDE),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                ),
                                                              ).animateOnActionTrigger(
                                                                  animationsMap[
                                                                      'containerOnActionTriggerAnimation4']!,
                                                                  hasBeenTriggered:
                                                                      hasContainerTriggered4),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            17.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (animationsMap[
                                                                            'containerOnActionTriggerAnimation4'] !=
                                                                        null) {
                                                                      safeSetState(() =>
                                                                          hasContainerTriggered4 =
                                                                              true);
                                                                      SchedulerBinding
                                                                          .instance
                                                                          .addPostFrameCallback((_) async => await animationsMap['containerOnActionTriggerAnimation4']!
                                                                              .controller
                                                                              .forward(from: 0.0));
                                                                    }
                                                                    if (animationsMap[
                                                                            'containerOnActionTriggerAnimation3'] !=
                                                                        null) {
                                                                      safeSetState(() =>
                                                                          hasContainerTriggered3 =
                                                                              true);
                                                                      SchedulerBinding
                                                                          .instance
                                                                          .addPostFrameCallback((_) async => await animationsMap['containerOnActionTriggerAnimation3']!
                                                                              .controller
                                                                              .forward(from: 0.0));
                                                                    }
                                                                    FFAppState()
                                                                            .outletIdRef =
                                                                        listViewOutletRecord
                                                                            .reference;
                                                                    FFAppState()
                                                                            .outletId =
                                                                        listViewOutletRecord
                                                                            .id;
                                                                    FFAppState()
                                                                            .shiftDate =
                                                                        functions
                                                                            .getDayId();
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});

                                                                    await containerUserProfileRecord!
                                                                        .reference
                                                                        .update(
                                                                            createUserProfileRecordData(
                                                                      outletId: listViewOutletRecord
                                                                          .reference
                                                                          .id,
                                                                    ));
                                                                    _model.devicenew =
                                                                        await actions
                                                                            .getPlatformDetails(
                                                                      isWeb
                                                                          .toString(),
                                                                    );
                                                                    _model.devicedetails2 =
                                                                        await queryDeviceRecordOnce(
                                                                      queryBuilder:
                                                                          (deviceRecord) =>
                                                                              deviceRecord.where(
                                                                        'deviceId',
                                                                        isEqualTo:
                                                                            getJsonField(
                                                                          _model
                                                                              .devicenew,
                                                                          r'''$.deviceId''',
                                                                        ).toString(),
                                                                      ),
                                                                      singleRecord:
                                                                          true,
                                                                    ).then((s) =>
                                                                            s.firstOrNull);
                                                                    if (listViewOutletRecord
                                                                            .active ==
                                                                        true) {
                                                                      context
                                                                          .pushNamed(
                                                                        'welcomeScreenParking',
                                                                        queryParameters:
                                                                            {
                                                                          'deviceDoc':
                                                                              serializeParam(
                                                                            _model.devicedetails2,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'deviceDoc':
                                                                              _model.devicedetails2,
                                                                        },
                                                                      );
                                                                    } else {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            content:
                                                                                Text('Outlet is Not Active ! Contact Admin'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.95,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.15,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              9,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.12,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                children: [
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                    height: MediaQuery.sizeOf(context).height * 0.15,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          AutoSizeText(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '9lo3xuzn' /* Branch : */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                ),
                                                                                          ),
                                                                                          AutoSizeText(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'n996u3la' /* Due Date : */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                ),
                                                                                          ),
                                                                                          AutoSizeText(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'porw26c1' /* Validity : */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.37,
                                                                                    height: MediaQuery.sizeOf(context).height * 0.15,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          AutoSizeText(
                                                                                            listViewOutletRecord.branch,
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                          AutoSizeText(
                                                                                            functions.milisecToTimestamp(listViewOutletRecord.renewalDate),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              AutoSizeText(
                                                                                                functions.subscriptionDays(getCurrentTimestamp, listViewOutletRecord.renewalDate),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                    ),
                                                                                              ),
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '6r4bflgy' /*   Days */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                    ),
                                                                                              )),
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
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.15,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                            ),
                                                                            child:
                                                                                Icon(
                                                                              Icons.navigate_next_sharp,
                                                                              color: Color(0xFF4C5135),
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      5.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.85,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.045,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor1,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          7.0,
                                                                          0.0,
                                                                          7.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.92, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.04,
                                                                                    height: MediaQuery.sizeOf(context).width * 0.04,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFF44B82B),
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                    child: AutoSizeText(
                                                                                      listViewOutletRecord.name,
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                30.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                35.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.mode_edit,
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              size: 18.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              if (animationsMap['iconButtonOnActionTriggerAnimation2'] != null) {
                                                                                safeSetState(() => hasIconButtonTriggered2 = true);
                                                                                SchedulerBinding.instance.addPostFrameCallback((_) async => await animationsMap['iconButtonOnActionTriggerAnimation2']!.controller.forward(from: 0.0));
                                                                              }
                                                                            },
                                                                          ).animateOnActionTrigger(
                                                                              animationsMap['iconButtonOnActionTriggerAnimation2']!,
                                                                              hasBeenTriggered: hasIconButtonTriggered2),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
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
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (FFAppState().addflag)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.docRes = await actions
                                                .getPlatformDetails(
                                              isWeb.toString(),
                                            );
                                            FFAppState().deviceqrId =
                                                getJsonField(
                                              _model.docRes,
                                              r'''$.deviceId''',
                                            ).toString();
                                            FFAppState().update(() {});
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('QR'),
                                                  content: Text(
                                                      FFAppState().deviceqrId),
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
                                              'addOutletPage',
                                              queryParameters: {
                                                'mobile': serializeParam(
                                                  FFAppState()
                                                      .currentMobileString,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );

                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.045,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .parkingSecondaryBackground,
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
                                                        'containerOnActionTriggerAnimation6']!,
                                                    hasBeenTriggered:
                                                        hasContainerTriggered6),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
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
                                                            'hax5egpn' /* Add Outlet */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
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
