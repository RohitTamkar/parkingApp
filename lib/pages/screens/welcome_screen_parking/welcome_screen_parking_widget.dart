import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/opening_bal_new_car/opening_bal_new_car_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'welcome_screen_parking_model.dart';
export 'welcome_screen_parking_model.dart';

class WelcomeScreenParkingWidget extends StatefulWidget {
  const WelcomeScreenParkingWidget({
    super.key,
    this.deviceDoc,
    this.appSettings,
    this.mobile,
  });

  final DeviceRecord? deviceDoc;
  final AppSettingsRecord? appSettings;
  final String? mobile;

  @override
  State<WelcomeScreenParkingWidget> createState() =>
      _WelcomeScreenParkingWidgetState();
}

class _WelcomeScreenParkingWidgetState extends State<WelcomeScreenParkingWidget>
    with TickerProviderStateMixin {
  late WelcomeScreenParkingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late ShakeDetector shakeDetector;
  var shakeActionInProgress = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeScreenParkingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.hideAppbar();
      _model.docRes = await actions.getPlatformDetails(
        isWeb.toString(),
      );
      _model.platform = await actions.checkPlatform(
        isWeb.toString(),
      );
      _model.deiviceexistnew = await queryDeviceRecordOnce(
        queryBuilder: (deviceRecord) => deviceRecord.where(
          'deviceId',
          isEqualTo: valueOrDefault<String>(
            getJsonField(
              _model.docRes,
              r'''$.deviceId''',
            )?.toString()?.toString(),
            'null',
          ),
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.deiviceexistnew?.deviceId ==
          getJsonField(
            _model.docRes,
            r'''$.deviceId''',
          ).toString().toString()) {
      } else {
        var deviceRecordReference = DeviceRecord.collection.doc();
        await deviceRecordReference.set(createDeviceRecordData(
          createdDate: getCurrentTimestamp.millisecondsSinceEpoch,
          deviceId: getJsonField(
            _model.docRes,
            r'''$.deviceId''',
          ).toString().toString(),
          active: false,
          brand: getJsonField(
            _model.docRes,
            r'''$.brand''',
          ).toString().toString(),
          manufacture: getJsonField(
            _model.docRes,
            r'''$.manufacturer''',
          ).toString().toString(),
          model: getJsonField(
            _model.docRes,
            r'''$.model''',
          ).toString().toString(),
          outletName: '',
          outletId: '',
          board: '',
          serial: '',
          branch: '',
        ));
        _model.refnew = DeviceRecord.getDocumentFromData(
            createDeviceRecordData(
              createdDate: getCurrentTimestamp.millisecondsSinceEpoch,
              deviceId: getJsonField(
                _model.docRes,
                r'''$.deviceId''',
              ).toString().toString(),
              active: false,
              brand: getJsonField(
                _model.docRes,
                r'''$.brand''',
              ).toString().toString(),
              manufacture: getJsonField(
                _model.docRes,
                r'''$.manufacturer''',
              ).toString().toString(),
              model: getJsonField(
                _model.docRes,
                r'''$.model''',
              ).toString().toString(),
              outletName: '',
              outletId: '',
              board: '',
              serial: '',
              branch: '',
            ),
            deviceRecordReference);

        await _model.refnew!.reference.update(createDeviceRecordData(
          id: _model.refnew?.reference.id,
        ));
      }

      if (true == true) {
        _model.userProfile = await queryUserProfileRecordOnce(
          queryBuilder: (userProfileRecord) => userProfileRecord.where(
            'mobile',
            isEqualTo: FFAppState().currentMobileString,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        _model.shiftdetailfirebase = await queryShiftRecordOnce(
          parent: FFAppState().outletIdRef,
        );
        _model.devicedetails23 = await queryOutletRecordOnce(
          queryBuilder: (outletRecord) => outletRecord.where(
            'id',
            isEqualTo: FFAppState().outletIdRef?.id,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        FFAppState().userName = _model.userProfile!.name;
        FFAppState().outletName = _model.devicedetails23!.name;
        safeSetState(() {});
        _model.internetconnection = await actions.checkInternetConnection();
        if (true == true) {
          if (true == true) {
            if ((_model.userProfile != null) == true) {
              _model.shiftDetailsNewcar = await actions.shiftDetailNewpark(
                _model.shiftdetailfirebase?.toList(),
              );
              FFAppState().shiftdetails = _model.shiftDetailsNewcar!;
              safeSetState(() {});
              await Future.delayed(const Duration(milliseconds: 2000));
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: OpeningBalNewCarWidget(
                      shiftDetails: _model.shiftDetailsNewcar,
                      doc: _model.userProfile?.reference,
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));

              return;
            } else {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text('Invalid Password'),
                    content: Text('Authentication faild! Invalid Password!'),
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
          } else {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  content: Text('Device is not Active Contact Admin!'),
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
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text('Check Internet connection!'),
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
      }

      context.pushNamed('LoginPageNew');
    });

    // On shake action.
    shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: () async {
        if (shakeActionInProgress) {
          return;
        }
        shakeActionInProgress = true;
        try {} finally {
          shakeActionInProgress = false;
        }
      },
      shakeThresholdGravity: 1.5,
    );

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

    shakeDetector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'welcomeScreenParking',
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
                  FlutterFlowTheme.of(context).primaryBtnText,
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
                  'assets/images/98092-loading.gif',
                  height: 180.0,
                  fit: BoxFit.contain,
                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
              ],
            ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
        ));
  }
}
