import 'package:flutter/material.dart';
import 'package:pos_demo/common/bus.dart';

var bus = EventBus();

class MyMenu extends StatefulWidget {
  const MyMenu({super.key});

  @override
  _MyMenuState createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _menuList = [
    {"icon": Icons.home, "title": '商品下单'},
    {"icon": Icons.download, "title": '一键收款'},
    {"icon": Icons.menu, "title": '订单管理'},
    {"icon": Icons.person, "title": '客户管理'},
    {"icon": Icons.bar_chart_rounded, "title": '经营分析'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(_menuList.length, (index) {
      var item = _menuList[index];
      return _buildMenuButton(
        index,
        item["icon"],
        item["title"],
      );
    }));
  }

  Widget _buildMenuButton(int index, IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        bus.emit("CHANGE_MENU", index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: 108,
        height: 36,
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? const Color.fromRGBO(255, 255, 255, 0.2)
              : null,
          borderRadius: BorderRadius.circular(_selectedIndex == index ? 18 : 0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 18,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  height: 1.2083333333,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
