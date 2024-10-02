import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calender_model.dart';
export 'calender_model.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({
    super.key,
    this.reportType,
  });

  final String? reportType;

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  late CalenderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalenderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 450.0,
          height: 370.0,
          decoration: BoxDecoration(
            color: Color(0xFFCFDCFF),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 34.0,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '72c46zuz' /* Cancel */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineMediumFamily),
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            var _shouldSetState = false;
                            FFAppState().filterDate = functions.selectedDayId(
                                _model.calendarSelectedDay!.start);
                            FFAppState().update(() {});
                            if (widget!.reportType == 'editbill') {
                              _model.invoicebyday =
                                  await actions.hiveGetInvoicestoday(
                                FFAppState().filterDate,
                              );
                              _shouldSetState = true;
                              FFAppState().invoiceList = _model.invoicebyday!
                                  .toList()
                                  .cast<InvoiceStructStruct>();
                              safeSetState(() {});
                              Navigator.pop(context);
                              if (_shouldSetState) safeSetState(() {});
                              return;
                            } else {
                              if (!functions.isPrinterSelected(
                                  FFAppState().printerDevice)!) {
                                _model.rd1 = await actions.scanPrinter(
                                  FFAppState().posMode,
                                );
                                _shouldSetState = true;
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('connect printer'),
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
                              }
                              _model.xxx = await actions.connectDevice(
                                FFAppState().printerDevice,
                                FFAppState().printerIndex,
                              );
                              _shouldSetState = true;
                              if (FFAppState().printerName != null &&
                                  FFAppState().printerName != '') {
                                if (widget!.reportType == 'daywise') {
                                  _model.resultDaywaise =
                                      await actions.getShiftDataForReport(
                                    FFAppState().filterDate,
                                    '0',
                                    FFAppState().outletId,
                                  );
                                  _shouldSetState = true;
                                  await actions.printDayWiseSalesReport(
                                    FFAppState().printerDevice,
                                    FFAppState().isPrinterConnected,
                                    FFAppState().printerName,
                                    FFAppState().paperSize,
                                    _model.resultDaywaise!.toList(),
                                  );
                                } else {
                                  if (widget!.reportType == 'billwise') {
                                    _model.resultBillData =
                                        await actions.getBillDataForReport(
                                      FFAppState().filterDate,
                                      '0',
                                      FFAppState().outletId,
                                    );
                                    _shouldSetState = true;
                                    await actions.printBillWiseSalesReport(
                                      _model.resultBillData!.toList(),
                                      FFAppState().printerDevice,
                                      FFAppState().isPrinterConnected,
                                      FFAppState().printerName,
                                      FFAppState().paperSize,
                                    );
                                  } else {
                                    if (widget!.reportType == 'productwise') {
                                      _model.resultProdwaise1 =
                                          await actions.productSaleReport(
                                        FFAppState().filterDate,
                                        FFAppState().outletId,
                                      );
                                      _shouldSetState = true;
                                      await actions.printBillData(
                                        _model.resultProdwaise1!.toList(),
                                        FFAppState().printerDevice,
                                        FFAppState().isPrinterConnected,
                                        FFAppState().printerName,
                                        FFAppState().paperSize,
                                      );
                                    } else {
                                      if (widget!.reportType == 'catwise') {
                                        _model.resultCatwaise1 =
                                            await actions.productSaleReport(
                                          FFAppState().filterDate,
                                          FFAppState().outletId,
                                        );
                                        _shouldSetState = true;
                                        await actions
                                            .printCategoryWiseSalesReport(
                                          _model.resultCatwaise1!.toList(),
                                          FFAppState().printerDevice,
                                          FFAppState().isPrinterConnected,
                                          FFAppState().printerName,
                                          FFAppState().paperSize,
                                        );
                                      }
                                    }
                                  }
                                }

                                Navigator.pop(context);
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
                            }

                            if (_shouldSetState) safeSetState(() {});
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '0n03ah8v' /* Done */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineMediumFamily),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                child: FlutterFlowCalendar(
                  color: Color(0xFF5E7BD4),
                  weekFormat: false,
                  weekStartsMonday: true,
                  initialDate: getCurrentTimestamp,
                  rowHeight: 32.0,
                  onChange: (DateTimeRange? newSelectedDate) {
                    safeSetState(
                        () => _model.calendarSelectedDay = newSelectedDate);
                  },
                  titleStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  dayOfWeekStyle: TextStyle(),
                  dateStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 16.0,
                  ),
                  selectedDateStyle: TextStyle(),
                  inactiveDateStyle: TextStyle(),
                  locale: FFLocalizations.of(context).languageCode,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
