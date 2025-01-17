import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_business_profile_widget.dart' show AddBusinessProfileWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddBusinessProfileModel
    extends FlutterFlowModel<AddBusinessProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextBusinessName widget.
  FocusNode? textBusinessNameFocusNode;
  TextEditingController? textBusinessNameTextController;
  String? Function(BuildContext, String?)?
      textBusinessNameTextControllerValidator;
  // State field(s) for DropDownBusinessType widget.
  String? dropDownBusinessTypeValue;
  FormFieldController<String>? dropDownBusinessTypeValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  BusinessTypeRecord? busineesTypeDoc;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BusinesssMasterRecord? doc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textBusinessNameFocusNode?.dispose();
    textBusinessNameTextController?.dispose();
  }
}
