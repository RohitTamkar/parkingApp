import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'o_t_pverification_new_p_widget.dart' show OTPverificationNewPWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OTPverificationNewPModel
    extends FlutterFlowModel<OTPverificationNewPWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for MObileTextField widget.
  FocusNode? mObileTextFieldFocusNode;
  TextEditingController? mObileTextFieldTextController;
  String? Function(BuildContext, String?)?
      mObileTextFieldTextControllerValidator;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // State field(s) for TimerOTP widget.
  final timerOTPInitialTimeMs = 60000;
  int timerOTPMilliseconds = 60000;
  String timerOTPValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerOTPController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserProfileRecord? docUID;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserProfileRecord? docId;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    mObileTextFieldFocusNode?.dispose();
    mObileTextFieldTextController?.dispose();

    pinCodeController?.dispose();
    timerOTPController.dispose();
  }
}
