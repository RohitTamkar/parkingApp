// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

Future<List<dynamic>> ratePriceChangedFunctiongrocery(
  ProductStructStruct document,
  int billno,
  List<TaxMasterRecord> taxcollection,
  String inclusiveorexclusive,
  List<UnitTypeRecord> unitcollection,
  int disPer,
  double disAmt,
  double ratePrice,
  double qty,
  int taxPer,
  double taxAmt,
) async {
  List<dynamic> list = FFAppState().allBillsList;
  print(document);
  List<dynamic> itemList = [];

  String? unitId = document?.unitId ?? 'HjExWViQAwNJCUiUPwBz';

  UnitTypeRecord? unitRecord = unitcollection.firstWhere(
    (element) => element.id == unitId,
  );

  double price = ratePrice;
  double quantity = qty.toDouble();

  // Calculate discount amount if discount percentage is provided
  if (disPer > 0) {
    disAmt = (price * disPer * quantity) / 100.0;
  }

  // Calculate tax amount for each item separately
  double taxAmtPerItem = (inclusiveorexclusive.toLowerCase() == 'inclusive')
      ? (price * taxPer) / (100.0 + taxPer)
      : (price * taxPer) / 100.0;

  // Calculate total tax amount based on quantity
  double totalTaxAmt = taxAmtPerItem * quantity;

  // Calculate total amount considering discounts and tax
  double total = (inclusiveorexclusive.toLowerCase() == 'inclusive')
      ? (price * quantity)
      : (price * quantity) + totalTaxAmt;

  // Deduct discount amount from total
  total -= disAmt * quantity;

  // Add tax amount for exclusive tax
  if (inclusiveorexclusive.toLowerCase() == 'exclusive') {
    total += totalTaxAmt;
  }

  final data = {
    "name": document!.name,
    "price": price,
    "mrpPrice": (document.mrpPrice)!.toDouble(),
    "quantity": quantity,
    "unit": unitRecord?.unitType,
    "total": total,
    "id": document.id,
    "catId": document.categoryId,
    "taxId": document.taxId,
    "taxPer": taxPer,
    "taxAmt": double.parse(totalTaxAmt.toStringAsFixed(2)),
    "disPer": disPer,
    "disAmt": disAmt,
  };

  bool billExists = false;
  int billIndex = -1;

  // Iterate over existing bills
  for (int i = 0; i < list.length; i++) {
    if (list[i]["billno"] == billno) {
      billExists = true;
      billIndex = i;
      itemList = list[i]["details"]["itemList"];
      break;
    }
  }

  if (billExists) {
    bool itemExists = false;

    // Iterate over existing items in the bill
    for (int j = 0; j < itemList.length; j++) {
      if (itemList[j]["name"] == data["name"]) {
        itemExists = true;
        itemList[j]["taxPer"] = taxPer;
        itemList[j]["price"] = price;
        itemList[j]["quantity"] = quantity;
        itemList[j]["taxAmt"] = totalTaxAmt;
        itemList[j]["disPer"] = disPer;
        itemList[j]["disAmt"] = disAmt;

        if (inclusiveorexclusive.toLowerCase() == 'inclusive') {
          itemList[j]["total"] = (price * quantity) - disAmt;
        } else {
          itemList[j]["total"] = (price * quantity) + totalTaxAmt - disAmt;
        }

        list[billIndex]["details"]["itemList"] = itemList;
        break;
      }
    }

    if (!itemExists) {
      itemList.add(data);
      list[billIndex]["details"]["itemList"] = itemList;
    }
  } else {
    // Create a new bill if it doesn't exist
    list.add({
      "billno": billno,
      "details": {
        "itemList": [data],
      },
    });
  }

  FFAppState().allBillsList = list;
  print(FFAppState().allBillsList);
  return itemList;
}
