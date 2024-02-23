import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTimeDisplay extends StatefulWidget {
  const DateTimeDisplay({super.key});

  @override
  State<DateTimeDisplay> createState() => _DateTimeDisplayState();
}

class _DateTimeDisplayState extends State<DateTimeDisplay> {
  late Timer _timer;
  String _currentTime = "";
  String _currentDate = "";

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateTime());
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void _updateTime() {
    var currentTime = DateFormat.Hm().format(DateTime.now());
    var currentDate = DateFormat('yyyy.MM.dd').format(DateTime.now());
    if (currentTime != _currentTime) {
      setState(() {
        _currentTime = currentTime;
      });
    }
    if (currentDate != _currentDate) {
      setState(() {
        _currentDate = currentDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _currentTime,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.sp,
            fontWeight: FontWeight.w500,
            height: 1.2,
            decoration: TextDecoration.none,
          ),
        ),
        SizedBox(height: 12.w),
        Text(
          _currentDate,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.normal,
            color: const Color.fromRGBO(255, 255, 255, 0.8),
            height: 1.2083333333,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}
