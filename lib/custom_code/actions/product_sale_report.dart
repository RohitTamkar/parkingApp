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

Future<List<dynamic>> productSaleReport(
  String dayId,
  String outletId,
) async {
  List<dynamic> docObj = [];
  List<dynamic> prd = [];
  List<dynamic> finalList = [];
  List<dynamic> catIds = [];
  List<dynamic> distinctCatID = [];
  List<dynamic> lastFinalList = [];
  double allProductTotal = 0.0;
  double allCatTotal = 0.0;
  List<dynamic> otherDetails = [];
  double totalSale = 0.0;
  int totalBill = 0;
  double totalDis = 0.0, totalDelChg = 0.0, totalDisPer = 0.0, totalTax = 0.0;
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('OUTLET')
      .doc(outletId)
      .collection('INVOICE')
      .where('dayId', isEqualTo: dayId)
      .get()
      .then((value) => value);
  if (querySnapshot.size == 0) {
    print('No matching documents.');
  } else {
    //int len = querySnapshot.docs.length;
    int count = 0;
    for (int x = 0; x < querySnapshot.docs.length; x++) {
      totalSale += querySnapshot.docs[x]["finalBillAmt"];
      totalDisPer += querySnapshot.docs[x]["discountPer"];
      totalBill += 1;
      totalDelChg += querySnapshot.docs[x]["delliveryChrg"];
      totalDis += querySnapshot.docs[x]["discountAmt"];
      totalTax += querySnapshot.docs[x]["taxAmt"];
      int prdLen = querySnapshot.docs[x]["productList"].length;
      for (int i = 0; i < prdLen; i++) {
        List<dynamic> tempPrd = querySnapshot.docs[x]["productList"];
        docObj.add({
          "id": tempPrd[i]["id"],
          "quantity": tempPrd[i]["quantity"],
          "name": tempPrd[i]["name"],
          "price": tempPrd[i]["price"],
          "total": tempPrd[i]["total"],
          "catId": tempPrd[i]["catId"]
        });
        allProductTotal = allProductTotal + tempPrd[i]["total"];
      }
    }
    docObj.forEach((item) {
      //group same items in prd list
      if (prd.length == 0) {
        prd.add(item);
      } else {
        int index = prd.indexWhere((element) => element["id"] == item["id"]);
        if (index == -1) {
          prd.add(item);
        } else {
          prd[index]["quantity"] = prd[index]["quantity"] + item["quantity"];
          prd[index]["price"] = item["price"];
          prd[index]["total"] = prd[index]["total"] + item["total"];
        }
      }
    });

    //add all the category id's to catId list
    prd.forEach((element) {
      catIds.add(element["catId"]);
    });
    //add distinct Cat Id to list
    distinctCatID = catIds.toSet().toList();
    print(distinctCatID);
    var countNext = 0;
    List<dynamic> categoryList = [];

    for (int i = 0; i < distinctCatID.length; i++) {
      QuerySnapshot querySnapshot1 = await FirebaseFirestore.instance
          .collection('OUTLET')
          .doc(outletId)
          .collection('CATEGORY')
          .where('id', isEqualTo: distinctCatID[i])
          .get()
          .then((value) => value);
      if (querySnapshot1.size == 0) {
        countNext++;

        print('No matching documents.');
      } else {
        querySnapshot1.docs.forEach((doc) {
          countNext++;

          categoryList.add({
            "catId": doc.id,
            "catName": doc["name"],
            "catTotal": 0,
            "quantity": "--"
          });
        });
      }

      if (countNext == distinctCatID.length) {
        for (i = 0; i < categoryList.length; i++) {
          var temp1 = [];
          prd.forEach((element) {
            if (categoryList[i]["catId"] == element["catId"]) {
              categoryList[i]["catTotal"] =
                  categoryList[i]["catTotal"] + element["total"];
              temp1.add(element);
              allCatTotal += categoryList[i]["catTotal"];
            }
          });
          finalList.add({"category": categoryList[i], "products": temp1});
        }
      }
    }
  }
  lastFinalList.add({
    "allProducts": prd,
    "details": finalList,
    "dayId": dayId,
    "allProductTotal": allProductTotal,
    "allCatTotal": allCatTotal,
    "otherDetails": {
      "totalSale": totalSale,
      "totalDisPer": totalDisPer,
      "totalBill": totalBill,
      "totalDelChg": totalDelChg,
      "totalDis": totalDis,
      "totalTax": totalTax
    }
  });
  print(lastFinalList);
  return lastFinalList;
}
