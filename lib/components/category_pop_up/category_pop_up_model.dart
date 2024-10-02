import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'category_pop_up_widget.dart' show CategoryPopUpWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class CategoryPopUpModel extends FlutterFlowModel<CategoryPopUpWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldsearch widget.
  FocusNode? textFieldsearchFocusNode;
  TextEditingController? textFieldsearchTextController;
  String? Function(BuildContext, String?)?
      textFieldsearchTextControllerValidator;
  List<CategoryMasterRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldsearchFocusNode?.dispose();
    textFieldsearchTextController?.dispose();
  }
}
