import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_demo/models/cart.dart';
import 'package:pos_demo/models/goods.dart';
import 'package:provider/provider.dart';

class Counter extends StatefulWidget {
  final Item item;

  const Counter(this.item, {super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    double boxWidth = 48.w;
    const borderColor = Color.fromRGBO(202, 202, 202, 1);
    double borderWidth = 1.w;
    Radius borderRadius = const Radius.circular(4).w;
    BorderSide borderSide = BorderSide(
      width: borderWidth,
      color: borderColor,
    );
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            cart.reduce(widget.item);
          },
          child: Container(
            width: boxWidth,
            height: boxWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: borderRadius,
                bottomLeft: borderRadius,
              ),
              border: Border(
                top: borderSide,
                left: borderSide,
                bottom: borderSide,
              ),
            ),
            child: const Icon(
              Icons.remove,
              size: 12,
            ),
          ),
        ),
        Container(
          width: boxWidth,
          height: boxWidth,
          decoration: BoxDecoration(
            border: Border.fromBorderSide(borderSide),
          ),
          child: Center(
            child: Text(
              "${widget.item.count}",
              style: TextStyle(
                fontSize: 24.sp,
                height: 1.2083333333,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(34, 34, 34, 1),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            cart.add(widget.item);
          },
          child: Container(
            width: boxWidth,
            height: boxWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: borderRadius,
                bottomRight: borderRadius,
              ),
              border: Border(
                top: borderSide,
                right: borderSide,
                bottom: borderSide,
              ),
            ),
            child: const Icon(
              Icons.add,
              size: 12,
            ),
          ),
        ),
      ],
    );
  }
}
