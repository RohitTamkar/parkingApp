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

import 'dart:convert';

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';

Future<String> genExcelForBillWiseReport(
  String? startdate,
  String? shopName,
  List<InvoiceRecord>? docList,
  String? enddate,
) async {
  // Add your function code here!
  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];
  CellStyle boldStyle = CellStyle(bold: true);

  double count = 0;
  String vechicleNo = "";
  String outDate = "";
  double totalAmount = 0;

  for (var product in docList!) {
    count += product.count;
    vechicleNo += product.vechicleNo;
    outDate += product.checkOutTerminal;
    totalAmount += product.finalBillAmt;
  }

  // Add headers to the sheet
  // sheet.appendRow([
  //   TextCellValue('Shop Name'),
  //   TextCellValue(shopName ?? ''),
  // ]);

/*
  sheet.appendRow([
    TextCellValue('Date & Time'),
    TextCellValue(dateTime ?? ''),
  ]);*/

  sheet.appendRow([
    TextCellValue('Report Date'),
    TextCellValue(startdate ?? ''),
  ]);

  sheet.appendRow([
    TextCellValue('Total Bill Amount'),
    TextCellValue(count.toString() ?? ''),
  ]);

  sheet.appendRow([
    TextCellValue('Total Tax Amount'),
    TextCellValue(vechicleNo.toString() ?? ''),
  ]);

  sheet.appendRow([
    TextCellValue('Total Discount Amount'),
    TextCellValue(outDate.toString() ?? ''),
  ]);

  sheet.appendRow([
    TextCellValue('Total Delivery Charges'),
    TextCellValue(totalAmount.toString() ?? ''),
  ]);

  sheet.appendRow([TextCellValue('')]); // Add an empty row for spacing

  // Add product details to the sheet
  sheet.appendRow([
    TextCellValue('Date'),
    TextCellValue('Bill No'),
    TextCellValue('Bill Amount'),
    TextCellValue('Tax Amount'),
    TextCellValue('Discount Amount'),
    TextCellValue('Delivery Charges'),
  ]);

  List<int> boldColumns = [0, 1, 2, 3, 4, 5, 7];
  List<int> boldRows = [1, 2, 3, 4, 5];

  for (int columnIndex in boldColumns) {
    var cell = sheet.cell(
        CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: columnIndex));
    cell.cellStyle = boldStyle;
  }

  for (int rowIndex in boldRows) {
    var cell = sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: rowIndex, rowIndex: 7));
    cell.cellStyle = boldStyle;
  }

  for (var product in docList!) {
    sheet.appendRow([
      TextCellValue(product.count.toString()),
      TextCellValue(product.vechicleNo),
      TextCellValue(product.checkOutTime.toString()),
      TextCellValue(product.finalBillAmt.toString()),
      // TextCellValue(product.taxAmt.toString()),
      // TextCellValue(product.discountAmt.toString()),
      // TextCellValue(product.delliveryChrg.toString()),
    ]);
  }

  sheet.appendRow([TextCellValue('')]);
  sheet.appendRow([TextCellValue('')]);

  // sheet.appendRow([
  //   TextCellValue('Total'),
  //   TextCellValue(totalqty.toString()),
  //   TextCellValue(''),
  //   TextCellValue(totalAmt.toString()),
  // ]);
  // Add total tax amount to the sheet
  // Encode the Excel file
  var fileBytes = excel.encode();

  // Convert bytes to base64
  var base64String = base64Encode(fileBytes!);

  // Prepare data URI
  var dataUri =
      'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,$base64String';
  print(dataUri);
  return dataUri;
}
