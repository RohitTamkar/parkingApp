import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/calender/calender_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_bill_widget.dart' show EditBillWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class EditBillModel extends FlutterFlowModel<EditBillWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, InvoiceRecord>? listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  // Stores action output result for [Custom Action - docToJson] action in Container widget.
  dynamic? resultItem;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // Stores action output result for [Custom Action - scanPrinter] action in PrintEditBill widget.
  bool? resDevice2;
  // Stores action output result for [Custom Action - newCustomAction] action in PrintEditBill widget.
  List<dynamic>? device1;
  // Stores action output result for [Custom Action - reduceQuantityEB] action in EditMinus widget.
  List<dynamic>? res1;
  // Stores action output result for [Custom Action - calSubTotalCopy] action in Delete widget.
  double? zzz;
  // Stores action output result for [Custom Action - newCustomAction2] action in Save widget.
  List<SelItemListStruct>? returnList;
  // Stores action output result for [Custom Action - shiftExists] action in Save widget.
  dynamic? shiftList;
  // Stores action output result for [Custom Action - updateShiftSummaryForEB] action in Save widget.
  dynamic? returnList1;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    listViewStreamSubscriptions1.forEach((s) => s?.cancel());
    listViewPagingController1?.dispose();

    expandableExpandableController.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, InvoiceRecord> setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, InvoiceRecord> _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, InvoiceRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryInvoiceRecordPage(
          parent: parent,
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
