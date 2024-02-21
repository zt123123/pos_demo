import 'package:flutter/material.dart';
import 'package:pos_demo/common/constants.dart';
import 'package:pos_demo/models/cate.dart';
import 'package:pos_demo/models/goods.dart';
import 'package:pos_demo/widgets/item.dart';
import 'package:pos_demo/widgets/cart.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _selectedIndex = 0;

  final List<Cate> _cateList = [
    Cate(1, "全部"),
    Cate(2, "爆款商品"),
    Cate(3, "纯天然商品"),
    Cate(4, "生态有机禽类"),
    Cate(5, "土货辣味极致"),
  ];
  final List<Item> _itemList = [
    Item(
        1,
        "https://si.geilicdn.com/pcitem1353977129-023e0000018040c5ec7c0a231179_310_310.jpg",
        48.0,
        "五香豆腐干独家秘五香豆腐干独家秘",
        2199),
    Item(
        2,
        "https://si.geilicdn.com/pcitem1353977129-023e0000018040c5ec7c0a231179_310_310.jpg",
        48.0,
        "高原紫皮独蒜整颗",
        2199),
    Item(
        3,
        "https://si.geilicdn.com/pcitem1353977129-023e0000018040c5ec7c0a231179_310_310.jpg",
        48.0,
        "陕西大荔县糖心脆",
        2199),
    Item(
        4,
        "https://si.geilicdn.com/pcitem1353977129-023e0000018040c5ec7c0a231179_310_310.jpg",
        36.3,
        "一年等一回，昌北",
        2199),
    Item(
        5,
        "https://si.geilicdn.com/pcitem1353977129-023e0000018040c5ec7c0a231179_310_310.jpg",
        36.3,
        "五香豆腐干独家秘",
        2199),
    Item(
        6,
        "https://si.geilicdn.com/pcitem1353977129-023e0000018040c5ec7c0a231179_310_310.jpg",
        36.3,
        "高原紫皮独蒜整颗高原紫皮独蒜整颗",
        2199),
    Item(
        7,
        "https://si.geilicdn.com/pcitem1353977129-023e0000018040c5ec7c0a231179_310_310.jpg",
        36.3,
        "陕西大荔县糖心脆陕西大荔县糖心脆",
        2199),
    Item(
        8,
        "https://si.geilicdn.com/pcitem1353977129-023e0000018040c5ec7c0a231179_310_310.jpg",
        36.3,
        "一年等一回，昌北",
        2199),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSearch(),
                const SizedBox(height: 16),
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
                      spacing: 12,
                      runSpacing: 12,
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
    );
  }

  Widget _buildSearch() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(34, 34, 34, 0.12),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
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
            onSubmitted: (String value) {
              print(value);
            },
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(34, 34, 34, 1),
              height: 1.1428571429,
            ),
            decoration: const InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "搜索商品",
              hintStyle: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(34, 34, 34, 0.3),
                height: 1.1428571429,
              ),
            ),
          ))
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
        margin: const EdgeInsets.only(right: 6),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 6,
        ),
        decoration: BoxDecoration(
            color: index == _selectedIndex
                ? mainColor
                : const Color.fromRGBO(244, 244, 244, 1),
            borderRadius: const BorderRadius.all(Radius.circular(14))),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: index == _selectedIndex
                  ? Colors.white
                  : const Color.fromRGBO(34, 34, 34, 1),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
              height: 1.4166666667),
        ),
      ),
    );
  }
}
