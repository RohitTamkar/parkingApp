// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import '../../flutter_flow/flutter_flow_drop_down.dart';
import '../../flutter_flow/form_field_controller.dart';
import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:flutter/scheduler.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:google_fonts/google_fonts.dart';
import '/flutter_flow/custom_functions.dart' as functions;
// Imports other custom widgets
import '/flutter_flow/custom_functions.dart' as functions;
import '../actions/setup_item_hive.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:flutter/scheduler.dart';

class SearchHiveprdGrocery extends StatefulWidget {
  const SearchHiveprdGrocery({
    Key? key,
    this.width,
    this.height,
    required this.document,
    required this.billno,
    required this.billnum,
    required this.disAmt,
    required this.delChargs,
    required this.taxcollection,
    required this.appSettingsRecord,
    required this.unitcollection,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<ProductStructStruct> document;
  final int billno;
  final String billnum;
  final double disAmt;
  final double delChargs;
  final List<TaxMasterRecord> taxcollection;
  final AppSettingsRecord appSettingsRecord;
  final List<UnitTypeRecord> unitcollection;

  @override
  _SearchHiveprdGroceryState createState() => _SearchHiveprdGroceryState();
}

class _SearchHiveprdGroceryState extends State<SearchHiveprdGrocery> {
  TextEditingController _productNameController = TextEditingController();

  late LoadingScreenNewModel _model;
  FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    _model = createModel(context, () => LoadingScreenNewModel());
  }

  LoadingScreenNewModel createModel(
      BuildContext context, LoadingScreenNewModel Function() modelBuilder) {
    return modelBuilder();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: TypeAheadField<ProductStructStruct>(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _productNameController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search for a product...',
                ),
                onSubmitted: (value) async {
                  print('Submitted value: $value');
                  List<ProductStructStruct> matchingProducts = widget.document
                      .where((product) => product.barcode == value)
                      .toList();

                  if (matchingProducts.isNotEmpty) {
                    ProductStructStruct selectedProduct =
                        matchingProducts.first;
                    FFAppState().productHiveput = selectedProduct;
                    if (FFAppState().holdBillCount == 0) {
                      FFAppState().holdBillCount =
                          FFAppState().holdBillCount + 1;
                      FFAppState().addToAllBillsList(
                          functions.generateBillDetailsJson(
                              0.0,
                              0.0,
                              0.0,
                              'CASH',
                              0.0,
                              0.0,
                              FFAppState().billAmt,
                              0.0,
                              FFAppState().finalAmt,
                              '0',
                              FFAppState().itemCartList.toList(),
                              FFAppState().holdBillCount));
                      FFAppState().selBill = 1;
                    }
                    _model.addtosavebill =
                        await actions.addToHoldListprdGrocery(
                      FFAppState().productHiveput,
                      FFAppState().selBill,
                      widget.taxcollection,
                      functions.enabletaxinclusive(
                          widget.appSettingsRecord.inclusiveTax),
                      widget.unitcollection,
                    );
                    _model.calculateResult =
                        await actions.calSubTotalForGrocery(
                      FFAppState().selBill.toString(),
                      FFAppState().allBillsList!,
                    );
                    _model.calbillAmt = await actions.calBillAmtGrocery(
                      FFAppState().disAmt,
                      FFAppState().delCharges,
                    );

                    _model.submitForm();
                    _productNameController.clear();
                    await Future.delayed(Duration(milliseconds: 100));
                    FocusScope.of(context).requestFocus(_focusNode);
                    FFAppState().update(() {});

                    setState(() {});
                  }
                },
              ),
              suggestionsCallback: (pattern) {
                return widget.document.where((product) =>
                    product.name.toLowerCase().contains(pattern.toLowerCase()));
              },
              itemBuilder: (context, ProductStructStruct product) {
                return ListTile(
                  title: Text(product.name),
                  subtitle:
                      Text('\₹${product.sellingPrice.toStringAsFixed(2)}'),
                );
              },
              onSuggestionSelected: (ProductStructStruct document) async {
                _productNameController.clear();
                if (FFAppState().holdBillCount == 0) {
                  FFAppState().holdBillCount = FFAppState().holdBillCount + 1;
                  FFAppState().addToAllBillsList(
                      functions.generateBillDetailsJson(
                          0.0,
                          0.0,
                          0.0,
                          'CASH',
                          0.0,
                          0.0,
                          FFAppState().billAmt,
                          0.0,
                          FFAppState().finalAmt,
                          '0',
                          FFAppState().itemCartList.toList(),
                          FFAppState().holdBillCount));
                  FFAppState().selBill = 1;
                }
                _model.addtosavebill = await actions.addToHoldListprdGrocery(
                    document,
                    FFAppState().selBill,
                    widget.taxcollection!.toList(),
                    functions.enabletaxinclusive(
                        widget.appSettingsRecord.inclusiveTax),
                    widget.unitcollection!.toList());
                _model.calculateResult = await actions.calSubTotalForGrocery(
                  FFAppState().selBill.toString(),
                  FFAppState().allBillsList!.toList(),
                );

                _model.calbillAmt = await actions.calBillAmtGrocery(
                  FFAppState().disAmt,
                  FFAppState().delCharges,
                );

                FFAppState().update(() {});

                setState(() {});
                /* await _model.listViewprd?.animateTo(
                  _model.listViewprd!.position.maxScrollExtent,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.ease,


                );*/
              },
            ),
          ),
        )
      ],
    );
  }
}

class LoadingScreenNewModel {
  List<ProductStructStruct> productHive = [];
  void addToProductHive(ProductStructStruct item) => productHive.add(item);
  void initState(BuildContext context) {}
  final unfocusNode = FocusNode();
  List<ProductStructStruct>? hiveProductList;

  List<dynamic>? addtosavebill;

  double? calculateResult;

  double? calbillAmt;

  ProductStructStruct? getproductForupdate;

  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;

  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  ScrollController? listViewprd;
  void submitForm() async {
    print('Form submitted!');
  }
}
