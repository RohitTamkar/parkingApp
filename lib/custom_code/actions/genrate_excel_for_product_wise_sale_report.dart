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

Future<String> genrateExcelForProductWiseSaleReport(
  List<dynamic> jsonproduct,
  String? startdate,
  String? shopName,
) async {
  // Add your function code here!
  double totalAmount = 0;
  double totalQty = 0;
  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];
  CellStyle boldStyle = CellStyle(bold: true);

  for (var product in jsonproduct) {
    totalQty += product['quantity'];
    totalAmount += product['total'];
  }

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
    TextCellValue('Report Date'),
    TextCellValue(startdate ?? ''),
  ]);

  sheet.appendRow([
    TextCellValue('Total Amount'),
    TextCellValue(totalAmount.toString() ?? ''),
  ]);
  sheet.appendRow([
    TextCellValue('Total Quantity'),
    TextCellValue(totalQty.toString() ?? ''),
  ]);
  sheet.appendRow([TextCellValue('')]); // Add an empty row for spacing

  // Add product details to the sheet
  sheet.appendRow([
    TextCellValue('Product Name'),
    TextCellValue('Quantity'),
    TextCellValue('Price'),
    TextCellValue('Total'),
  ]);

  List<int> boldColumns = [0, 1, 2, 3];
  List<int> boldRows = [0, 1, 2, 3];

  for (int columnIndex in boldColumns) {
    var cell = sheet.cell(
        CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: columnIndex));
    cell.cellStyle = boldStyle;
  }

  for (int rowIndex in boldRows) {
    var cell = sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: rowIndex, rowIndex: 5));
    cell.cellStyle = boldStyle;
  }

  for (var product in jsonproduct) {
    sheet.appendRow([
      TextCellValue(product['name'].toString()),
      TextCellValue(product['quantity'].toString()),
      TextCellValue(product['price'].toString()),
      TextCellValue(product['total'].toString()),
    ]);
  }

  sheet.appendRow([TextCellValue('')]);
  sheet.appendRow([TextCellValue('')]);

  var fileBytes = excel.encode();

  // Convert bytes to base64
  var base64String = base64Encode(fileBytes!);

  // Prepare data URI
  var dataUri =
      'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,$base64String';
  print(dataUri);
  return dataUri;
}
