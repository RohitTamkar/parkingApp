import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'addproduct_a_p_p_widget.dart' show AddproductAPPWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddproductAPPModel extends FlutterFlowModel<AddproductAPPWidget> {
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
  // State field(s) for DropDownSubCategory widget.
  String? dropDownSubCategoryValue;
  FormFieldController<String>? dropDownSubCategoryValueController;
  // State field(s) for DropDownServicePoint widget.
  String? dropDownServicePointValue;
  FormFieldController<String>? dropDownServicePointValueController;
  // State field(s) for DropDownUnitType widget.
  String? dropDownUnitTypeValue;
  FormFieldController<String>? dropDownUnitTypeValueController;
  // State field(s) for DropDownTax widget.
  String? dropDownTaxValue;
  FormFieldController<String>? dropDownTaxValueController;
  var barcode = '';
  // Stores action output result for [Custom Action - barcodeRandomGenerated] action in Container widget.
  String? barcode1;
  // State field(s) for TextFieldHSNCode widget.
  FocusNode? textFieldHSNCodeFocusNode;
  TextEditingController? textFieldHSNCodeTextController;
  String? Function(BuildContext, String?)?
      textFieldHSNCodeTextControllerValidator;
  // Stores action output result for [Custom Action - checkDupProduct] action in Button widget.
  bool? notSame;
  // Stores action output result for [Custom Action - productDetails] action in Button widget.
  dynamic? jsonData;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ProductMasterRecord? productDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SubCategoryRecord? subDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TaxMasterRecord? taxDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UnitTypeRecord? unitDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ServicePointOutletRecord? serviceDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CategoryRecord? catDoc;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProductRecord? proDoc;

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

    textFieldHSNCodeFocusNode?.dispose();
    textFieldHSNCodeTextController?.dispose();
  }
}
