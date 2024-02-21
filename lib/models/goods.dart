import 'package:json_annotation/json_annotation.dart';

part 'goods.g.dart';

@JsonSerializable()
class Item {
  final int id;
  final String img;
  final String name;
  final double price;
  final int stock;

  Item(this.id, this.img, this.price, this.name, this.stock);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
