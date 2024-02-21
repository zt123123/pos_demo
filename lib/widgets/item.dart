import 'package:flutter/material.dart';
import 'package:pos_demo/common/utils.dart';
import 'package:pos_demo/models/goods.dart';
import 'package:transparent_image/transparent_image.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 113,
      height: 178,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 0.5,
          color: const Color.fromRGBO(34, 34, 34, 0.12),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Column(
        children: [
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: item.img,
            fit: BoxFit.cover,
            width: 113,
            height: 113,
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            height: 1.3333333333,
                            color: Color.fromRGBO(34, 34, 34, 1),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          formatPrice(item.price),
                          style: const TextStyle(
                            fontSize: 12,
                            height: 1.3333333333,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(214, 54, 70, 1),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Text(
                        "库存${item.stock}",
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.normal,
                          height: 1.4444444444,
                          color: Color.fromRGBO(34, 34, 34, 0.5),
                          decoration: TextDecoration.none,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: GestureDetector(
                    onTap: () {
                      print("object");
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(242, 242, 242, 0.5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
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
