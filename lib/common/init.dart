import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void initApp(Function() initCallback) {
  // DB Storage Settings init...
  WidgetsFlutterBinding.ensureInitialized();
  // 隐藏状态栏和导航栏  上方黑板
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  initCallback();
}
