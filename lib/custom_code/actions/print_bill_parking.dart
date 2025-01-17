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
import '/flutter_flow/custom_functions.dart' as functions;
// Imports other custom actions

// Imports other custom actions

import 'dart:async';
import 'dart:developer';
import 'dart:io';
//import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter_pos_printer_platform_image_3_sdt/flutter_pos_printer_platform_image_3_sdt.dart';

Future printBillParking(
    List<dynamic> selectedPrinter,
    bool status,
    String statusName,
    dynamic outletDetails,
    InvoiceRecord invoiceDetails,
    String printerSize) async {
  // Add your function code here!
  int size = 32;
  if (printerSize == "3 inch") {
    size = 46;
  } else if (printerSize == "2 inch") {
    size = 32;
  }
  final profile = await CapabilityProfile.load();
  final generator = size == 32
      ? Generator(PaperSize.mm58, profile)
      : Generator(PaperSize.mm80, profile);

  var printerManager = PrinterManager.instance;
  List<int>? pendingTask;
  BTStatus _currentStatus = BTStatus.none;
  USBStatus _currentUsbStatus = USBStatus.none;
  if (statusName == "BTStatus.connected") {
    _currentStatus = BTStatus.connected;
  }
  // _currentUsbStatus is only supports on Android
  if (statusName == "USBStatus.connected") {
    _currentUsbStatus = USBStatus.connected;
  }
  FFAppState().printerName = "";
  List<int> bytes = [];
  String billColumn3;
  String taxColumn3;
  dynamic obj;

  // changes according to size
  if (size == 46) {
    if (invoiceDetails != null) {
      //     // Add a decorative header
      //     bytes += generator.text("******* PARKING RECEIPT *******",
      //         styles: const PosStyles(
      //             height: PosTextSize.size1,
      //             width: PosTextSize.size1,
      //             bold: true,
      //             align: PosAlign.center));

      QuerySnapshot querySnapshot;
      querySnapshot = await FirebaseFirestore.instance
          .collection('OUTLET')
          .doc(FFAppState().outletIdRef?.id)
          .collection('HEADER')
          .get();

      for (var doc in querySnapshot.docs) {
        print(doc);

/*      if (doc["recepitLogoUrl"] != null && doc["recepitLogoUrl"].isNotEmpty) {
        final ByteData data =
            await NetworkAssetBundle(Uri.parse(doc["recepitLogoUrl"])).load("");
        final Uint8List imgBytes = data.buffer.asUint8List();
        final img.Image image = img.decodeImage(imgBytes)!;

        //   bytes += generator.imageRaster(image, imageFn: PosImageFn.graphics);
        bytes += generator.image(image);
        // bytes += generator.imageRaster(image);
      }*/
        if (doc["title"] != null && doc["title"].isNotEmpty) {
          bytes += generator.text(doc["title"],
              styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  align: PosAlign.center));
        }
        if (doc["address"] != null && doc["address"].isNotEmpty) {
          bytes += generator.text(doc["address"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }
        if (doc["subtitleAddress"] != null &&
            doc["subtitleAddress"].isNotEmpty) {
          bytes += generator.text(doc["subtitleAddress"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }

        if (doc["gstNo"] != null && doc["gstNo"].isNotEmpty) {
          bytes += generator.text(doc["gstNo"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }
        if (doc["contactNo"] != null && doc["contactNo"].isNotEmpty) {
          bytes += generator.text(doc["contactNo"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }
        if (doc["email"] != null && doc["email"].isNotEmpty) {
          bytes += generator.text(doc["email"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }
        if (doc["serialNo"] != null && doc["serialNo"].isNotEmpty) {
          bytes += generator.text(doc["serialNo"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }
        if (doc["taxInvoice"] != null && doc["taxInvoice"].isNotEmpty) {
          bytes += generator.text(doc["taxInvoice"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }
        if (doc["bankName"] != null && doc["bankName"].isNotEmpty) {
          bytes += generator.text(doc["bankName"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }
        if (doc["bankBranch"] != null && doc["bankBranch"].isNotEmpty) {
          bytes += generator.text(doc["bankBranch"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }

        if (doc["accountNumber"] != null && doc["accountNumber"].isNotEmpty) {
          bytes += generator.text(doc["accountNumber"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }
        if (doc["ifscCode"] != null && doc["ifscCode"].isNotEmpty) {
          bytes += generator.text(doc["ifscCode"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }
      }
      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      String printLine = '';
      String dateString = '';
      String serialTemp = 'TOKEN NO: ' + invoiceDetails.count.toString();

      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      final String formatted = formatter.format(now);
      dateString = formatted.toString();
      //printLine = serialTemp;

      bytes += generator.text(serialTemp,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      for (int i = 1;
          i <= (size - (serialTemp.length + dateString.length));
          i++) {
        printLine += " ";
      }

      /*printLine += dateString;*/
      printLine = '';
      final DateTime now1 = DateTime.now();
      final DateFormat formatter1 = DateFormat('h:mm:ss');
      final String formatted1 = formatter1.format(now1);

      String dateTimeString = formatted1.toString();
      printLine += dateTimeString;
      // bytes += generator.text('DATE:' + dateString + ' ' + printLine,
      //     styles: const PosStyles(
      //         height: PosTextSize.size1,
      //         width: PosTextSize.size1,
      //         bold: false,
      //         align: PosAlign.center));

      String billNo = 'Bill No:' + invoiceDetails.invoice.toString();
      printLine = billNo;
      for (int i = 1;
          i <= (size - (billNo.length + dateTimeString.length));
          i++) {
        printLine += " ";
      }

      bytes += generator.text("",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left));
      bytes += generator.text(
          "Vehicle Type: " + invoiceDetails.vechicleType.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left));
      bytes += generator.text("Vehicle No: " + invoiceDetails.vechicleNo,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left));

      DateTime checkInDateTime =
          DateTime.fromMillisecondsSinceEpoch(invoiceDetails.checkInTime);
      DateTime checkOutDateTime =
          DateTime.fromMillisecondsSinceEpoch(invoiceDetails.checkOutTime);
      print(checkInDateTime);
// Format DateTime objects to the desired format
      String formattedCheckInTime = DateFormat('dd-MM-yyyy hh:mm:a')
          .format(checkInDateTime); // Example: 02:30:AM
      String formattedCheckOutTime =
          DateFormat('dd-MM-yyyy hh:mm:a').format(checkOutDateTime);

// Now, you can use these formatted strings in your code
      bytes += generator.text('Check-In: $formattedCheckInTime',
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left));

// Only display Check-Out time if it is non-zero
      if (invoiceDetails.checkOutTime > 0) {
        bytes += generator.text('Check-Out: $formattedCheckOutTime',
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left));

        bytes += generator.text(
            "Duration :" +
                functions
                    .calculateHour(invoiceDetails.checkInTime,
                        getCurrentTimestamp.millisecondsSinceEpoch)
                    .toString() +
                "hr",
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.left));
        bytes += generator.text(
            "Amount :" + invoiceDetails.finalBillAmt.toString(),
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.left));
      }

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left));
      bytes += generator.text("",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left));

      if (invoiceDetails.checkOutTime > 0) {
        bytes += generator.text(" THANK YOU ! ",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      } else {
        bytes += generator.qrcode(invoiceDetails.reference.id,
            size: QRSize.size7); // Adjust the QR size as needed
        bytes += generator.text("",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));

        QuerySnapshot querySnapshot2;
        querySnapshot2 = await FirebaseFirestore.instance
            .collection('OUTLET')
            .doc(FFAppState().outletIdRef?.id)
            .collection('FOOTER')
            .get();
        for (var doc in querySnapshot2.docs) {
          print(doc);
          if (doc["footerText1"] != null && doc["footerText1"].isNotEmpty) {
            bytes += generator.text(doc["footerText1"],
                styles: PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    align: PosAlign.center));
          }
          if (doc["footerText2"] != null && doc["footerText2"].isNotEmpty) {
            bytes += generator.text(doc["footerText2"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["footerText3"] != null && doc["footerText3"].isNotEmpty) {
            bytes += generator.text(doc["footerText3"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["footerText4"] != null && doc["footerText4"].isNotEmpty) {
            bytes += generator.text(doc["footerText4"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["footerText5"] != null && doc["footerText5"].isNotEmpty) {
            bytes += generator.text(doc["footerText5"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
        }
      }

      //
      //     // // // Adjust the QR size as needed
    } else {
      bytes += generator.text('Test Print',
          styles: PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              align: PosAlign.center));
    }
  }

  if (size == 32) {
    QuerySnapshot querySnapshot;
    querySnapshot = await FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(FFAppState().outletIdRef?.id)
        .collection('HEADER')
        .get();

    for (var doc in querySnapshot.docs) {
      print(doc);

/*      if (doc["recepitLogoUrl"] != null && doc["recepitLogoUrl"].isNotEmpty) {
        final ByteData data =
            await NetworkAssetBundle(Uri.parse(doc["recepitLogoUrl"])).load("");
        final Uint8List imgBytes = data.buffer.asUint8List();
        final img.Image image = img.decodeImage(imgBytes)!;

        //   bytes += generator.imageRaster(image, imageFn: PosImageFn.graphics);
        bytes += generator.image(image);
        // bytes += generator.imageRaster(image);
      }*/
      if (doc["title"] != null && doc["title"].isNotEmpty) {
        bytes += generator.text(doc["title"],
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.center));
      }
      if (doc["address"] != null && doc["address"].isNotEmpty) {
        bytes += generator.text(doc["address"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["subtitleAddress"] != null && doc["subtitleAddress"].isNotEmpty) {
        bytes += generator.text(doc["subtitleAddress"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }

      if (doc["gstNo"] != null && doc["gstNo"].isNotEmpty) {
        bytes += generator.text(doc["gstNo"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["contactNo"] != null && doc["contactNo"].isNotEmpty) {
        bytes += generator.text(doc["contactNo"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["email"] != null && doc["email"].isNotEmpty) {
        bytes += generator.text(doc["email"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["serialNo"] != null && doc["serialNo"].isNotEmpty) {
        bytes += generator.text(doc["serialNo"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["taxInvoice"] != null && doc["taxInvoice"].isNotEmpty) {
        bytes += generator.text(doc["taxInvoice"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["bankName"] != null && doc["bankName"].isNotEmpty) {
        bytes += generator.text(doc["bankName"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["bankBranch"] != null && doc["bankBranch"].isNotEmpty) {
        bytes += generator.text(doc["bankBranch"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }

      if (doc["accountNumber"] != null && doc["accountNumber"].isNotEmpty) {
        bytes += generator.text(doc["accountNumber"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["ifscCode"] != null && doc["ifscCode"].isNotEmpty) {
        bytes += generator.text(doc["ifscCode"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
    }

    if (invoiceDetails != null) {
      // Add a decorative header
      // bytes += generator.text("******* PARKING RECEIPT *******",
      //     styles: const PosStyles(
      //         height: PosTextSize.size1,
      //         width: PosTextSize.size1,
      //         bold: true,
      //         align: PosAlign.center));

      // Add blank line
/*
      bytes += generator.text(" DHULE BUS STAND ",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      bytes += generator.text("PAY & PARK ",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      bytes += generator.text(" MSRTC APPROVED ",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      bytes += generator.text(" CONTACT 9172676376 ",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));*/

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      String printLine = '';
      String dateString = '';
      String serialTemp = 'TOKEN NO: ' + invoiceDetails.count.toString();

      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      final String formatted = formatter.format(now);
      dateString = formatted.toString();
      //printLine = serialTemp;

      bytes += generator.text(serialTemp,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      for (int i = 1;
          i <= (size - (serialTemp.length + dateString.length));
          i++) {
        printLine += " ";
      }

      /*printLine += dateString;*/
      printLine = '';
      final DateTime now1 = DateTime.now();
      final DateFormat formatter1 = DateFormat('h:mm:ss');
      final String formatted1 = formatter1.format(now1);

      String dateTimeString = formatted1.toString();
      printLine += dateTimeString;
      // bytes += generator.text('DATE:' + dateString + ' ' + printLine,
      //     styles: const PosStyles(
      //         height: PosTextSize.size1,
      //         width: PosTextSize.size1,
      //         bold: false,
      //         align: PosAlign.center));

      String billNo = 'Bill No:' + invoiceDetails.invoice.toString();
      printLine = billNo;
      for (int i = 1;
          i <= (size - (billNo.length + dateTimeString.length));
          i++) {
        printLine += " ";
      }

      // bytes += generator.text("--------------------------------",
      //     styles: const PosStyles(
      //         height: PosTextSize.size1,
      //         width: PosTextSize.size1,
      //         bold: false,
      //         align: PosAlign.center));

      // Adding Vehicle No, Check-in and Check-out times, and Amount
      bytes += generator.text("",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left));
      bytes += generator.text(
          "Vehicle Type: " + invoiceDetails.vechicleType.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left));
      bytes += generator.text("Vehicle No: " + invoiceDetails.vechicleNo,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left));

// Assuming invoiceDetails.checkInTime and invoiceDetails.checkOutTime are in milliseconds
// Convert milliseconds to DateTime objects
      DateTime checkInDateTime =
          DateTime.fromMillisecondsSinceEpoch(invoiceDetails.checkInTime);
      DateTime checkOutDateTime =
          DateTime.fromMillisecondsSinceEpoch(invoiceDetails.checkOutTime);
      print(checkInDateTime);
// Format DateTime objects to the desired format
      String formattedCheckInTime = DateFormat('dd-MM-yyyy hh:mm:a')
          .format(checkInDateTime); // Example: 02:30:AM
      String formattedCheckOutTime =
          DateFormat('dd-MM-yyyy hh:mm:a').format(checkOutDateTime);

// Now, you can use these formatted strings in your code
      bytes += generator.text('Check-In: $formattedCheckInTime',
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left));

// Only display Check-Out time if it is non-zero
      if (invoiceDetails.checkOutTime > 0) {
        bytes += generator.text('Check-Out: $formattedCheckOutTime',
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left));
        bytes += generator.text(
            "Duration :" +
                functions
                    .calculateHour(invoiceDetails.checkInTime,
                        getCurrentTimestamp.millisecondsSinceEpoch)
                    .toString() +
                "hr",
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.left));

        bytes += generator.text(
            "Amount :" + invoiceDetails.finalBillAmt.toString(),
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.left));
      }

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left));
      //
      // if (invoiceDetails.checkInTime > 0) {
      //   bytes += generator.qrcode(invoiceDetails.reference.id,
      //       size: QRSize.size7); // Adjust the QR size as needed
      // }

      bytes += generator.text("",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left));

      if (invoiceDetails.checkOutTime > 0) {
        bytes += generator.text(" THANK YOU ! ",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      } else {
        bytes += generator.qrcode(invoiceDetails.reference.id,
            size: QRSize.size7); // Adjust the QR size as needed
        bytes += generator.text("",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));

        QuerySnapshot querySnapshot2;
        querySnapshot2 = await FirebaseFirestore.instance
            .collection('OUTLET')
            .doc(FFAppState().outletIdRef?.id)
            .collection('FOOTER')
            .get();
        for (var doc in querySnapshot2.docs) {
          print(doc);
          if (doc["footerText1"] != null && doc["footerText1"].isNotEmpty) {
            bytes += generator.text(doc["footerText1"],
                styles: PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    align: PosAlign.center));
          }
          if (doc["footerText2"] != null && doc["footerText2"].isNotEmpty) {
            bytes += generator.text(doc["footerText2"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["footerText3"] != null && doc["footerText3"].isNotEmpty) {
            bytes += generator.text(doc["footerText3"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["footerText4"] != null && doc["footerText4"].isNotEmpty) {
            bytes += generator.text(doc["footerText4"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["footerText5"] != null && doc["footerText5"].isNotEmpty) {
            bytes += generator.text(doc["footerText5"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
        }
      }

      // bytes += generator.qrcode(invoiceDetails.reference.id,
      //     size: QRSize.size5); // Adjust the QR size as needed
      // // Adjust the QR size as needed
    } else {
      bytes += generator.text('Test Print',
          styles: PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              align: PosAlign.center));
    }
  }

  if (bytes.length > 0) {
    //_printEscPos(bytes, generator);

    if (selectedPrinter == null) return;
    var bluetoothPrinter = selectedPrinter[0]!;

    switch (bluetoothPrinter["typePrinter"]) {
      case PrinterType.usb:
        bytes += generator.feed(2);
        bytes += generator.cut();
        FFAppState().printerName = statusName;
        FFAppState().isPrinterConnected = status;
        await printerManager.connect(
            type: bluetoothPrinter["typePrinter"],
            model: UsbPrinterInput(
                name: bluetoothPrinter["deviceName"],
                productId: bluetoothPrinter["productId"],
                vendorId: bluetoothPrinter["vendorId"]));
        pendingTask = null;
        if (Platform.isAndroid) pendingTask = bytes;
        break;
      case PrinterType.bluetooth:
        bytes += generator.cut();
        FFAppState().printerName = statusName;
        FFAppState().isPrinterConnected = status;
        await printerManager.connect(
            type: bluetoothPrinter["typePrinter"],
            model: BluetoothPrinterInput(
              name: bluetoothPrinter["deviceName"],
              address: bluetoothPrinter["address"],
              isBle: bluetoothPrinter["isBle"] ?? false,
            ));
        pendingTask = null;
        if (Platform.isIOS || Platform.isAndroid) pendingTask = bytes;
        break;
      case PrinterType.network:
        bytes += generator.feed(2);
        bytes += generator.cut();
        await printerManager.connect(
            type: bluetoothPrinter["typePrinter"],
            model: TcpPrinterInput(ipAddress: bluetoothPrinter.address!));
        break;
      default:
    }
    if (bluetoothPrinter["typePrinter"] == PrinterType.bluetooth) {
      _currentStatus = BTStatus.connected;

      if (_currentStatus == BTStatus.connected) {
        FFAppState().printerName = "connected bt";
        printerManager.send(
            type: bluetoothPrinter["typePrinter"], bytes: bytes);
        pendingTask = null;
      }
    } else if (bluetoothPrinter["typePrinter"] == PrinterType.usb &&
        Platform.isAndroid) {
      // _currentUsbStatus is only supports on Android
      if (_currentUsbStatus == USBStatus.connected) {
        FFAppState().printerName = "connected usb";
        printerManager.send(
            type: bluetoothPrinter["typePrinter"], bytes: bytes);
        pendingTask = null;
      }
    } else {
      printerManager.send(type: bluetoothPrinter["typePrinter"], bytes: bytes);
    }
  }
}
