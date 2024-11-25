import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/parking/list_view_msg/list_view_msg_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'edit_bill_list_widget.dart' show EditBillListWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditBillListModel extends FlutterFlowModel<EditBillListWidget> {
  ///  State fields for stateful widgets in this page.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Custom Action - returnDateNextday] action in Row widget.
  DateTime? datenext;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}