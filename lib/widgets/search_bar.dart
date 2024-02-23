import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInput extends StatefulWidget {
  final ValueChanged<String> onSubmit;
  const SearchInput({super.key, required this.onSubmit});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 972.w,
      height: 64.w,
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
      ).w,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(34, 34, 34, 0.12),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)).w,
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              color: Color.fromRGBO(34, 34, 34, 0.3),
              Icons.search,
              size: 14,
            ),
          ),
          Expanded(
              child: TextField(
            cursorColor: Colors.black,
            cursorWidth: 1,
            onSubmitted: _onSubmit,
            style: TextStyle(
              fontSize: 28.sp,
              color: const Color.fromRGBO(34, 34, 34, 1),
              height: 1.1428571429,
            ),
            decoration: InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "搜索商品",
              hintStyle: TextStyle(
                fontSize: 28.sp,
                color: const Color.fromRGBO(34, 34, 34, 0.3),
                height: 1.1428571429,
              ),
            ),
          ))
        ],
      ),
    );
  }

  void _onSubmit(String value) {
    widget.onSubmit(value);
  }
}
