import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/parking/opening_bal_new_car/opening_bal_new_car_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'welcome_screen_parking_model.dart';
export 'welcome_screen_parking_model.dart';

class WelcomeScreenParkingWidget extends StatefulWidget {
  const WelcomeScreenParkingWidget({
    super.key,
    this.deviceDoc,
    this.mobile,
    this.shiftDoc,
    this.userDoc,
    this.outletRef,
    this.appSetting,
  });

  final DeviceRecord? deviceDoc;
  final String? mobile;
  final dynamic shiftDoc;
  final DocumentReference? userDoc;
  final DocumentReference? outletRef;
  final AppSettingsRecord? appSetting;

  @override
  State<WelcomeScreenParkingWidget> createState() =>
      _WelcomeScreenParkingWidgetState();
}

class _WelcomeScreenParkingWidgetState extends State<WelcomeScreenParkingWidget>
    with TickerProviderStateMixin {
  late WelcomeScreenParkingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
      _model.invcode = await queryInvoiceRecordOnce(
        parent: FFAppState().outletIdRef,
        queryBuilder: (invoiceRecord) =>
            invoiceRecord.orderBy('invoiceDate', descending: true),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.outletDetail6 = await queryOutletRecordOnce(
        queryBuilder: (outletRecord) => outletRecord.where(
          'id',
          isEqualTo: FFAppState().outletIdRef?.id,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.invcode != null) {
        FFAppState().newcount = _model.invcode!.count;
        safeSetState(() {});
      } else {
        FFAppState().newcount = 0;
        safeSetState(() {});
      }

      if (_model.deiviceexistnew?.deviceId ==
          getJsonField(
            _model.docRes,
            r'''$.deviceId''',
          ).toString().toString()) {
        await _model.deiviceexistnew!.reference.update(createDeviceRecordData(
          outletId: _model.outletDetail6?.id,
          outletName: _model.outletDetail6?.name,
          outletRef: _model.outletDetail6?.reference,
          billingType: _model.outletDetail6?.billingType,
          branch: _model.outletDetail6?.branch,
        ));
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
          serial: FFAppState().dId,
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
              serial: FFAppState().dId,
              branch: '',
            ),
            deviceRecordReference);

        await _model.refnew!.reference.update(createDeviceRecordData(
          id: _model.refnew?.reference.id,
        ));
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Alert'),
              content: Text('Device Add Succefully !'),
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

      _model.deviceexist = await queryDeviceRecordOnce(
        queryBuilder: (deviceRecord) => deviceRecord.where(
          'deviceId',
          isEqualTo: FFAppState().dId,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
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
      _model.outletdetails23 = await queryOutletRecordOnce(
        queryBuilder: (outletRecord) => outletRecord.where(
          'id',
          isEqualTo: FFAppState().outletIdRef?.id,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      FFAppState().userName = _model.userProfile!.name;
      FFAppState().outletName = _model.outletdetails23!.name;
      safeSetState(() {});
      _model.isAppSetExistsNew = await queryAppSettingsRecordOnce(
        parent: FFAppState().outletIdRef,
        queryBuilder: (appSettingsRecord) => appSettingsRecord.where(
          'deviceId',
          isEqualTo: FFAppState().dId,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.masterAppsetting = await queryAppSettingsMasterRecordOnce();
      _model.returnAppsettiing = await actions.returnAppsetting(
        _model.masterAppsetting!.toList(),
        FFAppState().appSettings.toList(),
      );
      if (_model.isAppSetExistsNew != null) {
        FFAppState().appSettings = _model.isAppSetExistsNew!.settingList
            .toList()
            .cast<AppSettingsStruct>();
        safeSetState(() {});
        _model.returnAppsettiingupdate = await actions.returnAppsetting(
          _model.masterAppsetting!.toList(),
          FFAppState().appSettings.toList(),
        );

        await _model.isAppSetExistsNew!.reference.update({
          ...createAppSettingsRecordData(
            deviceId: FFAppState().dId,
          ),
          ...mapToFirestore(
            {
              'settingList': getAppSettingsListFirestoreData(
                _model.returnAppsettiingupdate,
              ),
            },
          ),
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'App Settings Updated !',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      } else {
        var appSettingsRecordReference =
            AppSettingsRecord.createDoc(FFAppState().outletIdRef!);
        await appSettingsRecordReference.set({
          ...createAppSettingsRecordData(
            deviceId: FFAppState().dId,
          ),
          ...mapToFirestore(
            {
              'settingList': getAppSettingsListFirestoreData(
                _model.returnAppsettiing,
              ),
            },
          ),
        });
        _model.doc = AppSettingsRecord.getDocumentFromData({
          ...createAppSettingsRecordData(
            deviceId: FFAppState().dId,
          ),
          ...mapToFirestore(
            {
              'settingList': getAppSettingsListFirestoreData(
                _model.returnAppsettiing,
              ),
            },
          ),
        }, appSettingsRecordReference);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Alert'),
              content: Text('App settings created'),
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

      _model.devicew = await queryAppSettingsRecordOnce(
        parent: FFAppState().outletIdRef,
        queryBuilder: (appSettingsRecord) => appSettingsRecord.where(
          'deviceId',
          isEqualTo: FFAppState().dId,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.deviceexist!.active && _model.outletdetails23!.active) {
        if ((_model.userProfile != null) == true) {
          if (_model.devicew!.settingList
              .where((e) => e.title == 'enableTerminal')
              .toList()
              .firstOrNull!
              .value) {
            _model.shiftDetailsNewcar =
                await actions.shiftDetailNewparkMultishift(
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
                    appSetting: _model.devicew,
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));

            return;
          } else {
            _model.shiftDetailsNewcar2 = await actions.shiftDetailNewpark(
              _model.shiftdetailfirebase?.toList(),
            );
            FFAppState().shiftdetails = _model.shiftDetailsNewcar2!;
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
                    shiftDetails: _model.shiftDetailsNewcar2,
                    doc: _model.userProfile?.reference,
                    appSetting: _model.devicew,
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));

            return;
          }
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

        context.pushNamed('Deviceqr');
      }
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

    return StreamBuilder<List<AppSettingsRecord>>(
      stream: queryAppSettingsRecord(
        parent: FFAppState().outletIdRef,
        queryBuilder: (appSettingsRecord) => appSettingsRecord.where(
          'deviceId',
          isEqualTo: FFAppState().dId,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFF1E2429),
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
        List<AppSettingsRecord> welcomeScreenParkingAppSettingsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final welcomeScreenParkingAppSettingsRecord =
            welcomeScreenParkingAppSettingsRecordList.isNotEmpty
                ? welcomeScreenParkingAppSettingsRecordList.first
                : null;

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
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation']!),
                  ],
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation']!),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ));
      },
    );
  }
}
