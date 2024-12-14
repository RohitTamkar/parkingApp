import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splash_parking_model.dart';
export 'splash_parking_model.dart';

class SplashParkingWidget extends StatefulWidget {
  const SplashParkingWidget({super.key});

  @override
  State<SplashParkingWidget> createState() => _SplashParkingWidgetState();
}

class _SplashParkingWidgetState extends State<SplashParkingWidget>
    with TickerProviderStateMixin {
  late SplashParkingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashParkingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 3000));

      context.pushNamed('ParkingLogin');
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: Offset(-500.0, 0.0),
            end: Offset(0.0, 0.0),
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
    return Title(
        title: 'SplashParking',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).secondaryBackground,
                    FlutterFlowTheme.of(context).secondaryBackground,
                    Color(0xFFEBEDF4),
                    Color(0xFF80879D)
                  ],
                  stops: [0.0, 0.5, 0.7, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(50.0, 200.0, 50.0, 250.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Car_2.png',
                            width: 130.0,
                            height: 50.0,
                            fit: BoxFit.contain,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation']!),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/rb_1282.png',
                            width: 35.0,
                            height: 30.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'cbwfle8n' /* PARK */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displayLarge
                              .override(
                                fontFamily: 'Oswald',
                                color: FlutterFlowTheme.of(context).info,
                                fontSize: 42.0,
                                letterSpacing: 10.0,
                                fontWeight: FontWeight.w900,
                                shadows: [
                                  Shadow(
                                    color: Color(0x78B1AEB9),
                                    offset: Offset(4.0, 8.0),
                                    blurRadius: 1.5,
                                  )
                                ],
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Oswald'),
                              ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'omgs6vwc' /* SENSE */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displayLarge
                              .override(
                                fontFamily: 'Oswald',
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 42.0,
                                letterSpacing: 5.0,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                                shadows: [
                                  Shadow(
                                    color: Color(0x78B1AEB9),
                                    offset: Offset(4.0, 8.0),
                                    blurRadius: 1.5,
                                  )
                                ],
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Oswald'),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
