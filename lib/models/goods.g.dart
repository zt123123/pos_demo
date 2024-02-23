// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as int,
      img: json['img'] as String,
      price: (json['price'] as num).toDouble(),
      name: json['name'] as String,
      stock: json['stock'] as int,
      discount: (json['discount'] as num).toDouble(),
      desc: json['desc'] as String,
      count: json['count'] as int? ?? 0,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'name': instance.name,
      'price': instance.price,
      'stock': instance.stock,
      'discount': instance.discount,
      'desc': instance.desc,
      'count': instance.count,
    };
