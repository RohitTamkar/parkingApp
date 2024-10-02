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

Future<List<dynamic>> addToHoldListGrCalculationqty(
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
  List<dynamic> itemList = [];

  // Default unitId if none provided
  String? unitId = document?.unitId ?? 'HjExWViQAwNJCUiUPwBz';

  // Fetch unit record
  UnitTypeRecord? unitRecord = unitcollection.firstWhere(
    (element) => element.id == unitId,
  );

  double price = ratePrice;
  double quantity = qty.toDouble();

  // Calculate taxPer if taxAmt is provided
/*  if (taxAmt > 0) {
    taxPer = (inclusiveorexclusive.toLowerCase() == 'inclusive')
        ? (taxAmt * 100 / (price * quantity - taxAmt)).toInt()
        : (taxAmt * 100 / (price * quantity)).toInt();
  }*/

  // Calculate disPer if disAmt is provided
  /* if (disAmt > 0) {
    disPer = (disAmt * 100 / (price * quantity)).toInt();
  } else if (disPer > 0) {
    disAmt = (price * quantity * disPer) / 100.0;
  }*/
  if (disAmt > 0) {
    disAmt = (price * quantity * disPer) / 100.0;
  }

  // Calculate taxAmt for each item separately
  double taxAmtPerItem = (inclusiveorexclusive.toLowerCase() == 'inclusive')
      ? (price * taxPer) / (100.0 + taxPer)
      : (price * taxPer) / 100.0;

  // Calculate total tax amount based on quantity
  double totalTaxAmt = taxAmtPerItem * quantity;

  // Calculate total amount considering discounts and tax
  double total = (inclusiveorexclusive.toLowerCase() == 'exclusive')
      ? (price * quantity)
      : (price * quantity) + totalTaxAmt;

  // Deduct discount amount from total
  total -= disAmt;

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
    "taxAmt": totalTaxAmt,
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
