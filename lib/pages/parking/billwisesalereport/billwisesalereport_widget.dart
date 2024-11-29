import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/parking/email_input/email_input_widget.dart';
import '/pages/parking/list_view_msg/list_view_msg_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'billwisesalereport_model.dart';
export 'billwisesalereport_model.dart';

class BillwisesalereportWidget extends StatefulWidget {
  /// parking app
  const BillwisesalereportWidget({super.key});

  @override
  State<BillwisesalereportWidget> createState() =>
      _BillwisesalereportWidgetState();
}

class _BillwisesalereportWidgetState extends State<BillwisesalereportWidget> {
  late BillwisesalereportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BillwisesalereportModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().filterDate = dateTimeFormat(
        "d/M/y",
        getCurrentTimestamp,
        locale: FFLocalizations.of(context).languageCode,
      );
      FFAppState().startDate = getCurrentTimestamp;
      FFAppState().endDate = getCurrentTimestamp;
      safeSetState(() {});
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

    return StreamBuilder<List<InvoiceRecord>>(
      stream: queryInvoiceRecord(
        parent: FFAppState().outletIdRef,
        queryBuilder: (invoiceRecord) => invoiceRecord
            .where(
              'invoiceDate',
              isGreaterThanOrEqualTo:
                  FFAppState().startDate?.millisecondsSinceEpoch,
            )
            .where(
              'invoiceDate',
              isLessThanOrEqualTo: FFAppState().endDate?.millisecondsSinceEpoch,
            ),
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
        List<InvoiceRecord> billwisesalereportInvoiceRecordList =
            snapshot.data!;

        return Title(
            title: 'billwisesalereport',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  floatingActionButton: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        print('FloatingActionButton pressed ...');
                      },
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 8.0,
                      label: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 50.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.print,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          var _shouldSetState = false;
                          if (!functions
                              .isPrinterSelected(FFAppState().printerDevice)!) {
                            _model.resDevice2 = await actions.scanPrinter(
                              FFAppState().posMode,
                            );
                            _shouldSetState = true;
                          }
                          _model.printer = await actions.connectDevice(
                            FFAppState().printerDevice,
                            FFAppState().printerIndex,
                          );
                          _shouldSetState = true;
                          if (_model.printer!) {
                            await actions.printbillsummaryReport(
                              FFAppState().printerDevice,
                              FFAppState().isPrinterConnected,
                              FFAppState().printerName,
                              FFAppState().paperSize,
                              billwisesalereportInvoiceRecordList
                                  .where((e) => e.checkOutTime != 0)
                                  .toList(),
                            );
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('printer connection'),
                                  content: Text('printer not connected'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }

                          if (_shouldSetState) safeSetState(() {});
                        },
                      ),
                    ),
                  ),
                  body: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 4,
                        child: StreamBuilder<List<OutletRecord>>(
                          stream: queryOutletRecord(
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
                            List<OutletRecord> containerOutletRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final containerOutletRecord =
                                containerOutletRecordList.isNotEmpty
                                    ? containerOutletRecordList.first
                                    : null;

                            return Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFAC47),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 15.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 50.0,
                                          icon: Icon(
                                            Icons.chevron_left,
                                            color: Color(0xFF0D0801),
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            context.pop();
                                          },
                                        ),
                                        AutoSizeText(
                                          FFLocalizations.of(context).getText(
                                            '32zgov2x' /* Bill Summary */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMediumFamily),
                                              ),
                                        ),
                                        Builder(
                                          builder: (context) =>
                                              FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 50.0,
                                            icon: Icon(
                                              Icons.email,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              FFAppState().emailForReport =
                                                  currentUserEmail;
                                              safeSetState(() {});
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus(),
                                                      child: EmailInputWidget(),
                                                    ),
                                                  );
                                                },
                                              );

                                              _model.base64Link2 = await actions
                                                  .genExcelForBillWiseReport(
                                                FFAppState()
                                                    .startDate
                                                    ?.toString(),
                                                containerOutletRecord?.name,
                                                billwisesalereportInvoiceRecordList
                                                    .toList(),
                                                FFAppState()
                                                    .endDate
                                                    ?.toString(),
                                              );
                                              _model.apiResult6yc2 =
                                                  await SendMailCall.call(
                                                mobileNo: FFAppState()
                                                    .currentMobileString,
                                                username: valueOrDefault(
                                                    currentUserDocument?.name,
                                                    ''),
                                                roll: FFAppState()
                                                    .currentUserRole,
                                                toEmail:
                                                    FFAppState().emailForReport,
                                                fileName: 'BillWiseSaleReport',
                                                outletName:
                                                    containerOutletRecord?.name,
                                                branchName:
                                                    containerOutletRecord
                                                        ?.branch,
                                                file: _model.base64Link2,
                                                reportType:
                                                    'Bill Wise Sale Report',
                                              );

                                              if ((_model.apiResult6yc2
                                                      ?.succeeded ??
                                                  true)) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
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
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
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

                                              safeSetState(() {});
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        flex: 26,
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final _datePicked1Date =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: getCurrentTimestamp,
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2050),
                                              builder: (context, child) {
                                                return wrapInMaterialDatePickerTheme(
                                                  context,
                                                  child!,
                                                  headerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  headerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  headerTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLargeFamily,
                                                            fontSize: 32.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLargeFamily),
                                                          ),
                                                  pickerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  pickerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  selectedDateTimeBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  selectedDateTimeForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  actionButtonForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 24.0,
                                                );
                                              },
                                            );

                                            if (_datePicked1Date != null) {
                                              safeSetState(() {
                                                _model.datePicked1 = DateTime(
                                                  _datePicked1Date.year,
                                                  _datePicked1Date.month,
                                                  _datePicked1Date.day,
                                                );
                                              });
                                            }
                                            FFAppState().startDate =
                                                _model.datePicked1;
                                            safeSetState(() {});
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                dateTimeFormat(
                                                  "d/M/y",
                                                  FFAppState().startDate,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                              Icon(
                                                Icons.calendar_month,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ].divide(SizedBox(width: 20.0)),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final _datePicked2Date =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: getCurrentTimestamp,
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2050),
                                              builder: (context, child) {
                                                return wrapInMaterialDatePickerTheme(
                                                  context,
                                                  child!,
                                                  headerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  headerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  headerTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLargeFamily,
                                                            fontSize: 32.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLargeFamily),
                                                          ),
                                                  pickerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  pickerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  selectedDateTimeBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  selectedDateTimeForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  actionButtonForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 24.0,
                                                );
                                              },
                                            );

                                            if (_datePicked2Date != null) {
                                              safeSetState(() {
                                                _model.datePicked2 = DateTime(
                                                  _datePicked2Date.year,
                                                  _datePicked2Date.month,
                                                  _datePicked2Date.day,
                                                );
                                              });
                                            }
                                            _model.datenext =
                                                await actions.returnDateNextday(
                                              _model.datePicked2!,
                                            );
                                            FFAppState().endDate =
                                                _model.datenext;
                                            FFAppState().filterDate =
                                                dateTimeFormat(
                                              "d/M/y",
                                              _model.datePicked2,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            );
                                            safeSetState(() {});

                                            safeSetState(() {});
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFAppState().filterDate,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                              Icon(
                                                Icons.calendar_month,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ].divide(SizedBox(width: 20.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 50.0)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(1.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'mwwbxkrw' /* No */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmallFamily,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmallFamily),
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'wvc8zgie' /* vehicle No */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmallFamily,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmallFamily),
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'uucq102f' /* Out Date */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmallFamily,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmallFamily),
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'e5hdgmdg' /* Net Amt */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmallFamily,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmallFamily),
                                                ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final billWiseSaleReportVar =
                                            billwisesalereportInvoiceRecordList
                                                .where(
                                                    (e) => e.checkOutTime != 0)
                                                .toList();
                                        if (billWiseSaleReportVar.isEmpty) {
                                          return Center(
                                            child: ListViewMsgWidget(),
                                          );
                                        }

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              billWiseSaleReportVar.length,
                                          itemBuilder: (context,
                                              billWiseSaleReportVarIndex) {
                                            final billWiseSaleReportVarItem =
                                                billWiseSaleReportVar[
                                                    billWiseSaleReportVarIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {},
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 10.0,
                                                                5.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            billWiseSaleReportVarItem
                                                                .count
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            billWiseSaleReportVarItem
                                                                .vechicleNo,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            dateTimeFormat(
                                                              "d/M/y",
                                                              DateTime.fromMillisecondsSinceEpoch(
                                                                  billWiseSaleReportVarItem
                                                                      .checkOutTime),
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'vg87jncc' /* ₹ */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelSmallFamily),
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  billWiseSaleReportVarItem
                                                                      .finalBillAmt
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelSmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 5.0)),
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
                              ],
                            ),
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
