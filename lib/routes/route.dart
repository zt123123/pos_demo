import 'package:flutter/material.dart';
import 'package:pos_demo/pages/home.dart';
import 'package:pos_demo/pages/setting.dart';

Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(),
  "/setting": (context) => const SettingPage(),
};
