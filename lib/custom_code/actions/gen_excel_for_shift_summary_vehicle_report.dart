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

import 'dart:convert';

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';

Future<String> genExcelForShiftSummaryVehicleReport(
  String? startdate,
  String? shopName,
  List<InvoiceRecord>? docList,
  String? enddate,
  String? branch,
  String shiftVehicleType,
  String shiftIdDate,
) async {
  // Add your function code here!
  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];
  CellStyle boldStyle = CellStyle(bold: true);

  double count = 0;
  String vechicleNo = "";
  String shiftId = "";
  double totalAmount = 0;

  for (var product in docList!) {
    count += product.count;
    vechicleNo += product.vechicleNo;
    shiftId += product.shiftId;
    totalAmount += product.finalBillAmt;
  }

  // Add headers to the sheet
  sheet.appendRow([
    TextCellValue('Bill Summary Report'),
  ]);
  sheet.appendRow([
    TextCellValue('Shop Name'),
    TextCellValue(shopName ?? ''),
  ]);

  sheet.appendRow([
    TextCellValue('Branch Name'),
    TextCellValue(branch ?? ''),
  ]);

  sheet.appendRow([
    TextCellValue('Start Date'),
    TextCellValue(startdate ?? ''),
  ]);

  sheet.appendRow([
    TextCellValue('Vehicle Type'),
    TextCellValue(shiftVehicleType ?? ''),
  ]);

  sheet.appendRow([
    TextCellValue('Shift Id'),
    TextCellValue(shiftIdDate ?? ''),
  ]);

  sheet.appendRow([
    TextCellValue('End Date'),
    TextCellValue(enddate ?? ''),
  ]);

  sheet.appendRow([
    TextCellValue('Total Amount'),
    TextCellValue(totalAmount.toString()),
  ]);

  sheet.appendRow([TextCellValue('')]); // Add an empty row for spacing

  // Add product details to the sheet
  sheet.appendRow([
    TextCellValue('Count'),
    TextCellValue('Vechicle No'),
    TextCellValue('Shift Id'),
    TextCellValue('Net Amount'),
  ]);

  List<int> boldColumns = [0, 1, 2, 3];
  List<int> boldRows = [1, 2, 3, 4, 5];

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
    final timestamp = int.tryParse(product.shiftId ?? '0') ??
        0; // Parse string to int, default to 0 if null or invalid
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final formattedDate = DateFormat('dd-MM-yyyy').format(date);

    sheet.appendRow([
      TextCellValue(product.count.toString()),
      TextCellValue(product.vechicleNo),
      TextCellValue(formattedDate),
      TextCellValue(product.finalBillAmt.toString()),
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
