// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      json['id'] as int,
      json['img'] as String,
      (json['price'] as num).toDouble(),
      json['name'] as String,
      json['stock'] as int,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'name': instance.name,
      'price': instance.price,
      'stock': instance.stock,
    };
