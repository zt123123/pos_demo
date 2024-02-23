import 'package:flutter/material.dart';
import 'package:pos_demo/common/utils.dart';
import 'package:pos_demo/models/cart.dart';
import 'package:pos_demo/models/goods.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 226.w,
      height: 356.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1.w,
          color: const Color.fromRGBO(34, 34, 34, 0.12),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Column(
        children: [
          FadeInImage.memoryNetwork(
            fadeInDuration: const Duration(milliseconds: 300),
            placeholder: kTransparentImage,
            image: item.img,
            fit: BoxFit.cover,
            width: 226.w,
            height: 226.w,
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 0).w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.normal,
                          height: 1.3333333333,
                          color: const Color.fromRGBO(34, 34, 34, 1),
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 4).w,
                        child: Text(
                          formatPrice(item.price),
                          style: TextStyle(
                            fontSize: 24.sp,
                            height: 1.3333333333,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(214, 54, 70, 1),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Text(
                        "库存${item.stock}",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                          height: 1.4444444444,
                          color: const Color.fromRGBO(34, 34, 34, 0.5),
                          decoration: TextDecoration.none,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 16.w,
                  bottom: 16.w,
                  child: GestureDetector(
                    onTap: () {
                      debugPrint("object");
                      Provider.of<CartModel>(context, listen: false).add(item);
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(242, 242, 242, 0.5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(40),
                        ).w,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 14,
                        color: Color.fromRGBO(34, 33, 38, 1),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
