import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/parking/email_input/email_input_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'monthly_pass_model.dart';
export 'monthly_pass_model.dart';

class MonthlyPassWidget extends StatefulWidget {
  const MonthlyPassWidget({
    super.key,
    this.appSetting,
  });

  final AppSettingsRecord? appSetting;

  @override
  State<MonthlyPassWidget> createState() => _MonthlyPassWidgetState();
}

class _MonthlyPassWidgetState extends State<MonthlyPassWidget> {
  late MonthlyPassModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MonthlyPassModel());

    _model.textFieldAmtTextController ??= TextEditingController();
    _model.textFieldAmtFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.textFieldAmtTextController?.text =
              FFLocalizations.of(context).getText(
            'vnkszzot' /* 0 */,
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

    return StreamBuilder<List<OutletRecord>>(
      stream: queryOutletRecord(
        queryBuilder: (outletRecord) => outletRecord.where(
          'id',
          isEqualTo: FFAppState().outletId,
        ),
        singleRecord: true,
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
        List<OutletRecord> monthlyPassOutletRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final monthlyPassOutletRecord = monthlyPassOutletRecordList.isNotEmpty
            ? monthlyPassOutletRecordList.first
            : null;

        return Title(
            title: 'MonthlyPass',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).parkingPrimary,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed(
                                      'VehicleEntry',
                                      queryParameters: {
                                        'shiftDoc': serializeParam(
                                          FFAppState().shiftDetailsNEw,
                                          ParamType.JSON,
                                        ),
                                        'userRef': serializeParam(
                                          currentUserReference,
                                          ParamType.DocumentReference,
                                        ),
                                        'appSetting': serializeParam(
                                          widget!.appSetting,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'appSetting': widget!.appSetting,
                                      },
                                    );
                                  },
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '6e9ne09o' /* Monthly Pass */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        fontSize: 20.0,
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
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .parkingPrimary,
                                  icon: Icon(
                                    Icons.person_add,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('addCustomer1');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8.0,
                              color: FlutterFlowTheme.of(context).accent2,
                              offset: Offset(
                                2.0,
                                5.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    StreamBuilder<List<PartyRecord>>(
                                      stream: queryPartyRecord(
                                        parent: FFAppState().outletIdRef,
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 40.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<PartyRecord>
                                            dropDownPartyRecordList =
                                            snapshot.data!;

                                        return FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownValueController ??=
                                              FormFieldController<String>(null),
                                          options: dropDownPartyRecordList
                                              .map((e) => e.name)
                                              .toList(),
                                          onChanged: (val) async {
                                            safeSetState(() =>
                                                _model.dropDownValue = val);
                                            _model.selectedParty =
                                                dropDownPartyRecordList
                                                    .where((e) =>
                                                        _model.dropDownValue ==
                                                        e.name)
                                                    .toList()
                                                    .firstOrNull;
                                            safeSetState(() {});
                                          },
                                          width: 350.0,
                                          height: 50.0,
                                          searchHintTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily),
                                                  ),
                                          searchTextStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'drej0p4k' /* Select Customer */,
                                          ),
                                          searchHintText:
                                              FFLocalizations.of(context)
                                                  .getText(
                                            'xn775pq2' /* Select Customer */,
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor: Color(0xFFF4E9E9),
                                          elevation: 2.0,
                                          borderColor: Color(0x0049E937),
                                          borderWidth: 0.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: true,
                                          isMultiSelect: false,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 3.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'mhkmvvj2' /* Customer Name */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLargeFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily),
                                                ),
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            _model.selectedParty?.name,
                                            '-',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 20.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          _model.selectedParty?.mobile,
                                          '-',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 3.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '28yvg1cy' /* Vehicle No */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLargeFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily),
                                                ),
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            _model.selectedParty?.vehicleNo,
                                            '-',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
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
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 3.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'srv7sdzb' /* Vehicle Type */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLargeFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily),
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              _model.selectedParty?.vehicleType,
                                              '-',
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 0.0),
                                        child: StreamBuilder<
                                            List<PaymentModeRecord>>(
                                          stream: queryPaymentModeRecord(),
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
                                            List<PaymentModeRecord>
                                                paymentPaymentModeRecordList =
                                                snapshot.data!;

                                            return FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .paymentValueController ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options:
                                                  paymentPaymentModeRecordList
                                                      .map((e) => e.name)
                                                      .toList(),
                                              onChanged: (val) async {
                                                safeSetState(() =>
                                                    _model.paymentValue = val);
                                                _model.selectedPaymentType =
                                                    _model.paymentValue!;
                                                safeSetState(() {});
                                              },
                                              width: 180.0,
                                              height: 40.0,
                                              textStyle:
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
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '69b8u8x5' /* Payment Type */,
                                              ),
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                size: 20.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              borderWidth: 0.0,
                                              borderRadius: 10.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 4.0, 12.0, 4.0),
                                              hidesUnderline: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .passValueController ??=
                                              FormFieldController<String>(null),
                                          options: [
                                            FFLocalizations.of(context).getText(
                                              '0dn1yg2l' /* Weekly Pass */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '7h84zqgb' /* Monthly Pass */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '7te0eciy' /* Half Month Pass */,
                                            )
                                          ],
                                          onChanged: (val) async {
                                            safeSetState(
                                                () => _model.passValue = val);
                                            _model.selectedMessage =
                                                _model.passValue!;
                                            safeSetState(() {});
                                          },
                                          width: 180.0,
                                          height: 40.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMediumFamily),
                                              ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '40543i3b' /* Message */,
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 20.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                          borderWidth: 0.0,
                                          borderRadius: 10.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 4.0, 12.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '7slympd9' /* Created Date */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLargeFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily),
                                                ),
                                          ),
                                          Text(
                                            functions.milisecToTimestamp(
                                                getCurrentTimestamp
                                                    .millisecondsSinceEpoch),
                                            style: FlutterFlowTheme.of(context)
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
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'vf9siwoq' /* Renewed Date */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLargeFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily),
                                                ),
                                          ),
                                          Text(
                                            functions.milisecToTimestamp(
                                                functions.renewalOnSelection(
                                                    _model.selectedMessage,
                                                    getCurrentTimestamp
                                                        .millisecondsSinceEpoch)),
                                            style: FlutterFlowTheme.of(context)
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
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'wyo4oq8o' /* Amount  */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily),
                                        ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller:
                                          _model.textFieldAmtTextController,
                                      focusNode: _model.textFieldAmtFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textFieldAmtTextController',
                                        Duration(milliseconds: 2000),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily),
                                          ),
                                      validator: _model
                                          .textFieldAmtTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        if ((_model.dropDownValue != null &&
                                                _model.dropDownValue != '') &&
                                            (_model.paymentValue != null &&
                                                _model.paymentValue != '') &&
                                            (_model.passValue != null &&
                                                _model.passValue != '') &&
                                            (_model.textFieldAmtTextController
                                                        .text !=
                                                    null &&
                                                _model.textFieldAmtTextController
                                                        .text !=
                                                    '')) {
                                          var monthlyPassRecordReference =
                                              MonthlyPassRecord.createDoc(
                                                  FFAppState().outletIdRef!);
                                          await monthlyPassRecordReference
                                              .set(createMonthlyPassRecordData(
                                            planName: _model.selectedMessage,
                                            status: true,
                                            validityDays: () {
                                              if (_model.selectedMessage ==
                                                  'Weekly Pass') {
                                                return 7;
                                              } else if (_model
                                                      .selectedMessage ==
                                                  'Monthly Pass') {
                                                return 30;
                                              } else if (_model
                                                      .selectedMessage ==
                                                  'Half Month Pass') {
                                                return 15;
                                              } else {
                                                return 0;
                                              }
                                            }(),
                                            createdBy:
                                                FFAppState().logedInUserDetail,
                                            updatedBy: currentUserReference,
                                            custRef:
                                                _model.selectedParty?.reference,
                                            amount: double.tryParse(_model
                                                .textFieldAmtTextController
                                                .text),
                                            paymentType:
                                                _model.selectedPaymentType,
                                            passStartDate: getCurrentTimestamp
                                                .millisecondsSinceEpoch,
                                            passEndDate:
                                                functions.renewalOnSelection(
                                                    _model.selectedMessage,
                                                    getCurrentTimestamp
                                                        .millisecondsSinceEpoch),
                                            passStartDayId:
                                                functions.milisecToTimestamp(
                                                    getCurrentTimestamp
                                                        .millisecondsSinceEpoch),
                                            passEndDayId: functions
                                                .milisecToTimestamp(functions
                                                    .renewalOnSelection(
                                                        _model.selectedMessage,
                                                        getCurrentTimestamp
                                                            .millisecondsSinceEpoch)),
                                          ));
                                          _model.passDoc = MonthlyPassRecord
                                              .getDocumentFromData(
                                                  createMonthlyPassRecordData(
                                                    planName:
                                                        _model.selectedMessage,
                                                    status: true,
                                                    validityDays: () {
                                                      if (_model
                                                              .selectedMessage ==
                                                          'Weekly Pass') {
                                                        return 7;
                                                      } else if (_model
                                                              .selectedMessage ==
                                                          'Monthly Pass') {
                                                        return 30;
                                                      } else if (_model
                                                              .selectedMessage ==
                                                          'Half Month Pass') {
                                                        return 15;
                                                      } else {
                                                        return 0;
                                                      }
                                                    }(),
                                                    createdBy: FFAppState()
                                                        .logedInUserDetail,
                                                    updatedBy:
                                                        currentUserReference,
                                                    custRef: _model
                                                        .selectedParty
                                                        ?.reference,
                                                    amount: double.tryParse(_model
                                                        .textFieldAmtTextController
                                                        .text),
                                                    paymentType: _model
                                                        .selectedPaymentType,
                                                    passStartDate:
                                                        getCurrentTimestamp
                                                            .millisecondsSinceEpoch,
                                                    passEndDate: functions
                                                        .renewalOnSelection(
                                                            _model
                                                                .selectedMessage,
                                                            getCurrentTimestamp
                                                                .millisecondsSinceEpoch),
                                                    passStartDayId: functions
                                                        .milisecToTimestamp(
                                                            getCurrentTimestamp
                                                                .millisecondsSinceEpoch),
                                                    passEndDayId: functions
                                                        .milisecToTimestamp(functions
                                                            .renewalOnSelection(
                                                                _model
                                                                    .selectedMessage,
                                                                getCurrentTimestamp
                                                                    .millisecondsSinceEpoch)),
                                                  ),
                                                  monthlyPassRecordReference);

                                          await _model.passDoc!.reference
                                              .update(
                                                  createMonthlyPassRecordData(
                                            id: _model.passDoc?.reference.id,
                                          ));
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Pass Created Successfully.',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 1100),
                                              backgroundColor:
                                                  Color(0xFF67EA11),
                                            ),
                                          );
                                          if (!functions.isPrinterSelected(
                                              FFAppState().printerDevice)!) {
                                            _model.resDevice3 =
                                                await actions.scanPrinter(
                                              FFAppState().posMode,
                                            );
                                          }
                                          await actions.connectDevice(
                                            FFAppState().printerDevice,
                                            FFAppState().printerIndex,
                                          );
                                          if (FFAppState().printerName !=
                                                  null &&
                                              FFAppState().printerName != '') {
                                            _model.device3 =
                                                await actions.newCustomAction(
                                              FFAppState().printerIndex,
                                            );
                                            _model.outletdoc2 =
                                                await queryOutletRecordOnce(
                                              queryBuilder: (outletRecord) =>
                                                  outletRecord.where(
                                                'id',
                                                isEqualTo: FFAppState()
                                                    .outletIdRef
                                                    ?.id,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            await actions.printPassParking(
                                              _model.device3!.toList(),
                                              FFAppState().isPrinterConnected,
                                              FFAppState().printerName,
                                              getJsonField(
                                                functions.outletDocToJson(
                                                    _model.outletdoc2!),
                                                r'''$''',
                                              ),
                                              _model.passDoc!,
                                              FFAppState().paperSize,
                                              _model.selectedParty!.name,
                                              _model.selectedParty!.mobile,
                                              _model.selectedParty!.vehicleNo,
                                              _model.selectedParty!.vehicleType,
                                            );

                                            context.pushNamed('VehicleEntry');
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'printer connection'),
                                                  content: Text(
                                                      'printer not connected'),
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
                                          }
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Error'),
                                                content: Text(
                                                    'Fill Required Fields'),
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
                                        }

                                        safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'pxgkvnwj' /* Create Pass */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 150.0,
                                        height: 45.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .parkingSecondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .displayLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displayLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayLargeFamily),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          if ((_model.dropDownValue != null &&
                                                  _model.dropDownValue != '') &&
                                              (_model.paymentValue != null &&
                                                  _model.paymentValue != '') &&
                                              (_model.passValue != null &&
                                                  _model.passValue != '') &&
                                              (_model.textFieldAmtTextController
                                                          .text !=
                                                      null &&
                                                  _model.textFieldAmtTextController
                                                          .text !=
                                                      '')) {
                                            FFAppState().emailForReport =
                                                currentUserEmail;
                                            safeSetState(() {});
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: EmailInputWidget(),
                                                  ),
                                                );
                                              },
                                            );

                                            var monthlyPassRecordReference =
                                                MonthlyPassRecord.createDoc(
                                                    FFAppState().outletIdRef!);
                                            await monthlyPassRecordReference
                                                .set(
                                                    createMonthlyPassRecordData(
                                              planName: _model.selectedMessage,
                                              status: true,
                                              validityDays: () {
                                                if (_model.selectedMessage ==
                                                    'Weekly Pass') {
                                                  return 7;
                                                } else if (_model
                                                        .selectedMessage ==
                                                    'Monthly Pass') {
                                                  return 30;
                                                } else if (_model
                                                        .selectedMessage ==
                                                    'Half Month Pass') {
                                                  return 15;
                                                } else {
                                                  return 0;
                                                }
                                              }(),
                                              createdBy: FFAppState()
                                                  .logedInUserDetail,
                                              updatedBy: currentUserReference,
                                              custRef: _model
                                                  .selectedParty?.reference,
                                              amount: double.tryParse(_model
                                                  .textFieldAmtTextController
                                                  .text),
                                              paymentType:
                                                  _model.selectedPaymentType,
                                              passStartDate: getCurrentTimestamp
                                                  .millisecondsSinceEpoch,
                                              passEndDate:
                                                  functions.renewalOnSelection(
                                                      _model.selectedMessage,
                                                      getCurrentTimestamp
                                                          .millisecondsSinceEpoch),
                                              passStartDayId:
                                                  functions.milisecToTimestamp(
                                                      getCurrentTimestamp
                                                          .millisecondsSinceEpoch),
                                              passEndDayId: functions
                                                  .milisecToTimestamp(functions
                                                      .renewalOnSelection(
                                                          _model
                                                              .selectedMessage,
                                                          getCurrentTimestamp
                                                              .millisecondsSinceEpoch)),
                                            ));
                                            _model.passDocCopyCopy =
                                                MonthlyPassRecord.getDocumentFromData(
                                                    createMonthlyPassRecordData(
                                                      planName: _model
                                                          .selectedMessage,
                                                      status: true,
                                                      validityDays: () {
                                                        if (_model
                                                                .selectedMessage ==
                                                            'Weekly Pass') {
                                                          return 7;
                                                        } else if (_model
                                                                .selectedMessage ==
                                                            'Monthly Pass') {
                                                          return 30;
                                                        } else if (_model
                                                                .selectedMessage ==
                                                            'Half Month Pass') {
                                                          return 15;
                                                        } else {
                                                          return 0;
                                                        }
                                                      }(),
                                                      createdBy: FFAppState()
                                                          .logedInUserDetail,
                                                      updatedBy:
                                                          currentUserReference,
                                                      custRef: _model
                                                          .selectedParty
                                                          ?.reference,
                                                      amount: double.tryParse(_model
                                                          .textFieldAmtTextController
                                                          .text),
                                                      paymentType: _model
                                                          .selectedPaymentType,
                                                      passStartDate:
                                                          getCurrentTimestamp
                                                              .millisecondsSinceEpoch,
                                                      passEndDate: functions
                                                          .renewalOnSelection(
                                                              _model
                                                                  .selectedMessage,
                                                              getCurrentTimestamp
                                                                  .millisecondsSinceEpoch),
                                                      passStartDayId: functions
                                                          .milisecToTimestamp(
                                                              getCurrentTimestamp
                                                                  .millisecondsSinceEpoch),
                                                      passEndDayId: functions
                                                          .milisecToTimestamp(functions
                                                              .renewalOnSelection(
                                                                  _model
                                                                      .selectedMessage,
                                                                  getCurrentTimestamp
                                                                      .millisecondsSinceEpoch)),
                                                    ),
                                                    monthlyPassRecordReference);

                                            await _model
                                                .passDocCopyCopy!.reference
                                                .update(
                                                    createMonthlyPassRecordData(
                                              id: _model.passDocCopyCopy
                                                  ?.reference.id,
                                            ));
                                            _model.partydetails2Copy =
                                                await queryPartyRecordOnce(
                                              parent: FFAppState().outletIdRef,
                                              queryBuilder: (partyRecord) =>
                                                  partyRecord.where(
                                                'id',
                                                isEqualTo:
                                                    _model.selectedParty?.id,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _model.base64Link2Copy =
                                                await actions
                                                    .generateParkingPassPdf(
                                              _model.partydetails2Copy,
                                              _model.passDocCopyCopy,
                                            );
                                            _model.apiResult6yc22Copy =
                                                await SendMailCall.call(
                                              mobileNo: _model
                                                  .partydetails2Copy?.mobile,
                                              username: _model
                                                  .partydetails2Copy?.name,
                                              toEmail:
                                                  FFAppState().emailForReport,
                                              fileName: 'Monthly Pass',
                                              outletName:
                                                  monthlyPassOutletRecord?.name,
                                              branchName:
                                                  monthlyPassOutletRecord
                                                      ?.branch,
                                              file: _model.base64Link2Copy,
                                              reportType: 'Monthly Pass',
                                              roll:
                                                  FFAppState().currentUserRole,
                                            );

                                            if ((_model.apiResult6yc22Copy
                                                    ?.succeeded ??
                                                true)) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Email Sent Successfully. Wait 5-8 Minutes..'),
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

                                              context.pushNamed('VehicleEntry');
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Email Not Sent ! Try Again'),
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
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Error'),
                                                  content: Text(
                                                      'Fill Required Fields'),
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
                                          }

                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '3d6rzj9a' /* Send Mail */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 150.0,
                                          height: 45.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
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
              ),
            ));
      },
    );
  }
}
