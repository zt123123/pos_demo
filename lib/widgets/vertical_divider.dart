import 'package:flutter/material.dart';

class MyVerticalDivider extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final double? indent;
  final double? endIndent;

  const MyVerticalDivider({
    super.key,
    this.width,
    this.height,
    this.color,
    this.indent,
    this.endIndent,
  });

  @override
  Widget build(BuildContext context) {
    final double width = this.width ?? 1;
    final double height = this.height ?? 12;
    final Color color = this.color ?? const Color.fromRGBO(255, 255, 255, 0.2);
    final double indent = this.indent ?? 0;
    final double endIndent = this.endIndent ?? 0;

    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(left: indent, right: endIndent),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
        ),
      ),
    );
  }
}
