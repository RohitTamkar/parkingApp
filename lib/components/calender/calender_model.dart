import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'calender_widget.dart' show CalenderWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalenderModel extends FlutterFlowModel<CalenderWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - hiveGetInvoicestoday] action in Text widget.
  List<InvoiceStructStruct>? invoicebyday;
  // Stores action output result for [Custom Action - scanPrinter] action in Text widget.
  bool? rd1;
  // Stores action output result for [Custom Action - connectDevice] action in Text widget.
  bool? xxx;
  // Stores action output result for [Custom Action - getShiftDataForReport] action in Text widget.
  List<dynamic>? resultDaywaise;
  // Stores action output result for [Custom Action - getBillDataForReport] action in Text widget.
  List<dynamic>? resultBillData;
  // Stores action output result for [Custom Action - productSaleReport] action in Text widget.
  List<dynamic>? resultProdwaise1;
  // Stores action output result for [Custom Action - productSaleReport] action in Text widget.
  List<dynamic>? resultCatwaise1;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
