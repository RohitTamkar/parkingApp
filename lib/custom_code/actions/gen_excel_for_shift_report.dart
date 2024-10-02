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

Future<String> genExcelForShiftReport(
  String? startdate,
  String? shopName,
  List<ShiftRecord>? docList,
) async {
  // Add your function code here!
  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];
  CellStyle boldStyle = CellStyle(bold: true);

  // Add headers to the sheet
  sheet.appendRow([
    TextCellValue('Shop Name'),
    TextCellValue(shopName ?? ''),
  ]);
/*
  sheet.appendRow([
    TextCellValue('Date & Time'),
    TextCellValue(dateTime ?? ''),
  ]);*/

  sheet.appendRow([
    TextCellValue('Date'),
    TextCellValue(startdate ?? ''),
  ]);

  // sheet.appendRow([
  //   TextCellValue('End Date'),
  //   // TextCellValue(endDate ?? ''),
  // ]);

  sheet.appendRow([TextCellValue('')]); // Add an empty row for spacing

  // Add product details to the sheet
  sheet.appendRow([
    TextCellValue('Date'),
    TextCellValue('Shift No'),
    TextCellValue('Bill Count'),
    TextCellValue('Total Sale'),
    TextCellValue('Cash Sale'),
    TextCellValue('Last Bill No'),
    TextCellValue('Tax Amount'),
    TextCellValue('Discount Amount'),
    TextCellValue('Delivery Charges'),
  ]);

  List<int> boldColumns = [0, 1];
  List<int> boldRows = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  for (int columnIndex in boldColumns) {
    var cell = sheet.cell(
        CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: columnIndex));
    cell.cellStyle = boldStyle;
  }

  for (int rowIndex in boldRows) {
    var cell = sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: rowIndex, rowIndex: 3));
    cell.cellStyle = boldStyle;
  }

  for (var product in docList!) {
    sheet.appendRow([
      TextCellValue(product.dayId),
      TextCellValue(product.shiftId.substring(11)),
      TextCellValue(product.billCount.toString()),
      TextCellValue(product.totalSale.toString()),
      TextCellValue(product.cashSale.toString()),
      TextCellValue(product.lastBillNo),
      TextCellValue(product.tax.toString()),
      TextCellValue(product.discount.toString()),
      TextCellValue(product.deliveryCharges.toString()),
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
