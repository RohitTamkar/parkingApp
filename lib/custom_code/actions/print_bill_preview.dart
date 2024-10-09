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

import 'dart:typed_data';

import 'package:flutter/services.dart';

import 'index.dart'; // Imports other custom actions
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_pos_printer_platform_image_3_sdt/flutter_pos_printer_platform_image_3_sdt.dart';
//import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'dart:io';
import 'package:image/image.dart' as img;

Future printBillPreview(
  List<dynamic> selectedPrinter,
  bool status,
  String statusName,
  String printerSize,
) async {
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
  dynamic obj;
  if (size == 32) {
    String bill_column = "S.N ITEM_NAME  QTY RATE TOTAL";
    String bill_column1 = "1.  TEA       1.00 20.00 20.00";
    String bill_column2 = "2.  COFFEE    2.00 30.00 60.00";

    /*   bytes += generator.text("SK's CAFE",
        styles: PosStyles(
            height: PosTextSize.size2,
            width: PosTextSize.size2,
            align: PosAlign.center));
    bytes += generator.text("4 Anand Complex",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text("Alkapuri Society",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text("Maharashtra 411038",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));*/

    bytes += generator.text("--------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));

    String printLine = '';
    String dateString = '08-09-2022';
    String serialTemp = 'SERIAL NO : 101';
    printLine = serialTemp;
    for (int i = 1; i <= (32 - (serialTemp.length + dateString.length)); i++) {
      printLine += " ";
    }
    printLine += dateString;

    bytes += generator.text(printLine,
        styles: const PosStyles(
            height: PosTextSize.size1, width: PosTextSize.size1, bold: true));
    printLine = '';

    String dateTimeString = '03:35:50 pm';
    String billNo = 'BILL NO : 101';
    printLine = billNo;
    for (int i = 1; i <= (32 - (billNo.length + dateTimeString.length)); i++) {
      printLine += " ";
    }
    printLine += dateTimeString;

    bytes += generator.text(printLine,
        styles: const PosStyles(
            height: PosTextSize.size1, width: PosTextSize.size1, bold: true));

    bytes += generator.text("--------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text(bill_column,
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text("--------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text(bill_column1,
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text(bill_column2,
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text("--------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text("NET TOTAL : 80 ",
        styles: PosStyles(
            height: PosTextSize.size2,
            width: PosTextSize.size2,
            align: PosAlign.right));
    bytes += generator.text("--------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text("PAYMENT MODE : CASH",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text("--------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.right));
    final List<int> barData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 4];
    bytes += generator.barcode(Barcode.upcA(barData));
    //bytes += generator.qrcode('Rohit', align: PosAlign.center);
    /*  bytes += generator.text("** THANK YOU ! VISIT AGAIN !! **",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));*/
  } else if (size == 46) {
    String bill_column = "S.N  ITEM_NAME         QTY    RATE   TOTAL";
    String bill_column1 = "1.  TEA               1.00    20.00   20.00";
    String bill_column2 = "2.  COFFEE            2.00    30.00   60.00";

    bytes += generator.text("----------------------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));

    String printLine = '';
    String dateString = '08-09-2022';
    String serialTemp = 'SERIAL NO : 101';
    printLine = serialTemp;
    for (int i = 1; i <= (46 - (serialTemp.length + dateString.length)); i++) {
      printLine += " ";
    }
    printLine += dateString;

    bytes += generator.text(printLine,
        styles: const PosStyles(
            height: PosTextSize.size1, width: PosTextSize.size1, bold: true));
    printLine = '';

    String dateTimeString = '03:35:50 pm';
    String billNo = 'BILL NO : 101';
    printLine = billNo;
    for (int i = 1; i <= (46 - (billNo.length + dateTimeString.length)); i++) {
      printLine += " ";
    }
    printLine += dateTimeString;

    bytes += generator.text(printLine,
        styles: const PosStyles(
            height: PosTextSize.size1, width: PosTextSize.size1, bold: true));

    bytes += generator.text("----------------------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text(bill_column,
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text("----------------------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text(bill_column1,
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text(bill_column2,
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text("----------------------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text("NET TOTAL : 80 ",
        styles: PosStyles(
            height: PosTextSize.size2,
            width: PosTextSize.size2,
            align: PosAlign.right));
    bytes += generator.text("----------------------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text("PAYMENT MODE : CASH",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text("----------------------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.right));
    final List<int> barData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 4];
    bytes += generator.barcode(Barcode.upcA(barData));
    // bytes += generator.qrcode('Rohit', align: PosAlign.center);
    /*bytes += generator.text("** THANK YOU ! VISIT AGAIN !! **",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));*/
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
