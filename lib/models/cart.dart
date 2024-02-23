import 'package:flutter/material.dart';
import 'package:pos_demo/models/goods.dart';

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  int get itemCount => _items.length;

  double get totalPrice =>
      _items.fold(0, (total, current) => total + current.price * current.count);

  double get totalDiscount => _items.fold(
      0, (total, current) => total + current.discount * current.count);

  void add(Item item) {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      _items[index].increment();
    } else {
      _items.add(item);
      item.count = 1;
    }
    notifyListeners();
  }

  void reduce(Item item) {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (_items[index].count > 1) {
      _items[index].decrement();
    } else {
      _items.remove(item);
    }
    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearAll() {
    _items.clear();
    notifyListeners();
  }

  // factory CartModel.fromJson(Map<String, dynamic> json) =>
  //     _$CartModelFromJson(json);
  // Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
