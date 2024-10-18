import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kiosk_advertising_model.dart';
export 'kiosk_advertising_model.dart';

class KioskAdvertisingWidget extends StatefulWidget {
  const KioskAdvertisingWidget({
    super.key,
    this.userDoc,
    this.shiftdoc,
    this.appsetting,
    this.taxcollection,
  });

  final DocumentReference? userDoc;
  final dynamic shiftdoc;
  final AppSettingsRecord? appsetting;
  final List<TaxMasterRecord>? taxcollection;

  @override
  State<KioskAdvertisingWidget> createState() => _KioskAdvertisingWidgetState();
}

class _KioskAdvertisingWidgetState extends State<KioskAdvertisingWidget> {
  late KioskAdvertisingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KioskAdvertisingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!functions.isPrinterSelected(FFAppState().printerDevice)!) {
        _model.resDevice2Copy = await actions.scanPrinter(
          FFAppState().posMode,
        );
      }
      _model.connectdeviceCOPY23 = await actions.connectDevice(
        FFAppState().printerDevice,
        FFAppState().printerIndex,
      );
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

    return StreamBuilder<List<AdvertisementRecord>>(
      stream: queryAdvertisementRecord(
        parent: FFAppState().outletIdRef,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<AdvertisementRecord> kioskAdvertisingAdvertisementRecordList =
            snapshot.data!;

        return Title(
            title: 'KioskAdvertising',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  body: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: wrapWithModel(
                            model: _model.kioskHeaderModel,
                            updateCallback: () => safeSetState(() {}),
                            child: KioskHeaderWidget(),
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onLongPress: () async {
                                      context.pushNamed('KotOrderScreen');
                                    },
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          'KioskDineParcel',
                                          queryParameters: {
                                            'userdoc': serializeParam(
                                              widget!.userDoc,
                                              ParamType.DocumentReference,
                                            ),
                                            'shiftdoc': serializeParam(
                                              widget!.shiftdoc,
                                              ParamType.JSON,
                                            ),
                                            'appSetting': serializeParam(
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
                                            'appSetting': widget!.appsetting,
                                            'taxcollection':
                                                widget!.taxcollection,
                                          },
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '90zc4l3n' /* Go For Menu */,
                                      ),
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.1,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              fontSize: 30.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 10.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          width: 5.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
