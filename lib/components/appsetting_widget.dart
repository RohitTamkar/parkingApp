import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appsetting_model.dart';
export 'appsetting_model.dart';

class AppsettingWidget extends StatefulWidget {
  const AppsettingWidget({
    super.key,
    this.struct,
    this.alldoc,
  });

  final AppSettingsStruct? struct;
  final List<AppSettingsStruct>? alldoc;

  @override
  State<AppsettingWidget> createState() => _AppsettingWidgetState();
}

class _AppsettingWidgetState extends State<AppsettingWidget> {
  late AppsettingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppsettingModel());

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
        value: _model.switchListTilecheckInOutValue ??= widget!.struct!.value,
        onChanged: (newValue) async {
          safeSetState(() => _model.switchListTilecheckInOutValue = newValue!);
          if (newValue!) {
            _model.appsttingupdate = await actions.appSettingUpdate(
              AppSettingsStruct(
                title: widget!.struct?.title,
                value: _model.switchListTilecheckInOutValue,
                display: widget!.struct?.display,
                isDeleted: widget!.struct?.isDeleted,
              ),
              widget!.alldoc!.toList(),
            );
            FFAppState().appSettings =
                _model.appsttingupdate!.toList().cast<AppSettingsStruct>();
            safeSetState(() {});

            safeSetState(() {});
          } else {
            _model.appsttingupdateCopy = await actions.appSettingUpdate(
              AppSettingsStruct(
                title: widget!.struct?.title,
                value: _model.switchListTilecheckInOutValue,
                display: widget!.struct?.display,
                isDeleted: widget!.struct?.isDeleted,
              ),
              widget!.alldoc!.toList(),
            );
            FFAppState().appSettings =
                _model.appsttingupdateCopy!.toList().cast<AppSettingsStruct>();
            safeSetState(() {});

            safeSetState(() {});
          }
        },
        title: Text(
          widget!.struct!.display,
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
              ),
        ),
        tileColor: Color(0xFFF5F5F5),
        dense: true,
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }
}
