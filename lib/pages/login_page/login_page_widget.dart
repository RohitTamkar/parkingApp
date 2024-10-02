import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/power_off/power_off_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({
    super.key,
    this.deviceDocId,
  });

  final String? deviceDocId;

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.platform = await actions.checkPlatform(
        isWeb.toString(),
      );
      _model.docRes = await actions.getPlatformDetails(
        isWeb.toString(),
      );
      if (getJsonField(
            _model.docRes,
            r'''$.platform''',
          ) !=
          'WINDOWS') {
        return;
      }
      _model.result1 = await actions.deviceExists(
        FFAppState().dId,
        FFAppState().targetPlatform,
      );
      if (_model.result1 == true) {
        return;
      }

      _model.ref = await actions.createDevice(
        getJsonField(
          _model.docRes,
          r'''$''',
        ),
      );

      await _model.ref!.update(createDeviceRecordData(
        id: functions.getDeviceIdByRef(_model.ref!),
      ));
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.textController1?.text = dateTimeFormat(
            "MMMEd",
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          );
          _model.textController3?.text = dateTimeFormat(
            "MMMEd",
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          );
        }));
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
        title: 'LoginPage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    width: 100.0,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondary,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.15,
                          height: MediaQuery.sizeOf(context).height * 0.25,
                          decoration: BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('DigitalOrder');
                            },
                            child: Image.asset(
                              'assets/images/Sensible_Connect_Logo_2.png',
                              width: 100.0,
                              height: 100.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Stack(
                    children: [
                      if (getJsonField(
                            _model.docRes,
                            r'''$.platform''',
                          ) !=
                          'WINDOWS')
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: StreamBuilder<List<DeviceRecord>>(
                            stream: queryDeviceRecord(
                              queryBuilder: (deviceRecord) =>
                                  deviceRecord.where(
                                'deviceId',
                                isEqualTo: valueOrDefault<String>(
                                          FFAppState().dId,
                                          '0',
                                        ) !=
                                        ''
                                    ? valueOrDefault<String>(
                                        FFAppState().dId,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                        decoration: BoxDecoration(),
                                        child: TextFormField(
                                          controller: _model.textController1,
                                          focusNode: _model.textFieldFocusNode1,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily),
                                              ),
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.datetime,
                                          validator: _model
                                              .textController1Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.16,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  containerDeviceRecord
                                                      ?.outletName,
                                                  'Sensible Connect',
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displaySmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 27.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmallFamily),
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                containerDeviceRecord?.branch,
                                                'Pune',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 1.0, 0.0, 20.0),
                                        child: Container(
                                          width: 300.0,
                                          height: 320.0,
                                          decoration: BoxDecoration(),
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: StreamBuilder<
                                                    List<UserProfileRecord>>(
                                                  stream:
                                                      queryUserProfileRecord(
                                                    queryBuilder:
                                                        (userProfileRecord) =>
                                                            userProfileRecord
                                                                .where(
                                                      'outlets',
                                                      arrayContains: containerDeviceRecord
                                                                      ?.outletId ==
                                                                  null ||
                                                              containerDeviceRecord
                                                                      ?.outletId ==
                                                                  ''
                                                          ? '0'
                                                          : containerDeviceRecord
                                                                      ?.outletId !=
                                                                  ''
                                                              ? containerDeviceRecord
                                                                              ?.outletId ==
                                                                          null ||
                                                                      containerDeviceRecord
                                                                              ?.outletId ==
                                                                          ''
                                                                  ? '0'
                                                                  : containerDeviceRecord
                                                                      ?.outletId
                                                              : null,
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 40.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UserProfileRecord>
                                                        pinUserProfileRecordList =
                                                        snapshot.data!;

                                                    return Container(
                                                      width: 275.0,
                                                      height: 290.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      width:
                                                                          0.5,
                                                                    ),
                                                                  ),
                                                                  child: Stack(
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(1.0),
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          controller: _model.dropDownValueController1 ??=
                                                                              FormFieldController<String>(null),
                                                                          options: pinUserProfileRecordList
                                                                              .map((e) => e.name)
                                                                              .toList(),
                                                                          onChanged: (val) =>
                                                                              safeSetState(() => _model.dropDownValue1 = val),
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              double.infinity,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                              ),
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'n8al8mry' /* Please select... */,
                                                                          ),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_down,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          elevation:
                                                                              2.0,
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderWidth:
                                                                              0.0,
                                                                          borderRadius:
                                                                              0.0,
                                                                          margin: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              4.0,
                                                                              12.0,
                                                                              4.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                          isSearchable:
                                                                              false,
                                                                          isMultiSelect:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      width:
                                                                          0.5,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textController2,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldFocusNode2,
                                                                    autofocus:
                                                                        false,
                                                                    readOnly:
                                                                        true,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      labelText:
                                                                          FFAppState()
                                                                              .quickPin,
                                                                      hintStyle: FlutterFlowTheme.of(
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
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    validator: _model
                                                                        .textController2Validator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 3.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    _model.one = await actions.setQuickPin(
                                                                                      '1',
                                                                                    );
                                                                                    FFAppState().quickPin = _model.one!;
                                                                                    FFAppState().update(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    '0fkwkv4o' /* 1 */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 33.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).customColor2,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 2.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 3.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    _model.four = await actions.setQuickPin(
                                                                                      '4',
                                                                                    );
                                                                                    FFAppState().quickPin = _model.four!;
                                                                                    FFAppState().update(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'z6izz7xg' /* 4 */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 33.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).customColor2,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 2.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 3.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    _model.seven = await actions.setQuickPin(
                                                                                      '7',
                                                                                    );
                                                                                    FFAppState().quickPin = _model.seven!;
                                                                                    FFAppState().update(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'ikna70vc' /* 7 */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 33.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).customColor2,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 2.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    FFAppState().quickPin = '';
                                                                                    FFAppState().update(() {});
                                                                                  },
                                                                                  text: '',
                                                                                  icon: Icon(
                                                                                    Icons.backspace_sharp,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 16.0,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 33.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).customColor2,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 2.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    _model.two = await actions.setQuickPin(
                                                                                      '2',
                                                                                    );
                                                                                    FFAppState().quickPin = _model.two!;
                                                                                    FFAppState().update(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    '0ckwryub' /* 2 */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 33.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).customColor2,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 2.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    _model.five = await actions.setQuickPin(
                                                                                      '5',
                                                                                    );
                                                                                    FFAppState().quickPin = _model.five!;
                                                                                    FFAppState().update(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    '6o2cg7wh' /* 5 */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 33.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).customColor2,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 2.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    _model.eight = await actions.setQuickPin(
                                                                                      '8',
                                                                                    );
                                                                                    FFAppState().quickPin = _model.eight!;
                                                                                    FFAppState().update(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'hh4t2f41' /* 8 */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 33.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).customColor2,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 2.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  _model.zero = await actions.setQuickPin(
                                                                                    '0',
                                                                                  );
                                                                                  FFAppState().quickPin = _model.zero!;
                                                                                  FFAppState().update(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  '7ua6svfu' /* 0 */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  width: double.infinity,
                                                                                  height: 33.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).customColor2,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                      ),
                                                                                  elevation: 2.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 3.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  _model.three = await actions.setQuickPin(
                                                                                    '3',
                                                                                  );
                                                                                  FFAppState().quickPin = _model.three!;
                                                                                  FFAppState().update(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'ngk670s9' /* 3 */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  width: double.infinity,
                                                                                  height: 33.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).customColor2,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                      ),
                                                                                  elevation: 2.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 3.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  _model.six = await actions.setQuickPin(
                                                                                    '6',
                                                                                  );
                                                                                  FFAppState().quickPin = _model.six!;
                                                                                  FFAppState().update(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'gwslkot4' /* 6 */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  width: double.infinity,
                                                                                  height: 33.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).customColor2,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                      ),
                                                                                  elevation: 2.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 3.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  _model.nine = await actions.setQuickPin(
                                                                                    '9',
                                                                                  );
                                                                                  FFAppState().quickPin = _model.nine!;
                                                                                  FFAppState().update(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'aoo78htq' /* 9 */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  width: double.infinity,
                                                                                  height: 33.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).customColor2,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                      ),
                                                                                  elevation: 2.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                              child: StreamBuilder<List<AppSettingsRecord>>(
                                                                                stream: queryAppSettingsRecord(
                                                                                  parent: FFAppState().outletIdRef,
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
                                                                                  List<AppSettingsRecord> buttonAppSettingsRecordList = snapshot.data!;
                                                                                  final buttonAppSettingsRecord = buttonAppSettingsRecordList.isNotEmpty ? buttonAppSettingsRecordList.first : null;

                                                                                  return FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      var _shouldSetState = false;
                                                                                      if (functions.validateQuickPin(pinUserProfileRecordList.toList(), FFAppState().quickPin, _model.dropDownValue1!)) {
                                                                                        _model.docUser = await actions.validateUserProfile(
                                                                                          pinUserProfileRecordList.toList(),
                                                                                          FFAppState().quickPin,
                                                                                          _model.dropDownValue1!,
                                                                                        );
                                                                                        _shouldSetState = true;
                                                                                        _model.shiftJson = await actions.shiftExists(
                                                                                          functions.getDayId(),
                                                                                          '0',
                                                                                          containerDeviceRecord!.outletId,
                                                                                        );
                                                                                        _shouldSetState = true;

                                                                                        context.pushNamed(
                                                                                          'LoadingScreen',
                                                                                          queryParameters: {
                                                                                            'shiftDoc': serializeParam(
                                                                                              _model.shiftJson,
                                                                                              ParamType.JSON,
                                                                                            ),
                                                                                            'userDoc': serializeParam(
                                                                                              _model.docUser,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                            'appSettingDoc': serializeParam(
                                                                                              buttonAppSettingsRecord,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'appSettingDoc': buttonAppSettingsRecord,
                                                                                          },
                                                                                        );

                                                                                        await Future.delayed(const Duration(milliseconds: 5000));
                                                                                        if (_shouldSetState) safeSetState(() {});
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

                                                                                      if (_shouldSetState) safeSetState(() {});
                                                                                    },
                                                                                    text: '',
                                                                                    icon: Icon(
                                                                                      Icons.done,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 19.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      width: double.infinity,
                                                                                      height: 33.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).customColor2,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                          ),
                                                                                      elevation: 2.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  );
                                                                                },
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
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              if (FFAppState().show)
                                                Container(
                                                  width: 285.0,
                                                  height: 310.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          child: custom_widgets
                                                              .QrCode(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            data:
                                                                _model.platform,
                                                            size: 250.0,
                                                            backgroundColor:
                                                                Colors.black,
                                                            foregroundColor:
                                                                Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        FFAppState().dId,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      StreamBuilder<List<OutletRecord>>(
                                        stream: queryOutletRecord(
                                          queryBuilder: (outletRecord) =>
                                              outletRecord.where(
                                            'id',
                                            isEqualTo:
                                                FFAppState().outletId != ''
                                                    ? FFAppState().outletId
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 40.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<OutletRecord>
                                              subscriptionOutletRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final subscriptionOutletRecord =
                                              subscriptionOutletRecordList
                                                      .isNotEmpty
                                                  ? subscriptionOutletRecordList
                                                      .first
                                                  : null;

                                          return Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.5,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.16,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '2q90lo1v' /* Subscription Due Date */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                        ),
                                                      ),
                                                      AutoSizeText(
                                                        functions.milisecToTimestamp(
                                                            subscriptionOutletRecord
                                                                ?.renewalDate),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 3.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      LinearPercentIndicator(
                                                        percent: 0.9,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.3,
                                                        lineHeight: 22.0,
                                                        animation: true,
                                                        animateFromLastPercent:
                                                            true,
                                                        progressColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor2,
                                                        center: Text(
                                                          functions.subscriptionDays(
                                                              getCurrentTimestamp,
                                                              subscriptionOutletRecord!
                                                                  .renewalDate),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                        ),
                                                        barRadius:
                                                            Radius.circular(
                                                                20.0),
                                                        padding:
                                                            EdgeInsets.zero,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'lcfibsml' /* Remaining Days */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      if (getJsonField(
                            _model.docRes,
                            r'''$.platform''',
                          ) ==
                          'WINDOWS')
                        FutureBuilder<ApiCallResponse>(
                          future: GetDeviceCall.call(
                            deviceId: widget!.deviceDocId,
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
                            final con2GetDeviceResponse = snapshot.data!;

                            return Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                        decoration: BoxDecoration(),
                                        child: TextFormField(
                                          controller: _model.textController3,
                                          focusNode: _model.textFieldFocusNode3,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.datetime,
                                          validator: _model
                                              .textController3Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.16,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                getJsonField(
                                                  con2GetDeviceResponse
                                                      .jsonBody,
                                                  r'''$[:].outletName''',
                                                ).toString(),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displaySmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 21.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmallFamily),
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              getJsonField(
                                                con2GetDeviceResponse.jsonBody,
                                                r'''$[:].outletId''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 1.0, 0.0, 20.0),
                                        child: Container(
                                          width: 300.0,
                                          height: 320.0,
                                          decoration: BoxDecoration(),
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: FutureBuilder<
                                                    ApiCallResponse>(
                                                  future: GetUserOutletWiseCall
                                                      .call(
                                                    outletId: getJsonField(
                                                      con2GetDeviceResponse
                                                          .jsonBody,
                                                      r'''$[:].outId''',
                                                    ).toString(),
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 40.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final pinGetUserOutletWiseResponse =
                                                        snapshot.data!;

                                                    return Container(
                                                      width: 275.0,
                                                      height: 290.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      width:
                                                                          0.5,
                                                                    ),
                                                                  ),
                                                                  child: Stack(
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(1.0),
                                                                          child:
                                                                              FlutterFlowDropDown<String>(
                                                                            controller: _model.dropDownValueController2 ??=
                                                                                FormFieldController<String>(null),
                                                                            options: getJsonField(
                                                                              pinGetUserOutletWiseResponse.jsonBody,
                                                                              r'''$[:1].userExists''',
                                                                            )
                                                                                ? (getJsonField(
                                                                                    pinGetUserOutletWiseResponse.jsonBody,
                                                                                    r'''$[:].userName''',
                                                                                    true,
                                                                                  ) as List)
                                                                                    .map<String>((s) => s.toString())
                                                                                    .toList()!
                                                                                : FFAppState().emptyOptions,
                                                                            onChanged: (val) =>
                                                                                safeSetState(() => _model.dropDownValue2 = val),
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '08cuexl7' /* Please select... */,
                                                                            ),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 16.0,
                                                                            ),
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderWidth:
                                                                                0.0,
                                                                            borderRadius:
                                                                                0.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                4.0,
                                                                                12.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            disabled:
                                                                                !getJsonField(
                                                                              pinGetUserOutletWiseResponse.jsonBody,
                                                                              r'''$[:].userExists''',
                                                                            ),
                                                                            isSearchable:
                                                                                false,
                                                                            isMultiSelect:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      width:
                                                                          0.5,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textController4,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldFocusNode4,
                                                                    autofocus:
                                                                        false,
                                                                    readOnly:
                                                                        true,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      labelText:
                                                                          FFAppState()
                                                                              .quickPin,
                                                                      hintStyle: FlutterFlowTheme.of(
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
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    validator: _model
                                                                        .textController4Validator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 3.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    _model.one1 = await actions.setQuickPin(
                                                                                      '1',
                                                                                    );
                                                                                    FFAppState().quickPin = _model.one1!;
                                                                                    FFAppState().update(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'q1134pxo' /* 1 */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 33.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).customColor2,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 2.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 3.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    _model.four1 = await actions.setQuickPin(
                                                                                      '4',
                                                                                    );
                                                                                    FFAppState().quickPin = _model.four1!;
                                                                                    FFAppState().update(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'pmureu09' /* 4 */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 33.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).customColor2,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 2.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 3.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    _model.seven1 = await actions.setQuickPin(
                                                                                      '7',
                                                                                    );
                                                                                    FFAppState().quickPin = _model.seven1!;
                                                                                    FFAppState().update(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'n5oobyj1' /* 7 */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 33.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).customColor2,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 2.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    FFAppState().quickPin = '';
                                                                                    FFAppState().update(() {});
                                                                                  },
                                                                                  text: '',
                                                                                  icon: Icon(
                                                                                    Icons.backspace_sharp,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 16.0,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 33.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).customColor2,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 2.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    _model.two1 = await actions.setQuickPin(
                                                                                      '2',
                                                                                    );
                                                                                    FFAppState().quickPin = _model.two1!;
                                                                                    FFAppState().update(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    '8mv0bmdd' /* 2 */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 33.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).customColor2,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 2.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    _model.five1 = await actions.setQuickPin(
                                                                                      '5',
                                                                                    );
                                                                                    FFAppState().quickPin = _model.five1!;
                                                                                    FFAppState().update(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    '79c7xvsb' /* 5 */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 33.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).customColor2,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 2.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    _model.eight1 = await actions.setQuickPin(
                                                                                      '8',
                                                                                    );
                                                                                    FFAppState().quickPin = _model.eight1!;
                                                                                    FFAppState().update(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'v9sce6yz' /* 8 */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 33.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).customColor2,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 2.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  _model.zero1 = await actions.setQuickPin(
                                                                                    '0',
                                                                                  );
                                                                                  FFAppState().quickPin = _model.zero1!;
                                                                                  FFAppState().update(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'qocntyu7' /* 0 */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  width: double.infinity,
                                                                                  height: 33.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).customColor2,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                      ),
                                                                                  elevation: 2.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 3.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  _model.three1 = await actions.setQuickPin(
                                                                                    '3',
                                                                                  );
                                                                                  FFAppState().quickPin = _model.three1!;
                                                                                  FFAppState().update(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'zpbdff67' /* 3 */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  width: double.infinity,
                                                                                  height: 33.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).customColor2,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                      ),
                                                                                  elevation: 2.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 3.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  _model.six1 = await actions.setQuickPin(
                                                                                    '6',
                                                                                  );
                                                                                  FFAppState().quickPin = _model.six1!;
                                                                                  FFAppState().update(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  '3mey5s8w' /* 6 */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  width: double.infinity,
                                                                                  height: 33.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).customColor2,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                      ),
                                                                                  elevation: 2.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 3.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  _model.nine1 = await actions.setQuickPin(
                                                                                    '9',
                                                                                  );
                                                                                  FFAppState().quickPin = _model.nine1!;
                                                                                  FFAppState().update(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  '45uygnr1' /* 9 */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  width: double.infinity,
                                                                                  height: 33.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).customColor2,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                      ),
                                                                                  elevation: 2.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  _model.docUserCopy = await actions.validateUserCopy(
                                                                                    getJsonField(
                                                                                      pinGetUserOutletWiseResponse.jsonBody,
                                                                                      r'''$''',
                                                                                      true,
                                                                                    )!,
                                                                                    _model.textController4.text,
                                                                                    _model.textController3.text,
                                                                                  );
                                                                                  _model.shiftJsonCopy = await actions.shiftExists(
                                                                                    functions.getDayId(),
                                                                                    '0',
                                                                                    FFAppState().outletId,
                                                                                  );

                                                                                  context.pushNamed(
                                                                                    'LoadingScreen',
                                                                                    queryParameters: {
                                                                                      'shiftDoc': serializeParam(
                                                                                        _model.shiftJsonCopy,
                                                                                        ParamType.JSON,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );

                                                                                  await Future.delayed(const Duration(milliseconds: 5000));

                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: '',
                                                                                icon: Icon(
                                                                                  Icons.done,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 19.0,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  width: double.infinity,
                                                                                  height: 33.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).customColor2,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                      ),
                                                                                  elevation: 2.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
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
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              if (FFAppState().show)
                                                Container(
                                                  width: 285.0,
                                                  height: 310.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          child: custom_widgets
                                                              .QrCode(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            data:
                                                                _model.platform,
                                                            size: 250.0,
                                                            backgroundColor:
                                                                Colors.black,
                                                            foregroundColor:
                                                                Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        FFAppState().dId,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.16,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 3.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: AutoSizeText(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '707df69s' /* Subscription Due Date */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  AutoSizeText(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'e41ud8dm' /* 09/06/2022 */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 3.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  LinearPercentIndicator(
                                                    percent: 0.9,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.3,
                                                    lineHeight: 22.0,
                                                    animation: true,
                                                    animateFromLastPercent:
                                                        true,
                                                    progressColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .customColor2,
                                                    center: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'g1lo25eu' /* 329 */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                    ),
                                                    barRadius:
                                                        Radius.circular(20.0),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'gx5ur9uv' /* Remaining Days */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 100.0,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondary,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 50.0),
                          child: Container(
                            width: 100.0,
                            height: MediaQuery.sizeOf(context).height * 0.6,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60.0,
                                  height: 60.0,
                                  constraints: BoxConstraints(
                                    maxWidth: 85.0,
                                    maxHeight: 85.0,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 50.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.settings,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 27.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed('SettingHomepage');
                                    },
                                  ),
                                ),
                                Container(
                                  width: 60.0,
                                  height: 60.0,
                                  constraints: BoxConstraints(
                                    maxWidth: 85.0,
                                    maxHeight: 85.0,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 50.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.keyboard_hide_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 27.0,
                                    ),
                                    onPressed: () async {
                                      FFAppState().show = functions
                                          .toggleLogin(FFAppState().show);
                                      FFAppState().update(() {});
                                    },
                                  ),
                                ),
                                Container(
                                  width: 60.0,
                                  height: 60.0,
                                  constraints: BoxConstraints(
                                    maxWidth: 85.0,
                                    maxHeight: 85.0,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 50.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.power_settings_new,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 27.0,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Color(0x00000000),
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height: double.infinity,
                                                child: PowerOffWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
