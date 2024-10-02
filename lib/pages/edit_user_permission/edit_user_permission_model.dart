import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_user_permission_widget.dart' show EditUserPermissionWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditUserPermissionModel
    extends FlutterFlowModel<EditUserPermissionWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue3;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue4;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue5;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue6;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue7;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue8;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Custom Action - accessDropdown] action in DropDown widget.
  int? d1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Custom Action - accessDropdown] action in DropDown widget.
  int? d2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // Stores action output result for [Custom Action - accessDropdown] action in DropDown widget.
  int? d3;
  // State field(s) for DropDown widget.
  String? dropDownValue4;
  FormFieldController<String>? dropDownValueController4;
  // Stores action output result for [Custom Action - accessDropdown] action in DropDown widget.
  int? d4;
  // State field(s) for DropDown widget.
  String? dropDownValue5;
  FormFieldController<String>? dropDownValueController5;
  // Stores action output result for [Custom Action - accessDropdown] action in DropDown widget.
  int? d5;
  // State field(s) for DropDown widget.
  String? dropDownValue6;
  FormFieldController<String>? dropDownValueController6;
  // Stores action output result for [Custom Action - accessDropdown] action in DropDown widget.
  int? d6;
  // State field(s) for DropDown widget.
  String? dropDownValue7;
  FormFieldController<String>? dropDownValueController7;
  // Stores action output result for [Custom Action - accessDropdown] action in DropDown widget.
  int? d7;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue9;
  // Stores action output result for [Custom Action - userAccessNew] action in Button widget.
  List<UserAccessCStruct>? permissionList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
  }
}
