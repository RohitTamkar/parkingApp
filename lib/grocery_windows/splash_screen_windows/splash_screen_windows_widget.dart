import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
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
import 'splash_screen_windows_model.dart';
export 'splash_screen_windows_model.dart';

class SplashScreenWindowsWidget extends StatefulWidget {
  const SplashScreenWindowsWidget({super.key});

  @override
  State<SplashScreenWindowsWidget> createState() =>
      _SplashScreenWindowsWidgetState();
}

class _SplashScreenWindowsWidgetState extends State<SplashScreenWindowsWidget>
    with TickerProviderStateMixin {
  late SplashScreenWindowsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenWindowsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.docRes = await actions.getPlatformDetails(
        isWeb.toString(),
      );
      _model.platform = await actions.checkPlatform(
        isWeb.toString(),
      );
      _model.deiviceexistnew = await queryDeviceRecordOnce(
        queryBuilder: (deviceRecord) => deviceRecord.where(
          'deviceId',
          isEqualTo: getJsonField(
            _model.docRes,
            r'''$.deviceId''',
          ).toString().toString(),
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
          deviceId: valueOrDefault<String>(
            getJsonField(
              _model.docRes,
              r'''$.deviceId''',
            )?.toString()?.toString(),
            '0',
          ),
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
          serial: getJsonField(
            _model.docRes,
            r'''$.deviceId''',
          ).toString().toString(),
          branch: '',
          billingType: FFAppState().navigate,
        ));
        _model.refnew = DeviceRecord.getDocumentFromData(
            createDeviceRecordData(
              createdDate: getCurrentTimestamp.millisecondsSinceEpoch,
              deviceId: valueOrDefault<String>(
                getJsonField(
                  _model.docRes,
                  r'''$.deviceId''',
                )?.toString()?.toString(),
                '0',
              ),
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
              serial: getJsonField(
                _model.docRes,
                r'''$.deviceId''',
              ).toString().toString(),
              branch: '',
              billingType: FFAppState().navigate,
            ),
            deviceRecordReference);

        await _model.refnew!.reference.update(createDeviceRecordData(
          id: _model.refnew?.reference.id,
        ));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Device Add Succefully!',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).info,
          ),
        );
      }

      context.pushNamed('WindowsLogin');
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.9, 1.9),
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
        title: 'SplashScreenWindows',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0041B6), Color(0xFF80A6EB)],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(1.0, 0.0),
                  end: AlignmentDirectional(-1.0, 0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Sensible_Connect_Logo_White.png',
                      width: 70.0,
                      height: 70.0,
                      fit: BoxFit.cover,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation']!),
                ],
              ),
            ),
          ),
        ));
  }
}
