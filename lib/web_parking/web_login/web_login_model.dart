import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'web_login_widget.dart' show WebLoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WebLoginModel extends FlutterFlowModel<WebLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldNumber widget.
  FocusNode? textFieldNumberFocusNode;
  TextEditingController? textFieldNumberTextController;
  String? Function(BuildContext, String?)?
      textFieldNumberTextControllerValidator;
  // State field(s) for TextFieldQuick widget.
  FocusNode? textFieldQuickFocusNode;
  TextEditingController? textFieldQuickTextController;
  late bool textFieldQuickVisibility;
  String? Function(BuildContext, String?)?
      textFieldQuickTextControllerValidator;
  // Stores action output result for [Custom Action - webLogin] action in Button widget.
  bool? res1;
  // Stores action output result for [Custom Action - webLogin] action in Button widget.
  bool? res15;

  @override
  void initState(BuildContext context) {
    textFieldQuickVisibility = false;
  }

  @override
  void dispose() {
    textFieldNumberFocusNode?.dispose();
    textFieldNumberTextController?.dispose();

    textFieldQuickFocusNode?.dispose();
    textFieldQuickTextController?.dispose();
  }
}
