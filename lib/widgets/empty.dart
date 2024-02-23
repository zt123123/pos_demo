import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image(
            width: 323.w,
            height: 272.w,
            image: const NetworkImage(
                "https://si.geilicdn.com/img-496f0000018dd41750ef0a207569-unadjust_323_272.png")),
        SizedBox(
          height: 68.w,
        ),
        Text(
          "请扫描\n商品条码加购商品",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color.fromRGBO(34, 34, 34, 1),
            fontSize: 30.sp,
            fontWeight: FontWeight.w600,
            height: 1.3333333333,
          ),
        ),
        // const Text(""),
      ],
    );
  }
}
