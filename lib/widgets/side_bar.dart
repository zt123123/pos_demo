import 'package:flutter/material.dart';
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
          width: 124,
          color: mainColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(
                  'https://si.geilicdn.com/pcdecorate1353977129-30ba0000017ae33591d90a201e24-unadjust_146_146.png',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "15:19",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "2017.09.12",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  height: 1.2083333333,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 30),
              const Expanded(child: SingleChildScrollView(child: MyMenu())),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.settings,
                    size: 12,
                    color: Colors.white,
                  ),
                  Container(
                    width: 1,
                    height: 12,
                    margin: const EdgeInsets.only(left: 14, right: 14),
                    child: const DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.2),
                      ),
                    ),
                  ),
                  const Icon(
                    color: Colors.white,
                    Icons.help,
                    size: 12,
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
        Positioned(
          top: 49,
          right: 0,
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 12,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
