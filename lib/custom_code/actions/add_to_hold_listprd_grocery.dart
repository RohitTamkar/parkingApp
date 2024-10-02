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

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

Future<List<dynamic>> addToHoldListprdGrocery(
  ProductStructStruct document,
  int billno,
  List<TaxMasterRecord> taxcollection,
  String inclusiveorexclusive,
  List<UnitTypeRecord> unitcollection,
) async {
  List<dynamic> list = FFAppState().allBillsList;
  print(document);
  List<dynamic> itemList = [];
  var y = 1.0;

  String? taxId = '';
  if (document?.taxId == null) {
    taxId = 'QPIz6c63YKBYVKT80oPv';
  } else {
    taxId = document?.taxId;
  }
  TaxMasterRecord? taxRecord = taxcollection.firstWhere(
    (element) => element.id == taxId,
    orElse: null,
  );

  String? unitId = '';
  if (document?.unitId == null) {
    unitId = 'HjExWViQAwNJCUiUPwBz';
  } else {
    unitId = document?.unitId;
  }
  UnitTypeRecord? unitRecord = unitcollection.firstWhere(
    (element) => element.id == unitId,
    orElse: null,
  );
  int disPer = document.discountPer.toInt();
  double disAmt = document.discountAmt;

  if (disAmt > 0) {
    disPer = (disAmt * 100 / document.sellingPrice).toInt();
  } else if (disPer > 0) {
    disAmt = (document.sellingPrice * disPer) / 100.0;
  }
  if (taxRecord != null) {
    double taxPer = taxRecord.percentage ?? 0.0;
    double price = document!.sellingPrice;
    double quantity = y.toDouble();

    // Calculate taxAmt for each item separately
    double taxAmtPerItem = (inclusiveorexclusive.toLowerCase() == 'inclusive')
        ? (price * taxPer) / (100.0 + taxPer)
        : (price * taxPer) / 100.0;

    double taxAmt = taxAmtPerItem * quantity;

    double total = (inclusiveorexclusive.toLowerCase() == 'exclusive')
        ? (price * quantity)
        : (price * quantity) + double.parse(taxAmt.toStringAsFixed(2));

    // Deduct discount amount from total
    total -= disAmt * quantity;

    // Add tax amount for exclusive tax
    if (inclusiveorexclusive.toLowerCase() == 'exclusive') {
      total += taxAmt;
    }

    int srNo = 1;
    if (list.isNotEmpty) {
      for (var bill in list) {
        if (bill["billno"] == billno) {
          if (bill["details"]["itemList"].isNotEmpty) {
            itemList = bill["details"]["itemList"];
            srNo = itemList.length + 1;
            break;
          }
        }
      }
    }

    final data = {
      "srno": srNo,
      "name": document!.name,
      "price": (document.sellingPrice)!.toDouble(),
      "mrpPrice": (document.mrpPrice)!.toDouble(),
      "quantity": quantity,
      "unit": unitRecord.unitType, //kg,pcs,doz
      "unitId": unitRecord.id,
      "total": total, // Include taxAmt for exclusive tax
      "id": document!.id,
      "catId": document!.categoryId,
      "taxId": document!.taxId,
      "taxPer": taxPer,
      "taxAmt": double.parse(taxAmt.toStringAsFixed(2)),
      "disPer": disPer,
      "disAmt": disAmt,
    };

    var index;
    var flag = false;
    var flag1 = false;

    if (list.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        if (list[i]["billno"] == billno) {
          if (list[i]["details"]["itemList"].length > 0) {
            itemList = (list[i]["details"]["itemList"]);
            index = i;
            flag1 = true;
            break;
          } else {
            itemList.add(data);
            list[i]["details"]["itemList"] = itemList;

            FFAppState().allBillsList = list;
            break;
          }
        }
      }

      if (flag1) {
        for (int j = 0; j < itemList.length; j++) {
          if (itemList[j]["name"] == data["name"]) {
            /*  itemList[j]["quantity"]++;
            itemList[j]["disAmt"] = disAmt*itemList[j]["quantity"];
            itemList[j]["taxAmt"] +=
                taxAmtPerItem; // Update taxAmt for each item
            if (inclusiveorexclusive.toLowerCase() == 'inclusive') {
              itemList[j]["total"] = itemList[j]["quantity"] *
                  itemList[j]["price"]; // Update total for each item
            } else {
              itemList[j]["total"] =
                  itemList[j]["quantity"] * itemList[j]["price"];
            }*/
            list[index]["details"]["itemList"] = itemList;
            FFAppState().allBillsList = list;
            flag = true;
            break;
          }
        }

        if (!flag) {
          data["srno"] = itemList.length + 1;
          itemList.add(data);
          list[index]["details"]["itemList"] = itemList;
          FFAppState().allBillsList = list;
        }
      }
    }
  }

  print(FFAppState().allBillsList);
  return itemList;
}
