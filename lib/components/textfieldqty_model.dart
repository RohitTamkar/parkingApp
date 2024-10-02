import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'textfieldqty_widget.dart' show TextfieldqtyWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TextfieldqtyModel extends FlutterFlowModel<TextfieldqtyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - addToHoldListprdplus] action in TextField widget.
  List<dynamic>? resultplus;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in TextField widget.
  double? res13;
  // Stores action output result for [Custom Action - calBillAmt] action in TextField widget.
  double? reuslt12;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
