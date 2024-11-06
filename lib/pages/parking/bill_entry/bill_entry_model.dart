import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/qrparking/qrparking_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'bill_entry_widget.dart' show BillEntryWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BillEntryModel extends FlutterFlowModel<BillEntryWidget> {
  ///  Local state fields for this page.

  InvoiceRecord? listcars;

  ///  State fields for stateful widgets in this page.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  InvoiceRecord? search;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  InvoiceRecord? search2;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  InvoiceRecord? search3;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  InvoiceRecord? search4;
  var qrResult = '';
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  InvoiceRecord? getinvout;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
