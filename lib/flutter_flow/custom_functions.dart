import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<dynamic> shiftDocToJsonList2(ShiftDetailsStruct item) {
  List<dynamic> list = [];
  List<dynamic> list2 = [];
  list.add({
    "credRec": 0.0,
    "delivery": 0.0,
    "discount": 0.0,
    "refund": 0.0,
    "roundOff": 0.0,
    "expenses": 0.0,
    "advance": 0.0,
    "recAmount": 0.0,
    "upi": 0.0,
    "cashInHand": 0.0,
    "totalSale": 0.0,
    "openingBalance": 0.0,
    "noOfBills": 0,
    "tax": 0.0,
    "shiftId": 0.0,
    "noOfBills": "",
    "shiftTimeIn": 0.0,
    "shiftTimeOut": 0.0,
    "cash": 0.0,
    "card": 0.0,
    "cheque": 0.0,
    "credit": 0.0,
    "paytm": 0.0,
    "phonepe": 0.0,
    "googlepay": 0.0,
    "other": 0.0,
  });

  list[0]["shiftId"] = item.shiftId;
  list[0]["noOfBills"] = item.billCount;
  list[0]["shiftTimeIn"] = item.startTime;
  list[0]["shiftTimeOut"] = item.endTime;
  list[0]["discount"] = item.discount;
  list[0]["delivery"] = item.deliveryCharges;
  list[0]["roundOff"] = item.roundOff;
  list[0]["refund"] = item.refoundAmount;
  list[0]["expenses"] = item.expensesAmtTotal;
  list[0]["advance"] = item.advanceAmtTotal;
  list[0]["recAmount"] = item.receiveAmtTotal;
  list[0]["totalSale"] = item.totalSale;
  list[0]["openingBalance"] = item.openingAmt;
  list[0]["tax"] = item.tax;
  list[0]["cashInHand"] = item.cashSale;

  final paymentJsonData = jsonDecode(item.paymentJson!);
  list[0]["cash"] = paymentJsonData["cash"].toDouble();
  list[0]["credit"] = paymentJsonData["credit"].toDouble();
  list[0]["googlePay"] = paymentJsonData["googlepay"].toDouble();
  list[0]["paytm"] = paymentJsonData["paytm"].toDouble();
  list[0]["phonePe"] = paymentJsonData["phonepe"].toDouble();
  list[0]["cheque"] = paymentJsonData["cheque"].toDouble();
  list[0]["other"] = paymentJsonData["other"].toDouble();
  list[0]["card"] = paymentJsonData["card"].toDouble();
  list[0]["digital"] = paymentJsonData["digital"].toDouble();

  return list;
}

List<dynamic> loadDefaultList(
  int billno,
  List<dynamic> allBillList,
  String id,
) {
  List<dynamic> itemList = [];
  print(id);
  if (allBillList.isNotEmpty) {
    for (int i = 0; i < allBillList.length; i++) {
      print(allBillList[i]["billno"]);
      if (allBillList[i]["billno"] == billno) {
        if (allBillList[i]["details"]["itemList"].length > 0) {
          List testList = allBillList[i]["details"]["itemList"];
          testList.forEach((item) {
            // int index = ite
            if (item["id"] == id) {
              itemList = (allBillList[i]["details"]["itemList"]);
            }
          });
        }
      }
    }
  }
  return itemList;
}

int getShiftIdInt(int? shiftCount) {
  var day, month;

  DateTime date = DateTime.now();
  day = date.day.toString();
  month = date.month.toString();
  var invNum = int.parse(date.year.toString() +
      (month.length < 2 ? "0" + month : month).toString() +
      (day.length < 2 ? "0" + day : day).toString() +
      (shiftCount != null ? shiftCount.toString() : ""));

  print(invNum);
  return invNum;
  // Add your function code here!
}

List<dynamic> shiftDocToJsonListCopy(List<ShiftRecord> doc) {
  List<dynamic> list = [];
  list.add(doc);
  return list;
}

double calUPICopy(String paymentjson) {
  // Add your function code here!

  double totalUPICount = 0;

  // Parse the JSON-like string into a map
  Map<String, dynamic> paymentMap = {};
  try {
    paymentMap = jsonDecode(paymentjson);
  } catch (e) {
    print("Error decoding JSON: $e");
    return 0; // Return 0 in case of an error
  }

  // Extract the UPI payment count and add it to the total
  if (paymentMap.containsKey("googlepay")) {
    totalUPICount += (paymentMap["googlepay"] ?? 0).toDouble();
  }
  if (paymentMap.containsKey("phonepe")) {
    totalUPICount += (paymentMap["phonepe"] ?? 0).toDouble();
  }
  if (paymentMap.containsKey("paytm")) {
    totalUPICount += (paymentMap["paytm"] ?? 0).toDouble();
  }

  return totalUPICount;
}

int getLastMonth(String? index) {
  // Add your function code here!
  DateTime currentDate = DateTime.now();
  DateTime firstDay, lastDay;
  int lastMonth;
  lastMonth = currentDate.month - 1;
  firstDay = DateTime.utc(currentDate.year, lastMonth, 1);
  lastDay = DateTime.utc(
    currentDate.year,
    lastMonth + 1,
  ).subtract(Duration(days: 1));

  int firstDayInMili = firstDay.millisecondsSinceEpoch;
  int lastDayInMili = lastDay.millisecondsSinceEpoch;
  print("first" + firstDayInMili.toString());
  print("last" + lastDayInMili.toString());

  if (index == "start") {
    return firstDayInMili;
  } else {
    return lastDayInMili;
  }
}

double? calculateParkingCharges2(
  String? vehicleType,
  int? checkInTimeMillisecond,
  int? checkOutTimeMillisecond,
  VehicleBillStruct parkingPlans,
) {
  if (vehicleType == null ||
      checkInTimeMillisecond == null ||
      checkOutTimeMillisecond == null) {
    print('Invalid inputs provided');
    return null;
  }

  final plan = parkingPlans;
  if (plan == null) {
    print('Vehicle type not supported');
    return null;
  }

  // Extract plan details
  final baseRate = plan.baseRate;
  final baseDuration = plan.baseDuration;
  final hourlyRate = plan.hourlyRate;
  final freeMinutes = plan.freeMinutes;

  // Calculate duration in minutes
  final durationInMinutes =
      ((checkOutTimeMillisecond - checkInTimeMillisecond) / (1000 * 60))
          .toDouble();
  print('Duration in minutes: $durationInMinutes');

  // Skip charges for free minutes
  if (durationInMinutes <= freeMinutes) {
    return 0.0; // No charges within free time
  }

  // Calculate parking charges
  final durationInHours = (durationInMinutes - freeMinutes) / 60;
  double parkingCharges;
  if (durationInHours <= baseDuration) {
    parkingCharges = baseRate;
  } else {
    parkingCharges =
        baseRate + ((durationInHours - baseDuration).ceil() * hourlyRate);
  }

  print('Parking charges: $parkingCharges');
  return parkingCharges;
}

double getTotal(
  double? qty,
  double? price,
) {
  double total = qty! * price!;
  // double sub = FFAppState().subTotal;
  // FFAppState().subTotal = sub + total;
  // Add your function code here!
  return (qty * price).toDouble();
}

double? calculateParkingChargesHourly(
  String? vehicleType,
  int? checkInTimeMillisecond,
  int? checkoutTimeMillisecond,
) {
  // Calculate the duration of parking in hours
  double? durationInMinutes;
  if (checkInTimeMillisecond != null && checkoutTimeMillisecond != null) {
    durationInMinutes =
        ((checkoutTimeMillisecond - checkInTimeMillisecond) / (1000 * 60))
            .toDouble();
    print('Duration in minutes: $durationInMinutes');
  }

  // Initialize parking charges
  double? parkingCharges = 0;

  // Skip charges for the first 15 minutes
  if (durationInMinutes != null && durationInMinutes <= 15) {
    return parkingCharges; // No charges for the first 15 minutes
  }

  // If parking duration exceeds 15 minutes
  if (vehicleType != null && durationInMinutes != null) {
    // Convert remaining minutes (after free 15 minutes) to hours
    double durationInHours = (durationInMinutes - 15) / 60;

    switch (vehicleType.toUpperCase()) {
      case 'TWO WHEELER':
        if (durationInHours <= 2) {
          // Charge ₹30 for the first 2 hours
          parkingCharges = 30;
        } else {
          // Charge ₹30 for the first 2 hours and ₹20 for each additional hour
          parkingCharges = 30 + ((durationInHours - 2).ceil() * 20);
        }
        break;

      case 'FOUR WHEELER':
        if (durationInHours <= 2) {
          // Charge ₹50 for the first 2 hours
          parkingCharges = 50;
        } else {
          // Charge ₹50 for the first 2 hours and ₹25 for each additional hour
          parkingCharges = 50 + ((durationInHours - 2).ceil() * 25);
        }
        break;

      case 'VENDOR':
        if (durationInHours <= 2) {
          // Charge ₹40 for the first 2 hours
          parkingCharges = 40;
        } else {
          // Charge ₹40 for the first 2 hours and ₹40 for each additional hour
          parkingCharges = 40 + ((durationInHours - 2).ceil() * 40);
        }
        break;

      case 'BUS':
        if (durationInHours <= 2) {
          // Charge ₹180 for the first 2 hours
          parkingCharges = 180;
        } else {
          // Charge ₹180 for the first 2 hours and ₹180 for each additional hour
          parkingCharges = 180 + ((durationInHours - 2).ceil() * 180);
        }
        break;

      // Additional cases for other vehicle types can be added here
      default:
        print('Vehicle type not supported for specific pricing rules');
        return null; // Invalid or unsupported vehicle type
    }
  }

  print('Parking charges: $parkingCharges');
  return parkingCharges;
}

double? calculateParkingChargesPerHourly(
  String? vehicleType,
  int? checkInTimeMillisecond,
  int? checkoutTimeMillisecond,
) {
  // Calculate the duration of parking in hours
  double? durationInMinutes;
  if (checkInTimeMillisecond != null && checkoutTimeMillisecond != null) {
    durationInMinutes =
        ((checkoutTimeMillisecond - checkInTimeMillisecond) / (1000 * 60))
            .toDouble();
    print('Duration in minutes: $durationInMinutes');
  }

  // Initialize parking charges
  double? parkingCharges = 0;

  // Skip charges for the first 15 minutes
  if (durationInMinutes != null && durationInMinutes <= 5) {
    return parkingCharges; // No charges for the first 15 minutes
  }

  // If parking duration exceeds 15 minutes
  if (vehicleType != null && durationInMinutes != null) {
    // Convert remaining minutes (after free 15 minutes) to hours
    double durationInHours = (durationInMinutes - 5) / 60;

    switch (vehicleType.toUpperCase()) {
      case 'TWO WHEELER':
        if (durationInHours <= 2) {
          // Charge ₹30 for the first 2 hours
          parkingCharges = 10;
        } else {
          // Charge ₹30 for the first 2 hours and ₹20 for each additional hour
          parkingCharges = 10 + ((durationInHours - 2).ceil() * 10);
        }
        break;

      case 'FOUR WHEELER':
        if (durationInHours <= 2) {
          // Charge ₹50 for the first 2 hours
          parkingCharges = 30;
        } else {
          // Charge ₹50 for the first 2 hours and ₹25 for each additional hour
          parkingCharges = 30 + ((durationInHours - 2).ceil() * 30);
        }
        break;

      case 'THREE WHEELER':
        if (durationInHours <= 2) {
          // Charge ₹40 for the first 2 hours
          parkingCharges = 20;
        } else {
          // Charge ₹40 for the first 2 hours and ₹40 for each additional hour
          parkingCharges = 20 + ((durationInHours - 2).ceil() * 20);
        }
        break;

      case 'BUS':
        if (durationInHours <= 2) {
          // Charge ₹180 for the first 2 hours
          parkingCharges = 50;
        } else {
          // Charge ₹180 for the first 2 hours and ₹180 for each additional hour
          parkingCharges = 50 + ((durationInHours - 2).ceil() * 50);
        }
        break;

      case 'TRUCK':
        if (durationInHours <= 2) {
          // Charge ₹180 for the first 2 hours
          parkingCharges = 50;
        } else {
          // Charge ₹180 for the first 2 hours and ₹180 for each additional hour
          parkingCharges = 50 + ((durationInHours - 2).ceil() * 50);
        }
        break;

      case 'SUMO':
        if (durationInHours <= 2) {
          // Charge ₹180 for the first 2 hours
          parkingCharges = 100;
        } else {
          // Charge ₹180 for the first 2 hours and ₹180 for each additional hour
          parkingCharges = 100 + ((durationInHours - 2).ceil() * 100);
        }
        break;

      case 'TRAVELLER':
        if (durationInHours <= 2) {
          // Charge ₹180 for the first 2 hours
          parkingCharges = 200;
        } else {
          // Charge ₹180 for the first 2 hours and ₹180 for each additional hour
          parkingCharges = 200 + ((durationInHours - 2).ceil() * 200);
        }
        break;

      // Additional cases for other vehicle types can be added here
      default:
        print('Vehicle type not supported for specific pricing rules');
        return null; // Invalid or unsupported vehicle type
    }
  }

  print('Parking charges: $parkingCharges');
  return parkingCharges;
}

double? calculateParkingChargesPerHourly1(
  String? vehicleType,
  int? checkInTimeMillisecond,
  int? checkoutTimeMillisecond,
) {
// Calculate the duration of parking in hours
  double? durationInMinutes;
  if (checkInTimeMillisecond != null && checkoutTimeMillisecond != null) {
    durationInMinutes =
        ((checkoutTimeMillisecond - checkInTimeMillisecond) / (1000 * 60))
            .toDouble();
    print('Duration in minutes: $durationInMinutes');
  }

  // Initialize parking charges
  double? parkingCharges = 0;

  if (vehicleType != null && durationInMinutes != null) {
    double durationInHours = durationInMinutes / 60;

    switch (vehicleType.toUpperCase()) {
      case 'TWO WHEELER':
        if (durationInHours <= 1) {
          parkingCharges = 10;
        } else {
          parkingCharges = 10 + ((durationInHours - 1).ceil() * 5);
        }
        break;

      case 'FOUR WHEELER':
        if (durationInHours <= 1) {
          parkingCharges = 20;
        } else {
          parkingCharges = 20 + ((durationInHours - 1).ceil() * 10);
        }
        break;

      case 'TRUCK':
        if (durationInHours <= 1) {
          parkingCharges = 50;
        } else {
          parkingCharges = 50 + ((durationInHours - 1).ceil() * 25);
        }
        break;

      // Additional cases for other vehicle types can be added here
      default:
        print('Vehicle type not supported for specific pricing rules');
        return null; // Invalid or unsupported vehicle type
    }
  }

  print('Parking charges: $parkingCharges');
  return parkingCharges;
}

String genInvoiceNum(
  int? count,
  int? shiftCount,
) {
  DateTime date = DateTime.now();

  var day, month;
  day = date.day.toString();
  month = date.month.toString();

  var invNum = (day.length < 2 ? "0" + day : day).toString() +
      (month.length < 2 ? "0" + month : month).toString() +
      date.year.toString() +
      shiftCount.toString() +
      count.toString();

  print(invNum);
  return invNum.toString();
}

dynamic generateBillDetailsJson(
  double disAmt,
  double disPer,
  double delCharges,
  String paymentMode,
  double tenderCash,
  double returnCash,
  double billamt,
  double tamAmt,
  double finalAmt,
  String invoice,
  List<dynamic> itemList,
  int billNo,
) {
  // Add your function code here!

  Map<String, dynamic> obj = {
    "billno": billNo,
    "disAmt": disAmt,
    "disPer": disPer,
    "delCharges": delCharges,
    "paymentMode": paymentMode,
    "tenderCash": tenderCash,
    "returnCash": returnCash,
    "billamt": billamt,
    "tamAmt": tamAmt,
    "finalaAt": finalAmt,
    "invoice": invoice,
    "itemList": itemList,
    "party": "party"
  };
  Map<String, dynamic> obj1 = {"billno": billNo, "details": obj};
  print(obj1);
  return obj1;
}

bool toggleLogin(bool? state) {
  // Add your function code here!
  if (state == true) {
    state = false;
    // FFAppState().show = state;
  } else {
    state = true;
    // FFAppState().show = state;
  }
  print(state);
  return state;
}

bool setFlag(bool? value) {
  // Add your function code here!
  if (value == true) {
    return false;
  } else {
    return true;
  }
}

String getDayId() {
  // Add your function code here!

  DateTime date = DateTime.now();
  var day, month;

  if (date.day.toString().length == 1) {
    day = "0" + date.day.toString();
  } else {
    day = date.day.toString();
  }

  if (date.month.toString().length == 1) {
    month = "0" + date.month.toString();
  } else {
    month = date.month.toString();
  }
  var invNum = date.year.toString() + "-" + month + "-" + day;
  print(invNum);

  return invNum.toString();
}

String selectedDayId(DateTime dateTime) {
  var day = dateTime.day.toString();
  var month = dateTime.month.toString();

  var invNum = dateTime.year.toString() +
      "-" +
      (month.length < 2 ? "0" + month : month).toString() +
      "-" +
      (day.length < 2 ? "0" + day : day).toString();

  print(invNum);
  return invNum.toString();
  // Add your function code here!
}

String getInvoiceDocId(DocumentReference? docRef) {
  // Add your function code here!
  return docRef!.id;
}

int timestampToMili(DateTime? date) {
  // timestamp to milisecond
  return date!.millisecondsSinceEpoch;
}

String milisecToTimestamp(int? dateInNumber) {
  // Add your function code here!

  DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(dateInNumber!!);
  String datetime = tsdate.year.toString() +
      "/" +
      tsdate.month.toString() +
      "/" +
      tsdate.day.toString();
  print(datetime);
  String fdatetime = DateFormat('dd-MMM-yyyy').format(tsdate);

  // DateTime date;
  return fdatetime;
}

String getTime(int? dateInNumber) {
  // Add your function code here!

  DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(dateInNumber!);
  String datetime = DateFormat('dd/MM/yyyy hh:mm a').toString();

  print(datetime);
  String fdatetime = DateFormat('dd/MM/yyyy hh:mm a').format(tsdate);

  // DateTime date;
  return fdatetime;
}

int genSrno(int? value) {
  // Add your function code here!
  return (value!! + 1);
}

String getShiftId(int? shiftCount) {
  var day, month;

  DateTime date = DateTime.now();
  day = date.day.toString();
  month = date.month.toString();
  var invNum = date.year.toString() +
      "-" +
      (month.length < 2 ? "0" + month : month).toString() +
      "-" +
      (day.length < 2 ? "0" + day : day).toString() +
      "-" +
      shiftCount.toString();

  print(invNum);
  return invNum.toString();
  // Add your function code here!
}

bool validateQuickPin(
  List<UserProfileRecord> userDoc,
  String quickPin,
  String name,
) {
  bool result = false;
  for (int i = 0; i < userDoc.length; i++) {
    var item = userDoc[i];
    if (item.name == name && item.quickPin == quickPin) {
      result = true;
      break;
    } else {
      result = false;
    }
  }
  /*
  userDoc.forEach((item) {
    if (item.name == name && item.quickPin == quickPin) {
      result = true;
     
    } else {
      result = false;
    }
     
  });*/
  return result;
}

String subscriptionDays(
  DateTime curDate,
  int createdDate,
) {
  // Add your function code here!
  final DateTime _today = curDate;
  final DateTime _rDate = DateTime.fromMillisecondsSinceEpoch(createdDate);

  var difference = _rDate.difference(_today).inDays;
  String value = difference.toString();

  return value;
}

String getDocIdFromDocRefProduct(DocumentReference docRef) {
  String id = docRef.id;
  return id;
}

String getDocIdFromDocRefInvoice(DocumentReference docRef) {
  String id = docRef.id;
  print(id);
  return id;
}

String getIdFromShiftRef(DocumentReference ref) {
  // Add your function code here!
  return ref.id;
}

String getDocIdFromDocRefCustomer(DocumentReference docRef) {
  // Add your function code here!

  String id = docRef.id;
  print(id);
  return id;
}

List<dynamic> filterBillList(
  int billno,
  List<dynamic> allBillList,
) {
  List<dynamic> itemList = [];

  if (allBillList.isNotEmpty) {
    for (int i = 0; i < allBillList.length; i++) {
      print(allBillList[i]["billno"]);
      if (allBillList[i]["billno"] == billno) {
        if (allBillList[i]["details"]["itemList"].length > 0) {
          itemList = (allBillList[i]["details"]["itemList"]);
          break;
        }
      }
    }
  }
  return itemList;
}

dynamic generatePremiseTables(
  List<PremisesRecord> doc,
  String? selectedPremise,
) {
  List<dynamic> list1 = [];
  List<dynamic> list2 = [];
  List<dynamic> returnData = [];
  int len = doc.length;
  for (int j = 0; j < len; j++) {
    int noOfTables = doc[j].tables!;
    for (int i = 1; i <= noOfTables; i++) {
      var typeName = doc[j].type! + " $i";
      list1.add({"typeName": typeName});
    }
    list2.add({"premise": doc[j].name, "type": list1});
  }

  print(list2);
  for (int x = 0; x < list2.length; x++) {
    if (list2[x]["premise"] == selectedPremise!) {
      returnData.add(list2[x]);
      break;
    } else {
      // returnData.add(list2[0]);
    }
  }

  return returnData[0];
}

String dateToTime(int? date) {
  // Add your function code here!
  DateTime time = DateTime.fromMillisecondsSinceEpoch(date!);
  String d = time.hour.toString() +
      " : " +
      time.minute.toString() +
      " : " +
      time.second.toString();

  print(d);

  return d;
}

int lastBillCount(int data) {
  // Add your function code here!
  int x = data + 1;
  return x;
}

DocumentReference genShidtDocRefById(
  String shiftId,
  String outletId,
) {
  // Add your function code here!
  return FirebaseFirestore.instance
      .doc('/OUTLET/' + outletId + '/SHIFT/$shiftId');
}

String getyesterday() {
  // Add your function code here!
  final DateTime now = DateTime.now();
  final DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

  var day, month;
  day = yesterday.day.toString();
  month = yesterday.month.toString();
  print(yesterday);

  var invNum = yesterday.year.toString() +
      "-" +
      (month.length < 2 ? "0" + month : month).toString() +
      "-" +
      (day.length < 2 ? "0" + day : day).toString();

  print(invNum);
  return invNum.toString();
}

String getToday(DateTime dateTime) {
  var day, month;
  day = dateTime.day.toString();
  month = dateTime.month.toString();

  print(dateTime);

  var invNum = dateTime.year.toString() +
      "-" +
      (month.length < 2 ? "0" + month : month).toString() +
      "-" +
      (day.length < 2 ? "0" + day : day).toString();

  print(invNum);
  return invNum.toString();
}

double calUPI(ShiftRecord shiftDoc) {
  // Add your function code here!

  return (0);
}

String getDocIdFromDocRefShiftInvoice(DocumentReference docRef) {
  String id = docRef.id;
  print(id);
  return id;
}

String getDeviceIdByRef(DocumentReference docRef) {
  return docRef.id;
  // Add your function code here!
}

String paymentModeStrToJson(
  String str,
  String index,
) {
  // Add your function code here!
  // String data = '{"cash":357,"credit":0,"digital":0}';
  String data = str;
  List<dynamic> yList = [];
  List<dynamic> zList = [];
  Map<String, dynamic> map;
  String result = "";
  var x = data.replaceAll('{', " ").trim();
  var y = x.replaceAll('}', " ").trim();
  yList = y.split(',');
  for (int j = 0; j < yList.length; j++) {
    map = {
      "title": yList[j].split(':')[0].toString(),
      "value": yList[j].split(':')[1]
    };
    print(map);
    zList.add(map);
  }
  zList.forEach((item) {
    if (item["title"] == "\"" + index + "\"") {
      result = item["value"];
    }
  });
  return result;
}

double disAmtPer(
  double? discountPer,
  double? totalPrice,
) {
  // Add your function code here!
  double output;
  double amt = 0.0;
  if (discountPer != null) {
    output = (totalPrice! * discountPer) / 100;
    amt = output;
    print(output);
  } else {
    amt = 0.0;
  }
  return amt;
}

double discountAmount(
  double? totalAmt,
  double? dicAmt,
) {
  // Add your function code here!
  double output;
  double amt = 0.0;
  if (totalAmt != null) {
    output = (dicAmt! / totalAmt) * 100;
    amt = output;
    // print(output);
  } else {
    amt = 0.0;
  }
  print(amt);
  return amt;
}

double tenderCash(
  double? totalAmount,
  double? tenderAmt,
) {
  // Add your function code here!
  double output;
  double ReturnAmt = 0.0;
  if (totalAmount != null) {
    output = (tenderAmt! - totalAmount);
    ReturnAmt = output;
    // print(output);
  } else {
    ReturnAmt = 0.0;
  }

  return ReturnAmt;
}

double roundOff(double? number) {
  // Add your function code here!

  double output;
  double number = 0.0;

  output = number.roundToDouble();
  print(output);
  return output;
}

dynamic outletDocToJson(OutletRecord doc) {
  // Add your function code here!

  List<dynamic> list = [];
  list.add({"name": doc.name, "address": doc.address, "state": doc.state});
  return list[0];
}

int getCurrentMonth(String? index) {
  // Add your function code here!
  DateTime currentDate = DateTime.now();
  DateTime firstDay, lastDay;

  firstDay = DateTime.utc(currentDate.year, currentDate.month, 1);
  lastDay = DateTime.utc(
    currentDate.year,
    currentDate.month + 1,
  ).subtract(Duration(days: 1));

  int firstDayInMili = firstDay.millisecondsSinceEpoch;
  int lastDayInMili = lastDay.millisecondsSinceEpoch;
  print("first" + firstDayInMili.toString());
  print("last" + lastDayInMili.toString());

  if (index == "start") {
    return firstDayInMili;
  } else {
    return lastDayInMili;
  }
}

List<dynamic> shiftDocToJsonList(ShiftRecord item) {
  List<dynamic> list = [];
  List<dynamic> list2 = [];
  list.add({
    "credRec": 0.0,
    "delivery": 0.0,
    "discount": 0.0,
    "refund": 0.0,
    "roundOff": 0.0,
    "expenses": 0.0,
    "advance": 0.0,
    "recAmount": 0.0,
    "upi": 0.0,
    "cashInHand": 0.0,
    "totalSale": 0.0,
    "openingBalance": 0.0,
    "noOfBills": 0,
    "tax": 0.0,
    "shiftId": 0.0,
    "noOfBills": "",
    "shiftTimeIn": 0.0,
    "shiftTimeOut": 0.0,
    "cash": 0.0,
    "card": 0.0,
    "cheque": 0.0,
    "credit": 0.0,
    "paytm": 0.0,
    "phonepe": 0.0,
    "googlepay": 0.0,
    "other": 0.0,
  });

  list[0]["shiftId"] = item.shiftId;
  list[0]["noOfBills"] = item.billCount;
  list[0]["shiftTimeIn"] = item.startTime;
  list[0]["shiftTimeOut"] = item.endTime;
  list[0]["discount"] = item.discount;
  list[0]["delivery"] = item.deliveryCharges;
  list[0]["roundOff"] = item.roundOff;
  list[0]["refund"] = item.refoundAmount;
  list[0]["expenses"] = item.expensesAmtTotal;
  list[0]["advance"] = item.advanceAmtTotal;
  list[0]["recAmount"] = item.receiveAmtTotal;
  list[0]["totalSale"] = item.totalSale;
  list[0]["openingBalance"] = item.openingAmt;
  list[0]["tax"] = item.tax;
  list[0]["cashInHand"] = item.cashSale;

  final paymentJsonData = jsonDecode(item.paymentJson!);
  list[0]["cash"] = paymentJsonData["cash"].toDouble();
  list[0]["credit"] = paymentJsonData["credit"].toDouble();
  list[0]["googlePay"] = paymentJsonData["googlepay"].toDouble();
  list[0]["paytm"] = paymentJsonData["paytm"].toDouble();
  list[0]["phonePe"] = paymentJsonData["phonepe"].toDouble();
  list[0]["cheque"] = paymentJsonData["cheque"].toDouble();
  list[0]["other"] = paymentJsonData["other"].toDouble();
  list[0]["card"] = paymentJsonData["card"].toDouble();
  list[0]["digital"] = paymentJsonData["digital"].toDouble();

  return list;
}

bool? isPrinterSelected(List<dynamic>? selectedPrinter) {
  print(selectedPrinter);
  if (selectedPrinter == null || selectedPrinter == ' ') {
    return false;
  } else if (selectedPrinter.length > 0) {
    return true;
  } else {
    return false;
  }
}

dynamic listToJson(List<dynamic> list) {
  return list[0];
}

DocumentReference shiftRef(
  dynamic obj,
  String outletId,
) {
  String shiftId = obj["ref"];

  return FirebaseFirestore.instance.doc('/OUTLET/$outletId/SHIFT/$shiftId');
}

List<dynamic> getProList(
  List<dynamic> list,
  String? type,
) {
  List<dynamic> tempList = [];
  Map map = new Map();

  if (type == "P") {
    tempList = list[0]["allProducts"];
  } else {
    tempList = list[0]["details"];
  }
  return tempList;
}

String? toUpperCase(String? value) {
  return (value!.toUpperCase());
}

List<dynamic> filterProductsCatWise(
  List<dynamic> jsonlist,
  String catId,
) {
  List<dynamic> returnJsonlist = [];
  print(jsonlist);

  for (int i = 0; i < jsonlist.length; i++) {
    print(jsonlist[i]["catRefId"]);

    if (catId == jsonlist[i]["catRefId"]) {
      returnJsonlist.add(jsonlist[i]);
    }
  }
  return returnJsonlist;
}

List<SelItemListStruct> returnProductlist(InvoiceStructStruct hiveinv) {
  //  return sellitemliststruct from invoicestruct
  List<SelItemListStruct> sellitemliststruct = [];
  for (var item in hiveinv.productList) {
    sellitemliststruct.add(SelItemListStruct(
        name: item.name,
        quantity: item.quantity,
        price: item.price,
        id: item.id,
        total: item.total,
        isDeletedItem: item.isDeletedItem));
  }
  print(sellitemliststruct);
  return sellitemliststruct;
}

DocumentReference genInvoiceDocRefById(
  String invoiceId,
  String outletId,
) {
  return FirebaseFirestore.instance
      .doc('/OUTLET/' + outletId + '/INVOICE/$invoiceId');
}

String enabletaxinclusive(bool enable) {
  if (enable == true) {
    return "inclusive";
  } else {
    return "exclusive";
  }
}

String urltostring(String string) {
  // convert url to string
  return Uri.decodeFull(string);
}

double totalAmountAmeyaFunction(List<dynamic> allBillList) {
  double total = 0.00;
  int i;
  for (i = 0; i < allBillList.length; i++) {
    print("quantity: " + allBillList[i]);
    //print("price: " + allBillList[i]["price"]);
    print(
        "----------------==========================-----------------++++++++++++++++++++++");
    // total += getTotal(allBillList[i]["quantity"], allBillList[i]["total"]);
    total += getTotal(0, 0);
  }
  print(total);
  return total;
}

DocumentReference getref(String ref) {
  // convert string to ref
  return FirebaseFirestore.instance.doc(ref);
}

DocumentReference? returnidRef(
  String? id,
  String outletid,
) {
  // return the documentRef from json id
  print(id);
  if (id is String) {
    return FirebaseFirestore.instance
        .doc('/OUTLET/' + outletid + '/PRODUCT/' + id);
  } else {
    return null;
  }
}

String toCapitalLetter1(String? value) {
  return (value!.toUpperCase());
}

int getcreatedDate() {
  // Add your function code here!
  int timestamp = DateTime.now().millisecondsSinceEpoch;
  print(timestamp);
  return timestamp;
}

int setRenewalDateInMili(DateTime? dateParameter) {
  // Add your function code here!

  int renewalDate;
  //add one Year
  DateTime date2 = dateParameter!.add(Duration(days: 365));
  print(date2); //2023-04-30 00:00:00.000
  renewalDate = DateTime.parse(date2.toString()).millisecondsSinceEpoch;
  return renewalDate;
}

DocumentReference getCatDocRefFromIdCategory(
  String? id,
  DocumentReference? parentRef,
) {
  // Add your function code here!
  var docId = parentRef!.id;
  var subId = id;
  return FirebaseFirestore.instance.doc('/OUTLET/$docId/CATEGORY/$subId');
}

int? userDocToJsonNew(
  UserProfileRecord doc,
  String index,
) {
  int? result;
  List<dynamic> objList = [];
  if (doc != null) {
    List<dynamic> temp = [];
    doc.permissionList!.forEach((item) {
      if (index == item.title) {
        result = item.value;
      }
      temp.add({"title": item.title, "value": item.value});
    });
    objList.add({"permissionList": temp});
    print(objList[0]);
  }
  return result;
}

String? editAccess(int? value) {
  String? res;
  if (value == "0") {
    res = "NONE";
  }
  if (value == "1") {
    res = "CHECKER";
  }
  if (value == "2") {
    res = "MAKER";
  }
  if (value == "3") {
    res = "AUDITOR";
  }
  if (value == "4") {
    res = "ADMIN";
  }
  print("dropdown");
  print(res);

  return res;
}

double? calculateremAmt(
  double? total,
  double? advance,
) {
  return total! - advance!;
}

double? calculateParkingCharges(
  double? hourlyTotal,
  int? checkInTimeMillisecond,
  int? checkOutTimeMillisecond,
) {
  // Calculate the duration of parking in hours
  double? durationInHours;
  if (checkInTimeMillisecond != null && checkOutTimeMillisecond != null) {
    durationInHours =
        ((checkOutTimeMillisecond - checkInTimeMillisecond) / (1000 * 60 * 60))
            .floor()
            .toDouble();
  }

  // Calculate the parking charges
  double? parkingCharges;
  if (hourlyTotal != null && durationInHours != null) {
    parkingCharges = hourlyTotal * durationInHours;
  }

  if (parkingCharges == 0) {
    return hourlyTotal;
  } else {
    return parkingCharges;
  }
}

double? calculateHour(
  int? checkinTime,
  int? checkouttime,
) {
  // Calculate the duration of parking in hours and minutes
  double? durationInHours;
  if (checkinTime != null && checkouttime != null) {
    int durationInMinutes = (checkouttime - checkinTime) ~/ (1000 * 60);
    int hours = durationInMinutes ~/ 60;
    int minutes = durationInMinutes % 60;
    durationInHours = hours + (minutes / 100); // Combine hours and minutes
  }

  // Calculate the parking charges

  if (durationInHours == 0) {
    return 0;
  } else {
    return durationInHours;
  }
}

String? toCapitalLetter(String? letter) {
  return (letter!.toUpperCase());
}

String toDecimal(double amount) {
  String result = amount.toStringAsFixed(2);

  print(result); // Output: 123.46
  return result;
}

bool returnStatus(dynamic jsonData) {
  bool result = false;
  print(jsonData);
  String status = jsonData["body"]["resultInfo"]["resultStatus"];
  if (status == "TXN_SUCCESS") {
    result = true;
  } else if (status == "PENDING") {
    result = false;
  } else {
    result = false;
  }

  return result;
}

String imageurltostring(String? url) {
  return url!;
}

int? returncount(String? orderid) {
  if (orderid == null || orderid.isEmpty) {
    return null;
  }

  // Define the fixed prefix length (ORD- and date + shift ID)
  const int prefixLength = 4; // Length of "ORD-"
  const int dateLength = 8; // Length of date in format ddMMyyyy
  const int shiftIdLength = 1; // Length of shift ID

  // Calculate the total fixed length to skip
  int fixedLength = prefixLength + dateLength + shiftIdLength;

  // Ensure the orderid has at least fixedLength characters
  if (orderid.length <= fixedLength) {
    return null;
  }

  // Extract the count part of the orderid
  String countStr = orderid.substring(fixedLength);

  // Convert the extracted characters to an integer
  int? count = int.tryParse(countStr);

  return count;
}

String? returnTitlecase(String? name) {
  if (name == null) {
    return null;
  }

  return name.split(' ').map((word) {
    if (word.isEmpty) {
      return word;
    }
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).join(' ');
}

DateTime setExpiryTime(DateTime date) {
  int renewalInMiliSec;

  DateTime datetime;
  DateTime now = new DateTime.now();
  print(now);
  datetime = date.add(Duration(hours: 4));
  print(datetime); //2023-04-30 00:00:00.000

  renewalInMiliSec = DateTime.parse(datetime.toString()).millisecondsSinceEpoch;
  print(renewalInMiliSec);
  print(datetime);
  return datetime;
}

int? doubleToInt(double? amt) {
  // convert double to int
  if (amt == null) {
    return null;
  } else {
    return amt.toInt();
  }
}

double? calRemainingamount(
  double? billamt,
  double? advancepaid,
  double? discount,
) {
  // calculate remaining amount
  if (billamt == null || advancepaid == null) {
    return null;
  } else {
    // Calculate the discount amount
    //double discountAmount = (discount ?? 0) / 100;

    // Calculate the discount amount
    // double discountValue = billamt * discountAmount;

    // Calculate the remaining amount with the discount applied
    double remainingAmountWithDiscount = (billamt - discount!) - advancepaid;

    // Calculate the remaining amount without applying the discount
    double remainingAmountWithoutDiscount = billamt - advancepaid;

    // Return the remaining amount with the discount applied
    return remainingAmountWithDiscount.toDouble();
  }
}

List<ShiftRecord> orderByShift(
  List<ShiftRecord> docs,
  String type,
) {
  if (type == "a") {
    docs.sort((a, b) => a.startTime.compareTo(b.startTime));
  } else if (type == "d") {
    docs.sort((a, b) => b.startTime.compareTo(a.startTime));
  }
  return docs;
}

int calculateTotalQty(List<dynamic> list) {
  // create a function which take json list and caluclate a total qunatity from json list
  int totalQty = 0;
  for (var item in list) {
    totalQty += item['quantity'] as int;
  }
  return totalQty;
}

String lastChar(String myString) {
  // last character of String
  return myString.substring(myString.length - 1, myString.length);
}

DocumentReference genDeviceRef(String id) {
  // Add your function code here!
  return FirebaseFirestore.instance.doc('/DEVICE/$id');
}

int renewalOnSelection(
  String? selection,
  int? createdDate,
) {
  DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(createdDate!);
  DateTime date;

  if (selection == "Weekly Pass") {
    //Weekly Pass
    date = tsdate.add(Duration(days: 7));
    print(date); //2023-04-30 00:00:00.000
    var rDate = DateTime.parse(date.toString()).millisecondsSinceEpoch;
    return rDate;
  } else if (selection == 'Monthly Pass') {
    //Monthly Pass
    date = tsdate.add(Duration(days: 30));
    print(date); //2023-04-30 00:00:00.000
    var rDate = DateTime.parse(date.toString()).millisecondsSinceEpoch;
    return rDate;
  } else if (selection == 'Half Month Pass') {
    // half Monthly Pass
    date = tsdate.add(Duration(days: 15));
    print(date); //2023-04-30 00:00:00.000
    var rDate = DateTime.parse(date.toString()).millisecondsSinceEpoch;
    return rDate;
  } else {
    date = tsdate.add(Duration(days: 0));
    print(date); //2023-04-30 00:00:00.000
    var rDate = DateTime.parse(date.toString()).millisecondsSinceEpoch;
    return rDate;
  }
}

double? calculateParkingCharges12hours(
  String? vehicleType,
  int? checkInTimeMillisecond,
  int? checkoutTimeMillisecond,
) {
  // Calculate the duration of parking in hours
  double? durationInHours;
  if (checkInTimeMillisecond != null && checkoutTimeMillisecond != null) {
    durationInHours =
        ((checkoutTimeMillisecond - checkInTimeMillisecond) / (1000 * 60 * 60))
            .toDouble();
    print('Duration in hours: $durationInHours');
  }

  // Initialize parking charges
  double? parkingCharges = 0;

  // Calculate parking charges based on vehicle type and duration in 24-hour cycles
  if (vehicleType != null && durationInHours != null) {
    // Calculate number of 24-hour periods
    int fullDays = (durationInHours / 24).floor();
    double remainingHours = durationInHours % 24;

    // Apply charges for each 24-hour period
    for (int day = 0; day < fullDays; day++) {
      switch (vehicleType.toUpperCase()) {
        case 'BICYCLE':
          parkingCharges = (parkingCharges ?? 0) + 20; // Maximum charge per day
          break;

        case 'TWO WHEELER':
          parkingCharges = (parkingCharges ?? 0) + 50; // Maximum charge per day
          break;

        case 'THREE WHEELER':
          parkingCharges =
              (parkingCharges ?? 0) + 100; // Maximum charge per day
          break;

        case 'FOUR WHEELER':
          parkingCharges =
              (parkingCharges ?? 0) + 100; // Maximum charge per day
          break;

        default:
          print('Invalid vehicle type');
          return null; // Invalid vehicle type
      }
    }

    // Apply charges for the remaining hours of the last incomplete day
    switch (vehicleType.toUpperCase()) {
      case 'BICYCLE':
        if (remainingHours <= 12) {
          parkingCharges = (parkingCharges ?? 0) + 10;
        } else {
          parkingCharges = (parkingCharges ?? 0) + 20;
        }
        break;

      case 'TWO WHEELER':
        if (remainingHours <= 1) {
          parkingCharges = (parkingCharges ?? 0) + 10;
        } else if (remainingHours > 1 && remainingHours <= 14) {
          parkingCharges = (parkingCharges ?? 0) + 30;
        } else {
          parkingCharges = (parkingCharges ?? 0) + 50;
        }
        break;

      case 'THREE WHEELER':
        if (remainingHours <= 12) {
          parkingCharges = (parkingCharges ?? 0) + 60;
        } else {
          parkingCharges = (parkingCharges ?? 0) + 100;
        }
        break;

      case 'FOUR WHEELER':
        if (remainingHours <= 12) {
          parkingCharges = (parkingCharges ?? 0) + 60;
        } else {
          parkingCharges = (parkingCharges ?? 0) + 100;
        }
        break;

      default:
        print('Invalid vehicle type');
        return null; // Invalid vehicle type
    }
  }

  print('Parking charges: $parkingCharges');
  return parkingCharges;
}

double? calculateRemainingAmount(
  double? billAmt,
  double? advancePaid,
) {
  return billAmt! - advancePaid!;
}

String getDayIdAndTime(int milliseconds) {
  if (milliseconds == 0) {
    return "-";
  }

  // Create a DateTime object from milliseconds
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);

  // Format the date as DD/MM/YY
  String formattedDate = '${dateTime.day.toString().padLeft(2, '0')}/'
      '${dateTime.month.toString().padLeft(2, '0')}/'
      '${dateTime.year.toString().substring(2)}';

  // Format the time in 12-hour format with AM/PM
  String hour =
      dateTime.hour % 12 == 0 ? '12' : (dateTime.hour % 12).toString();
  String minute = dateTime.minute.toString().padLeft(2, '0');
  String period = dateTime.hour >= 12 ? 'PM' : 'AM';

  String formattedTime = '$hour:$minute$period';

  // Combine date and time
  return '$formattedDate $formattedTime';
}

int addOneIndexAhead(int start) {
  return start + 1;
}

double returntoatlamt(List<double> listamt) {
  double tt = 0;
  for (var td in listamt) {
    tt += td;
  }
  return tt;
}

String genInvoiceNumyear(int? count) {
  DateTime now = DateTime.now();
  int currentYear = now.year;
  int nextYear = now.month >= 4 ? currentYear + 1 : currentYear;
  int previousYear = nextYear - 1;

  // Format the financial year string as "YYYY-YY"
  String financialYearString =
      "$previousYear-${nextYear.toString().substring(2)}";

  // Format the count with leading zeros (e.g., 001)
  String billCount = count != null ? count.toString().padLeft(3, '0') : '001';

  // Construct the invoice number
  String invNum = "Retail:$financialYearString/$billCount";

  return invNum;
}

double? totalShiftSaleToday(List<ShiftRecord> allShifts) {
  double total = 0;

  String todayId = DateFormat('yyyy-MM-dd').format(DateTime.now());

  // Filter shifts for the current day based on dayId and sum their totalSale
  for (final shift in allShifts) {
    if (shift.dayId == todayId) {
      total += shift.totalSale ?? 0.0;
    }
  }

  return total;
}

double? totalShiftSale(ShiftRecord shiftSale) {
  double total = 0;

  total = total + shiftSale.totalSale;

  return total;
}

DateTime returnDatePreviousday(DateTime date) {
  return date.add(Duration(days: -1));
}
