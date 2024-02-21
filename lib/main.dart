import 'package:flutter/material.dart';
import 'package:pos_demo/common/init.dart';
import 'package:pos_demo/routes/route.dart';

void main() {
  initApp(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "pos demo",
      initialRoute: '/',
      routes: routes,
    );
  }
}
