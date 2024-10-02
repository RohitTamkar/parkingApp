import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'product_and_list_new_copy_widget.dart' show ProductAndListNewCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class ProductAndListNewCopyModel
    extends FlutterFlowModel<ProductAndListNewCopyWidget> {
  ///  Local state fields for this page.

  List<CategoryStructStruct> categoryHive = [];
  void addToCategoryHive(CategoryStructStruct item) => categoryHive.add(item);
  void removeFromCategoryHive(CategoryStructStruct item) =>
      categoryHive.remove(item);
  void removeAtIndexFromCategoryHive(int index) => categoryHive.removeAt(index);
  void insertAtIndexInCategoryHive(int index, CategoryStructStruct item) =>
      categoryHive.insert(index, item);
  void updateCategoryHiveAtIndex(
          int index, Function(CategoryStructStruct) updateFn) =>
      categoryHive[index] = updateFn(categoryHive[index]);

  List<ProductStructStruct> productHive = [];
  void addToProductHive(ProductStructStruct item) => productHive.add(item);
  void removeFromProductHive(ProductStructStruct item) =>
      productHive.remove(item);
  void removeAtIndexFromProductHive(int index) => productHive.removeAt(index);
  void insertAtIndexInProductHive(int index, ProductStructStruct item) =>
      productHive.insert(index, item);
  void updateProductHiveAtIndex(
          int index, Function(ProductStructStruct) updateFn) =>
      productHive[index] = updateFn(productHive[index]);

  List<TaxMasterRecord> taxcollection = [];
  void addToTaxcollection(TaxMasterRecord item) => taxcollection.add(item);
  void removeFromTaxcollection(TaxMasterRecord item) =>
      taxcollection.remove(item);
  void removeAtIndexFromTaxcollection(int index) =>
      taxcollection.removeAt(index);
  void insertAtIndexInTaxcollection(int index, TaxMasterRecord item) =>
      taxcollection.insert(index, item);
  void updateTaxcollectionAtIndex(
          int index, Function(TaxMasterRecord) updateFn) =>
      taxcollection[index] = updateFn(taxcollection[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getProductlistHive] action in ProductAndListNewCopy widget.
  List<ProductStructStruct>? hiveProductList;
  // Stores action output result for [Custom Action - getCategorylistHive] action in ProductAndListNewCopy widget.
  List<CategoryStructStruct>? categoryListHive;
  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel;
  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in Container widget.
  double? res11;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // State field(s) for GridView widget.
  ScrollController? gridViewController;
  // Stores action output result for [Custom Action - addToHoldListprdCopy] action in ProductName widget.
  List<dynamic>? addtosavebill;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in ProductName widget.
  double? calculateResult;
  // Stores action output result for [Custom Action - calBillAmt] action in ProductName widget.
  double? calbillAmt;
  // Stores action output result for [Custom Action - hiveGetProduct] action in ProductName widget.
  ProductStructStruct? getproductForupdate;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for ListViewprd widget.
  ScrollController? listViewprd;
  // Stores action output result for [Custom Action - addToHoldListprdminus] action in Minus widget.
  List<dynamic>? resultminus;
  // Stores action output result for [Custom Action - calSubTotalForHoldListminus] action in Minus widget.
  double? resultmi;
  // Stores action output result for [Custom Action - calBillAmt] action in Minus widget.
  double? reu34;
  // Stores action output result for [Custom Action - addToHoldListprdplus] action in Plus widget.
  List<dynamic>? resultplus;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in Plus widget.
  double? res13;
  // Stores action output result for [Custom Action - calBillAmt] action in Plus widget.
  double? reuslt12;
  // Stores action output result for [Custom Action - removeHoldListItem] action in Icon widget.
  List<dynamic>? res20;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in Icon widget.
  double? res21;
  // Stores action output result for [Custom Action - calBillAmt] action in Icon widget.
  double? reuslt22;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - filterProducts2] action in Button widget.
  List<SelItemListStruct>? prdlistsavebill;
  // Stores action output result for [Custom Action - addInvoiceBillhive] action in Button widget.
  InvoiceStructStruct? hiveInvoiceDataCopyCopy;
  // Stores action output result for [Custom Action - calShiftSummaryNew] action in Button widget.
  dynamic? shiftSummarResultsNew2;
  // Stores action output result for [Custom Action - shiftIdtoInt] action in Button widget.
  int? shiftidhive2;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in Button widget.
  ShiftDetailsStruct? getOfflineShiftdetails;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in Button widget.
  ShiftDetailsStruct? updatedShift;
  // Stores action output result for [Custom Action - filterProducts2] action in Button widget.
  List<SelItemListStruct>? prdlinstnewtx;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AppSettingsRecord? appsettingnew;
  // Stores action output result for [Custom Action - addInvoiceBillhive] action in Button widget.
  InvoiceStructStruct? hiveInvoiceData;
  // Stores action output result for [Custom Action - calShiftSummaryNew] action in Button widget.
  dynamic? shiftSummarResultsNew;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in Button widget.
  ShiftDetailsStruct? updatedShiftDetails;
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
  List<PartyRecord> simpleSearchResults = [];
  // State field(s) for CustListView widget.
  ScrollController? custListView;
  // State field(s) for SearchListView widget.
  ScrollController? searchListView;

  @override
  void initState(BuildContext context) {
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
    gridViewController = ScrollController();
    listViewprd = ScrollController();
    custListView = ScrollController();
    searchListView = ScrollController();
  }

  @override
  void dispose() {
    menuDrawerModel.dispose();
    searchFocusNode?.dispose();
    searchTextController?.dispose();

    listViewController1?.dispose();
    listViewController2?.dispose();
    gridViewController?.dispose();
    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();

    listViewprd?.dispose();
    textFieldsearchFocusNode?.dispose();
    textFieldsearchTextController?.dispose();

    custListView?.dispose();
    searchListView?.dispose();
  }
}
