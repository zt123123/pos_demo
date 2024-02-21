import 'package:json_annotation/json_annotation.dart';

part 'cate.g.dart';

@JsonSerializable()
class Cate {
  final int id;
  final String name;

  Cate(this.id, this.name);

  factory Cate.fromJson(Map<String, dynamic> json) => _$CateFromJson(json);
  Map<String, dynamic> toJson() => _$CateToJson(this);
}
