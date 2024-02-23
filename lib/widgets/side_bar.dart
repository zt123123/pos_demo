import 'package:flutter/material.dart';
import 'package:pos_demo/widgets/date_display.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_demo/widgets/vertical_divider.dart';
import 'package:pos_demo/widgets/menu.dart';
import 'package:pos_demo/common/constants.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 248.w,
          color: mainColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 65.w),
              CircleAvatar(
                radius: 44.w,
                backgroundImage: const NetworkImage(
                  'https://si.geilicdn.com/pcdecorate1353977129-30ba0000017ae33591d90a201e24-unadjust_146_146.png',
                ),
              ),
              SizedBox(height: 40.w),
              const DateTimeDisplay(),
              SizedBox(height: 60.w),
              const Expanded(child: SingleChildScrollView(child: MyMenu())),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/setting");
                    },
                    child: Icon(
                      Icons.settings,
                      size: 24.w,
                      color: Colors.white,
                    ),
                  ),
                  MyVerticalDivider(
                    indent: 28.w,
                    endIndent: 28.w,
                  ),
                  Icon(
                    color: Colors.white,
                    Icons.help,
                    size: 24.w,
                  ),
                ],
              ),
              SizedBox(height: 48.w),
            ],
          ),
        ),
        Positioned(
          top: 98.w,
          right: 0,
          child: Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ).w,
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 24.w,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
