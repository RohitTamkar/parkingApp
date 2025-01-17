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

import '/flutter_flow/custom_functions.dart' as functions;

import 'dart:async';
import 'dart:developer';
import 'dart:io';
//import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:flutter_pos_printer_platform_image_3_sdt/flutter_pos_printer_platform_image_3_sdt.dart';

import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';

Future printVehicleWiseReport(
  List<dynamic> selectedPrinter,
  bool status,
  String statusName,
  String printerSize,
  List<InvoiceRecord> dataDocument,
  List<InvoiceRecord> uniquelist,
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

  // changes according to size
  if (size == 46) {
  } else if (size == 32) {
    billColumn3 = "VehicleType       Qty    Amt "; //(32)
    //

    if (dataDocument!.isNotEmpty) {
      obj = dataDocument[0];

      bytes += generator.text("Vehicle Wise Report",
          styles: PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              align: PosAlign.center));
      QuerySnapshot querySnapshot;
      querySnapshot = await FirebaseFirestore.instance
          .collection('OUTLET')
          .doc(FFAppState().outletIdRef?.id)
          .collection('HEADER')
          .get();

      for (var doc in querySnapshot.docs) {
        print(doc);

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

      String printLine = '';
      String dateString = '';
      String dateString1 = '';
      String dateStringend = '';
      double totalAmt = 0;
      double totalAmt2 = 0;
      final DateTime? now = FFAppState().startDate;

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      String title = "Start Date";

      printLine += title;
      final DateFormat formatter2 = DateFormat('dd/MM/yyyy');
      final String formatted2 = formatter2.format(now!);
      dateString1 = formatted2.toString();

      for (int i = 1; i <= (size - (title.length + dateString1.length)); i++) {
        printLine += " ";
      }

      printLine += dateString1;

      bytes += generator.text(printLine,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false));
      printLine = '';

      String title2 = "End Date";
      final DateTime? now2 = FFAppState().endDate;

      printLine += title2;
      final DateFormat formatter22 = DateFormat('yyyy-MM-dd');
      final String formatted22 = formatter2.format(now2!);
      dateStringend = FFAppState().filterDate.toString();

      for (int i = 1;
          i <= (size - (title2.length + dateStringend.length));
          i++) {
        printLine += " ";
      }

      printLine += dateStringend;

      bytes += generator.text(printLine,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false));
      printLine = '';

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.row([
        PosColumn(
          text: billColumn3,
          width: 12,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
      ]);
      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      for (var inv in uniquelist) {
        String Vechicltype = '';
        totalAmt2 += functions.returntoatlamt(dataDocument
            .where((e) => e.vechicleType == inv.vechicleType)
            .toList()
            .map((e) => e.finalBillAmt)
            .toList());
        totalAmt = functions.returntoatlamt(dataDocument
            .where((e) => e.vechicleType == inv.vechicleType)
            .toList()
            .map((e) => e.finalBillAmt)
            .toList());
        Vechicltype = inv.vechicleType;

        bytes += generator.row([
          PosColumn(
            text: Vechicltype.toString(),
            width: 7,
            styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
            ),
          ),
          PosColumn(
            text: dataDocument
                .where((e) => e.vechicleType == inv.vechicleType)
                .toList()
                .length
                .toString(),
            width: 2,
            styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
            ),
          ),
          PosColumn(
              text: totalAmt.toString(),
              width: 3,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
              )),
        ]);
      }
      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      bytes += generator.row([
        PosColumn(
          text: "TotalAmt:",
          width: 9,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: true,
              align: PosAlign.left),
        ),
        PosColumn(
          text: totalAmt2.toString(),
          width: 3,
          styles: PosStyles(
            fontType: PosFontType.fontA,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: false,
          ),
        )
      ]);

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("** THANK YOU! HAVE A NICE DAY **",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
    }
  } else {
    bytes += generator.text('Test Print',
        styles: PosStyles(
            height: PosTextSize.size2,
            width: PosTextSize.size2,
            align: PosAlign.center));
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
