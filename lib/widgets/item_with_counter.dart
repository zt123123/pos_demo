import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_demo/common/constants.dart';
import 'package:pos_demo/common/utils.dart';
import 'package:pos_demo/models/cart.dart';
import 'package:pos_demo/models/goods.dart';
import 'package:pos_demo/widgets/counter.dart';
import 'package:provider/provider.dart';

class ItemWithCounter extends StatefulWidget {
  final Item item;
  const ItemWithCounter(this.item, {super.key});

  @override
  State<ItemWithCounter> createState() => _ItemWithCounterState();
}

class _ItemWithCounterState extends State<ItemWithCounter> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Padding(
      padding: const EdgeInsets.all(24).w,
      child: IntrinsicHeight(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8).w,
              child: Image.network(
                widget.item.img,
                width: 104.w,
                height: 104.w,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4).w,
                      child: Text(
                        widget.item.name,
                        style: TextStyle(
                            color: const Color.fromRGBO(34, 34, 34, 1),
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.4166666667),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12).w,
                      child: Text(widget.item.desc,
                          style: TextStyle(
                              color: const Color.fromRGBO(34, 34, 34, 1),
                              fontSize: 22.sp,
                              fontWeight: FontWeight.normal,
                              height: 1.3636363636)),
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: formatPrice(widget.item.price),
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.06666666667)),
                      const TextSpan(text: " "),
                      TextSpan(
                          text: formatPrice(widget.item.discount),
                          style: TextStyle(
                              color: const Color.fromRGBO(34, 34, 34, 1),
                              decoration: TextDecoration.lineThrough,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.normal,
                              height: 1.3636363636)),
                    ])),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    cart.remove(widget.item);
                  },
                  child: const Icon(Icons.delete, size: 12),
                ),
                Counter(widget.item)
              ],
            )
          ],
        ),
      ),
    );
  }
}
