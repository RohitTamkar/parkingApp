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

import 'dart:async';
import 'dart:developer';
import 'dart:io';
//import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter_pos_printer_platform_image_3_sdt/flutter_pos_printer_platform_image_3_sdt.dart';

Future printPassParking(
  List<dynamic> selectedPrinter,
  bool status,
  String statusName,
  dynamic outletDetails,
  MonthlyPassRecord invoiceDetails,
  String printerSize,
  String custName,
  String custMobile,
  String custVehicleNo,
  String custVehicleType,
) async {
  // Add your function code here!
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
      // Add a decorative header
      bytes += generator.text("PARKING PASS",
          styles: const PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              bold: true,
              align: PosAlign.center));

      // Add blank line
      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      String printLine = '';
      String dateString = '';
      // String serialTemp = 'TOKEN NO: ' + invoiceDetails.count.toString();

      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      final String formatted = formatter.format(now);
      dateString = formatted.toString();
      //printLine = serialTemp;

      /*printLine += dateString;*/
      printLine = '';
      final DateTime now1 = DateTime.now();
      final DateFormat formatter1 = DateFormat('h:mm:ss');
      final String formatted1 = formatter1.format(now1);

      String dateTimeString = formatted1.toString();
      printLine += dateTimeString;
      bytes += generator.text('DATE:' + dateString + ' ' + printLine,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      /* bytes += generator.text(billNo,
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

      bytes += generator.text("Name: " + custName.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      bytes += generator.text("Mobile No: " + custMobile.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      // Adding Vehicle No, Check-in and Check-out times, and Amount
      bytes += generator.text(custVehicleType + ' NO',
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      bytes += generator.text(custVehicleNo,
          styles: const PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              bold: false,
              align: PosAlign.center));

// Assuming invoiceDetails.checkInTime and invoiceDetails.checkOutTime are in milliseconds
// Convert milliseconds to DateTime objects
      DateTime checkInDateTime =
          DateTime.fromMillisecondsSinceEpoch(invoiceDetails.passStartDate);
      DateTime checkOutDateTime =
          DateTime.fromMillisecondsSinceEpoch(invoiceDetails.passEndDate);
      print(checkInDateTime);
// Format DateTime objects to the desired format
      String formattedCheckInTime = DateFormat('dd-MM-yyyy hh:mm:a')
          .format(checkInDateTime); // Example: 02:30:AM
      String formattedCheckOutTime =
          DateFormat('dd-MM-yyyy hh:mm:a').format(checkOutDateTime);

// Now, you can use these formatted strings in your code
      bytes += generator.text('FROM: $formattedCheckInTime',
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      if (invoiceDetails.passEndDate == 0) {
        bytes += generator.text('TO:' + invoiceDetails.passEndDate.toString(),
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      } else {
        bytes += generator.text('TO: $formattedCheckOutTime',
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }
      /* bytes += generator.text('Amount: ${invoiceDetails.billAmt}',
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false));*/
      bytes += generator.text(
          "Pass Plan: " + invoiceDetails.planName.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text(
          "No Of Days: " + invoiceDetails.validityDays.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      if (invoiceDetails.remark.isNotEmpty) {
        bytes += generator.text("Remark: " + invoiceDetails.remark.toString(),
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("NET :" + invoiceDetails.amount.toString(),
          styles: PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              align: PosAlign.right));

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text(
          "PAYMENT MODE :" + invoiceDetails.paymentType.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("----------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      bytes += generator.text(" THANK YOU ! DRIVE SAFELY ! ",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      // if (invoiceDetails.checkInTime > 0) {
      //   bytes += generator.qrcode(invoiceDetails.reference.id,
      //       size: QRSize.size5); // Adjust the QR size as needed
      // }
      bytes += generator.qrcode(invoiceDetails.reference.id,
          size: QRSize.size5); // Adjust the QR size as needed
      // // Adjust the QR size as needed
    } else {
      bytes += generator.text('Test Print',
          styles: PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              align: PosAlign.center));
    }
  }

  if (size == 32) {
    if (invoiceDetails != null) {
      // Add a decorative header
      bytes += generator.text("PARKING PASS",
          styles: const PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              bold: true,
              align: PosAlign.center));

      // Add blank line

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      String printLine = '';
      String dateString = '';
      // String serialTemp = 'TOKEN NO: ' + invoiceDetails.count.toString();

      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      final String formatted = formatter.format(now);
      dateString = formatted.toString();
      //printLine = serialTemp;

      /*printLine += dateString;*/
      printLine = '';
      final DateTime now1 = DateTime.now();
      final DateFormat formatter1 = DateFormat('h:mm:ss');
      final String formatted1 = formatter1.format(now1);

      String dateTimeString = formatted1.toString();
      printLine += dateTimeString;
      bytes += generator.text('DATE:' + dateString + ' ' + printLine,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      /* bytes += generator.text(billNo,
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

      //customer Details
      bytes += generator.text("Name: " + custName.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      bytes += generator.text("Mobile No: " + custMobile.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      // Adding Vehicle No, Check-in and Check-out times, and Amount
      bytes += generator.text(custVehicleType + ' NO',
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      bytes += generator.text(custVehicleNo,
          styles: const PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              bold: false,
              align: PosAlign.center));

// Assuming invoiceDetails.checkInTime and invoiceDetails.checkOutTime are in milliseconds
// Convert milliseconds to DateTime objects
      DateTime checkInDateTime =
          DateTime.fromMillisecondsSinceEpoch(invoiceDetails.passStartDate);
      DateTime checkOutDateTime =
          DateTime.fromMillisecondsSinceEpoch(invoiceDetails.passEndDate);
      print(checkInDateTime);
// Format DateTime objects to the desired format
      String formattedCheckInTime = DateFormat('dd-MM-yyyy hh:mm:a')
          .format(checkInDateTime); // Example: 02:30:AM
      String formattedCheckOutTime =
          DateFormat('dd-MM-yyyy hh:mm:a').format(checkOutDateTime);

// Now, you can use these formatted strings in your code
      bytes += generator.text('FROM: $formattedCheckInTime',
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      if (invoiceDetails.passEndDate == 0) {
        bytes += generator.text('TO:' + invoiceDetails.passEndDate.toString(),
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      } else {
        bytes += generator.text('TO: $formattedCheckOutTime',
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }
      /* bytes += generator.text('Amount: ${invoiceDetails.billAmt}',
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false));*/
      bytes += generator.text(
          "Pass Plan: " + invoiceDetails.planName.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text(
          "No Of Days: " + invoiceDetails.validityDays.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      if (invoiceDetails.remark.isNotEmpty) {
        bytes += generator.text("Remark: " + invoiceDetails.remark.toString(),
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("NET :" + invoiceDetails.amount.toString(),
          styles: PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              align: PosAlign.right));

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text(
          "PAYMENT MODE :" + invoiceDetails.paymentType.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      bytes += generator.text(" THANK YOU ! DRIVE SAFELY ! ",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      // Add QR code only if checkout time is not zero
      // Add QR code only if checkout time is not zero
      // if (invoiceDetails.checkInTime > 0) {
      //   bytes += generator.qrcode(invoiceDetails.reference.id,
      //       size: QRSize.size3); // Adjust the QR size as needed
      // }

      // if (invoiceDetails.checkInTime > 0) {
      //   bytes += generator.qrcode(invoiceDetails.reference.id,
      //       size: QRSize.size5); // Adjust the QR size as needed
      // }

      bytes += generator.qrcode(invoiceDetails.reference.id,
          size: QRSize.size5); // Adjust the QR size as needed
      // Adjust the QR size as needed
      /* bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));*/
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
