import '/backend/api_requests/api_calls.dart';
import '/components/discount_and_delivery_copy/discount_and_delivery_copy_widget.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'product_and_list_w_i_n_widget.dart' show ProductAndListWINWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductAndListWINModel extends FlutterFlowModel<ProductAndListWINWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in Column widget.
  double? res11;
  // Stores action output result for [Custom Action - addToHoldListCopy] action in ProductName widget.
  List<dynamic>? resultPl2;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in ProductName widget.
  double? res6;
  // Stores action output result for [Custom Action - calBillAmt] action in ProductName widget.
  double? res10;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // Stores action output result for [Custom Action - reduceQuantityHoldList] action in Minus widget.
  List<dynamic>? res31;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in Minus widget.
  double? res33;
  // Stores action output result for [Custom Action - calBillAmt] action in Minus widget.
  double? reu35;
  // Stores action output result for [Custom Action - addQuantityHoldList] action in Plus widget.
  List<dynamic>? res12;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in Plus widget.
  double? res13;
  // Stores action output result for [Custom Action - calBillAmt] action in Plus widget.
  double? reuslt12;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - selectBillPrint] action in Button widget.
  List<dynamic>? returnedList3;
  // Stores action output result for [Custom Action - scanPrinter] action in Button widget.
  bool? resDevice2;
  // Stores action output result for [Custom Action - selectBillPrint] action in Button widget.
  List<dynamic>? returnedList2;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  List<dynamic>? device;
  // State field(s) for TextFieldsearch widget.
  FocusNode? textFieldsearchFocusNode;
  TextEditingController? textFieldsearchTextController;
  String? Function(BuildContext, String?)?
      textFieldsearchTextControllerValidator;

  @override
  void initState(BuildContext context) {
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
  }

  @override
  void dispose() {
    menuDrawerModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldsearchFocusNode?.dispose();
    textFieldsearchTextController?.dispose();
  }
}
