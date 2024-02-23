import 'package:json_annotation/json_annotation.dart';

part 'goods.g.dart';

@JsonSerializable()
class Item {
  final int id;
  final String img;
  final String name;
  final double price;
  final int stock;
  final double discount;
  final String desc;
  int count;

  Item({
    required this.id,
    required this.img,
    required this.price,
    required this.name,
    required this.stock,
    required this.discount,
    required this.desc,
    this.count = 0,
  });

  void increment() {
    if (count < stock) {
      count++;
    }
  }

  void decrement() {
    if (count > 0) {
      count--;
    }
  }

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
