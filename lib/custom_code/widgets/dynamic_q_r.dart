// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:qr_flutter/qr_flutter.dart';

class DynamicQR extends StatefulWidget {
  const DynamicQR({
    super.key,
    this.width,
    this.height,
    required this.data,
    required this.size,
  });

  final double? width;
  final double? height;
  final String data;
  final double size;

  @override
  State<DynamicQR> createState() => _DynamicQRState();
}

class _DynamicQRState extends State<DynamicQR> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        child: QrImageView(
          data: widget.data.toString(),
          version: QrVersions.auto,
          size: widget.size,
        ));
  }
}
