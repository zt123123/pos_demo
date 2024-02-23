import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void initApp([Function()? initCallback]) {
  // DB Storage Settings init...
  // 隐藏状态栏和导航栏
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  initCallback?.call();
}
