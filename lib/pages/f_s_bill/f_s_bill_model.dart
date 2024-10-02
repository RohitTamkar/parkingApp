import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_copy/header_copy_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'f_s_bill_widget.dart' show FSBillWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class FSBillModel extends FlutterFlowModel<FSBillWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HeaderCopy component.
  late HeaderCopyModel headerCopyModel;
  // State field(s) for TextFieldDis widget.
  FocusNode? textFieldDisFocusNode;
  TextEditingController? textFieldDisTextController;
  String? Function(BuildContext, String?)? textFieldDisTextControllerValidator;
  // Stores action output result for [Custom Action - calBillAmt] action in TextFieldDis widget.
  double? result12;
  // State field(s) for TextFieldDisPercent widget.
  FocusNode? textFieldDisPercentFocusNode;
  TextEditingController? textFieldDisPercentTextController;
  String? Function(BuildContext, String?)?
      textFieldDisPercentTextControllerValidator;
  // State field(s) for TextFieldDeliverychar widget.
  FocusNode? textFieldDeliverycharFocusNode;
  TextEditingController? textFieldDeliverycharTextController;
  String? Function(BuildContext, String?)?
      textFieldDeliverycharTextControllerValidator;
  // Stores action output result for [Custom Action - calBillAmt] action in TextFieldDeliverychar widget.
  double? result13;
  // State field(s) for TextFieldTEnder widget.
  FocusNode? textFieldTEnderFocusNode;
  TextEditingController? textFieldTEnderTextController;
  String? Function(BuildContext, String?)?
      textFieldTEnderTextControllerValidator;
  // State field(s) for TextFieldReturn widget.
  FocusNode? textFieldReturnFocusNode;
  TextEditingController? textFieldReturnTextController;
  String? Function(BuildContext, String?)?
      textFieldReturnTextControllerValidator;
  // State field(s) for TextFieldtax widget.
  FocusNode? textFieldtaxFocusNode;
  TextEditingController? textFieldtaxTextController;
  String? Function(BuildContext, String?)? textFieldtaxTextControllerValidator;
  // Stores action output result for [Custom Action - addProductToList] action in Button widget.
  List<SelItemListStruct>? prodList;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvoiceRecord? docProd;
  // State field(s) for TextFieldsearch widget.
  FocusNode? textFieldsearchFocusNode;
  TextEditingController? textFieldsearchTextController;
  String? Function(BuildContext, String?)?
      textFieldsearchTextControllerValidator;
  List<PartyRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    headerCopyModel = createModel(context, () => HeaderCopyModel());
  }

  @override
  void dispose() {
    headerCopyModel.dispose();
    textFieldDisFocusNode?.dispose();
    textFieldDisTextController?.dispose();

    textFieldDisPercentFocusNode?.dispose();
    textFieldDisPercentTextController?.dispose();

    textFieldDeliverycharFocusNode?.dispose();
    textFieldDeliverycharTextController?.dispose();

    textFieldTEnderFocusNode?.dispose();
    textFieldTEnderTextController?.dispose();

    textFieldReturnFocusNode?.dispose();
    textFieldReturnTextController?.dispose();

    textFieldtaxFocusNode?.dispose();
    textFieldtaxTextController?.dispose();

    textFieldsearchFocusNode?.dispose();
    textFieldsearchTextController?.dispose();
  }
}
