import 'package:flutter/material.dart';
import 'package:pos_demo/common/constants.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 254,
      margin: const EdgeInsets.fromLTRB(0, 8, 8, 8),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.all(Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(34, 34, 34, 0.12),
            offset: Offset(-15, 0),
            blurRadius: 20,
          ),
          BoxShadow(
            color: Color(0x00eeeeee),
            offset: Offset(0, -0.5),
            blurRadius: 0,
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "购物车",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    height: 1.3888888889,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                  ),
                ),
                Row(
                  children: [
                    _buildActionItem(
                        Icons.list, "取单", () => print('1111'), true),
                    _buildActionItem(
                        Icons.delete, "清空", () => print('2222'), false),
                  ],
                )
              ],
            ),
          ),
          _buildList()
        ],
      ),
    );
  }

  Widget _buildList() {
    return Expanded(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 4,
            color: mainColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(18)),
        ),
      ),
    );
  }

  Widget _buildActionItem(
    IconData icon,
    String label,
    Function() onClick,
    bool hasBadge,
  ) {
    var textWidget = Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        height: 1.2142857143,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
      ),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.white.withAlpha(100)),
          ),
          onPressed: onClick,
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 14,
              ),
              const SizedBox(width: 6),
              hasBadge
                  ? Badge.count(
                      count: 5,
                      offset: const Offset(10, -8),
                      backgroundColor: Colors.white,
                      textColor: mainColor,
                      child: textWidget,
                    )
                  : textWidget
            ],
          ),
        )
      ],
    );
  }
}
