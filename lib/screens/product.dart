import 'package:flutter/material.dart';
import 'package:pos_demo/common/constants.dart';
import 'package:pos_demo/models/cart.dart';
import 'package:pos_demo/models/cate.dart';
import 'package:pos_demo/models/goods.dart';
import 'package:pos_demo/widgets/item.dart';
import 'package:pos_demo/widgets/cart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_demo/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with AutomaticKeepAliveClientMixin {
  int _selectedIndex = 0;
  List<Item> _itemList = [];
  List<Cate> _cateList = [];

  @override
  void initState() {
    super.initState();

    _initData();
  }

  void _initData() {
    _itemList = List.generate(20, (index) {
      return Item(
        id: index + 1,
        img:
            "https://si.geilicdn.com/pcitem1353977129-023e0000018040c5ec7c0a231179_310_310.jpg",
        price: index + 1,
        name: "五香豆腐干${index + 1}",
        stock: index + 10,
        discount: 0.1,
        desc: "${index + 1}灰色",
      );
    });

    _cateList = [
      Cate(1, "全部"),
      Cate(2, "爆款商品"),
      Cate(3, "纯天然商品"),
      Cate(4, "生态有机禽类"),
      Cate(5, "土货辣味极致"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 36).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchInput(onSubmit: (value) {
                    debugPrint(value);
                  }),
                  SizedBox(height: 32.w),
                  Wrap(
                    children: List.generate(
                        _cateList.length,
                        (index) =>
                            _buildCateButton(index, _cateList[index].name)),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 24.w,
                        runSpacing: 24.w,
                        children: List.generate(_itemList.length,
                            (index) => ItemCard(item: _itemList[index])),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Cart(),
        ],
      ),
    );
  }

  Widget _buildCateButton(int index, String name) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12).w,
        padding: EdgeInsets.symmetric(
          horizontal: 32.w,
          vertical: 11.w,
        ),
        decoration: BoxDecoration(
            color: index == _selectedIndex
                ? mainColor
                : const Color.fromRGBO(244, 244, 244, 1),
            borderRadius: const BorderRadius.all(Radius.circular(28)).w),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: index == _selectedIndex
                  ? Colors.white
                  : const Color.fromRGBO(34, 34, 34, 1),
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
              height: 1.4166666667),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
