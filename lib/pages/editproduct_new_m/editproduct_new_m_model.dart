import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'editproduct_new_m_widget.dart' show EditproductNewMWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditproductNewMModel extends FlutterFlowModel<EditproductNewMWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldCode widget.
  FocusNode? textFieldCodeFocusNode;
  TextEditingController? textFieldCodeTextController;
  String? Function(BuildContext, String?)? textFieldCodeTextControllerValidator;
  // State field(s) for ProductDropDown widget.
  String? productDropDownValue;
  FormFieldController<String>? productDropDownValueController;
  // State field(s) for TextFieldSellingPrice widget.
  FocusNode? textFieldSellingPriceFocusNode;
  TextEditingController? textFieldSellingPriceTextController;
  String? Function(BuildContext, String?)?
      textFieldSellingPriceTextControllerValidator;
  // State field(s) for TextFieldMRPPrice widget.
  FocusNode? textFieldMRPPriceFocusNode;
  TextEditingController? textFieldMRPPriceTextController;
  String? Function(BuildContext, String?)?
      textFieldMRPPriceTextControllerValidator;
  // State field(s) for TextFieldPurchasePrice widget.
  FocusNode? textFieldPurchasePriceFocusNode;
  TextEditingController? textFieldPurchasePriceTextController;
  String? Function(BuildContext, String?)?
      textFieldPurchasePriceTextControllerValidator;
  // State field(s) for CatDropDown widget.
  String? catDropDownValue;
  FormFieldController<String>? catDropDownValueController;
  // State field(s) for TextFieldRegionalName widget.
  FocusNode? textFieldRegionalNameFocusNode;
  TextEditingController? textFieldRegionalNameTextController;
  String? Function(BuildContext, String?)?
      textFieldRegionalNameTextControllerValidator;
  // State field(s) for TextFieldRecorderLevel widget.
  FocusNode? textFieldRecorderLevelFocusNode;
  TextEditingController? textFieldRecorderLevelTextController;
  String? Function(BuildContext, String?)?
      textFieldRecorderLevelTextControllerValidator;
  // State field(s) for TextFieldDiscountPer widget.
  FocusNode? textFieldDiscountPerFocusNode;
  TextEditingController? textFieldDiscountPerTextController;
  String? Function(BuildContext, String?)?
      textFieldDiscountPerTextControllerValidator;
  // State field(s) for TextFieldDiscountAmt widget.
  FocusNode? textFieldDiscountAmtFocusNode;
  TextEditingController? textFieldDiscountAmtTextController;
  String? Function(BuildContext, String?)?
      textFieldDiscountAmtTextControllerValidator;
  // State field(s) for WightCheckbo widget.
  bool? wightCheckboValue;
  // State field(s) for StockCheckbox widget.
  bool? stockCheckboxValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for SubDropDown widget.
  String? subDropDownValue;
  FormFieldController<String>? subDropDownValueController;
  // State field(s) for ServiceDropDown widget.
  String? serviceDropDownValue;
  FormFieldController<String>? serviceDropDownValueController;
  // State field(s) for UnitDropDown widget.
  String? unitDropDownValue;
  FormFieldController<String>? unitDropDownValueController;
  // State field(s) for TaxDropDown widget.
  String? taxDropDownValue;
  FormFieldController<String>? taxDropDownValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  var barcode = '';
  // Stores action output result for [Custom Action - barcodeRandomGenerated] action in Container widget.
  String? barcode2;
  // State field(s) for TextFieldBarcode widget.
  FocusNode? textFieldBarcodeFocusNode;
  TextEditingController? textFieldBarcodeTextController;
  String? Function(BuildContext, String?)?
      textFieldBarcodeTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldCodeFocusNode?.dispose();
    textFieldCodeTextController?.dispose();

    textFieldSellingPriceFocusNode?.dispose();
    textFieldSellingPriceTextController?.dispose();

    textFieldMRPPriceFocusNode?.dispose();
    textFieldMRPPriceTextController?.dispose();

    textFieldPurchasePriceFocusNode?.dispose();
    textFieldPurchasePriceTextController?.dispose();

    textFieldRegionalNameFocusNode?.dispose();
    textFieldRegionalNameTextController?.dispose();

    textFieldRecorderLevelFocusNode?.dispose();
    textFieldRecorderLevelTextController?.dispose();

    textFieldDiscountPerFocusNode?.dispose();
    textFieldDiscountPerTextController?.dispose();

    textFieldDiscountAmtFocusNode?.dispose();
    textFieldDiscountAmtTextController?.dispose();

    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    textFieldBarcodeFocusNode?.dispose();
    textFieldBarcodeTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController10?.dispose();
  }
}
