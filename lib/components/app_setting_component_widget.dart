import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_setting_component_model.dart';
export 'app_setting_component_model.dart';

class AppSettingComponentWidget extends StatefulWidget {
  const AppSettingComponentWidget({
    super.key,
    this.settingStruct,
    this.allSettings,
  });

  final AppSettingsStruct? settingStruct;
  final List<AppSettingsStruct>? allSettings;

  @override
  State<AppSettingComponentWidget> createState() =>
      _AppSettingComponentWidgetState();
}

class _AppSettingComponentWidgetState extends State<AppSettingComponentWidget> {
  late AppSettingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppSettingComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SwitchListTile(
        value: _model.shiftEndValue ??= widget!.settingStruct!.value,
        onChanged: (newValue) async {
          safeSetState(() => _model.shiftEndValue = newValue!);
        },
        title: Text(
          widget!.settingStruct!.display,
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
              ),
        ),
        tileColor: Color(0xFFF5F5F5),
        dense: false,
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }
}
