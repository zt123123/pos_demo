import 'package:flutter/material.dart';
import 'package:pos_demo/common/bus.dart' show bus;
import 'package:pos_demo/screens/analyze.dart';
import 'package:pos_demo/screens/order.dart';
import 'package:pos_demo/screens/pay.dart';
import 'package:pos_demo/widgets/side_bar.dart';
import 'package:pos_demo/screens/product.dart';
import 'package:pos_demo/screens/customer.dart';

const List<Widget> _pages = [
  ProductScreen(),
  PayScreen(),
  OrderScreen(),
  CustomerScreen(),
  AnalyzeScreen(),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageViewController = PageController();

  @override
  void initState() {
    super.initState();

    bus.on("CHANGE_MENU", (index) {
      _pageViewController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // 避免软键盘弹出界面被压缩
      resizeToAvoidBottomInset: false,
      body: Row(
        children: [
          const SideBar(),
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _pages.length,
              controller: _pageViewController,
              itemBuilder: (context, index) {
                return _pages[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
