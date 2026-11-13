import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final engine = createAgoraRtcEngine();
  await engine.initialize(const RtcEngineContext(appId: 'wasm-probe'));
  runApp(const SizedBox.shrink());
}
