import 'package:flutter/material.dart';
import 'package:pos_demo/common/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_demo/common/utils.dart';
import 'package:pos_demo/models/cart.dart';
import 'package:pos_demo/widgets/empty.dart';
import 'package:pos_demo/widgets/item_with_counter.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Container(
      width: 600.w,
      margin: const EdgeInsets.fromLTRB(0, 16, 16, 16).w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: const BorderRadius.all(Radius.circular(36)).w,
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(34, 34, 34, 0.12),
            offset: Offset(-30.w, 0),
            blurRadius: 40.w,
          ),
          BoxShadow(
            color: const Color(0x00EEEEEE),
            offset: Offset(0, -1.w),
            blurRadius: 0,
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "购物车",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.sp,
                    height: 1.3888888889,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                  ),
                ),
                Row(
                  children: [
                    _buildActionItem("取单", Icons.list,
                        onClick: () => debugPrint('1111'), badgeCount: 5),
                    _buildActionItem("清空", Icons.delete,
                        onClick: () => cart.clearAll()),
                  ],
                )
              ],
            ),
          ),
          _buildList(context)
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Expanded(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 4,
            color: mainColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(36)).w,
        ),
        child: cart.itemCount == 0
            ? const Empty()
            : Column(children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: cart.itemCount,
                    itemBuilder: (BuildContext context, int index) {
                      final item = cart.items[index];
                      return ItemWithCounter(item);
                    },
                  ),
                ),
                _buildFooter(cart),
              ]),
      ),
    );
  }

  Widget _buildFooter(CartModel cart) {
    var textStyle = TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: const Color.fromRGBO(55, 60, 67, 1));
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18).w,
      height: 124.w,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.w,
            color: const Color.fromRGBO(234, 235, 237, 1),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("总计:", style: textStyle),
                  Text(formatPrice(cart.totalPrice),
                      style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(214, 54, 70, 1))),
                ],
              ),
              Text("共${cart.itemCount}件, 优惠${formatPrice(cart.totalDiscount)}",
                  style: textStyle),
            ],
          ),
          Container(
            width: 204.w,
            height: 88.w,
            decoration: BoxDecoration(
                color: mainColor,
                borderRadius: const BorderRadius.all(Radius.circular(16)).w),
            child: Material(
              color: Colors.transparent,
              child: Ink(
                child: InkWell(
                  onTap: () {
                    debugPrint("qwe");
                  },
                  child: Center(
                    child: Text(
                      "确认提交",
                      style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildActionItem(
    String label,
    IconData icon, {
    Function()? onClick,
    int badgeCount = 0,
  }) {
    var textWidget = Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: 28.sp,
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
              badgeCount > 0
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
