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

Future<String> genExcelForCategoryWiseReport(
  List<dynamic> jsonproduct,
  String? startdate,
  String? shopName,
) async {
  // Add your function code here!
  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];
  double totalAmount = 0;

  CellStyle boldStyle = CellStyle(bold: true);

  for (var cater in jsonproduct.first['details']) {
    var categoryDetails = cater['category'];
    totalAmount += categoryDetails['catTotal'];
  }

  sheet.appendRow([
    TextCellValue('Shop Name'),
    TextCellValue(shopName ?? ''),
  ]);
  sheet.appendRow([
    TextCellValue('Report Date'),
    TextCellValue(startdate ?? ''),
  ]);
  sheet.appendRow([
    TextCellValue('Total Amount'),
    TextCellValue(totalAmount.toString() ?? ''),
  ]);

  sheet.appendRow([TextCellValue('')]);

  sheet.appendRow([
    TextCellValue('Category Name'),
    TextCellValue('Total Amount'),
    TextCellValue('Product Name'),
    TextCellValue('Quantity'),
    TextCellValue('Price'),
    TextCellValue('Total')
  ]);

  List<int> boldColumns = [0, 1, 2];
  List<int> boldRows = [0, 1, 2, 3, 4, 5];

  for (int columnIndex in boldColumns) {
    var cell = sheet.cell(
        CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: columnIndex));
    cell.cellStyle = boldStyle;
  }

  for (int rowIndex in boldRows) {
    var cell = sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: rowIndex, rowIndex: 4));
    cell.cellStyle = boldStyle;
  }

  for (var cater in jsonproduct.first['details']) {
    var categoryDetails = cater['category'];
    sheet.appendRow([
      TextCellValue(categoryDetails['catName']),
      TextCellValue(categoryDetails['catTotal'].toString()),
    ]);

    List products = cater['products'];
    for (var product in products) {
      sheet.appendRow([
        TextCellValue(''),
        TextCellValue(''),
        TextCellValue(product['name']),
        TextCellValue(product['quantity'].toString()),
        TextCellValue(product['price'].toString()),
        TextCellValue(product['total'].toString()),
      ]);
    }
    sheet.appendRow([TextCellValue('')]);
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
