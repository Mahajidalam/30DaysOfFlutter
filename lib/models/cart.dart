import 'package:flutter/foundation.dart';
import 'package:flutter_catalog/models/catelog.dart';

class CartModel {

  // static final cartModel = CartModel._internal();

  // CartModel._internal();

  // factory CartModel() => cartModel;

  // Catelog field
  late CatelogModel _catelog;

  // Collection of Ids / Store id of each item
  final List<int> _itemIds = [];

  // Get catelog
  CatelogModel get catelog => _catelog;

  set catelog(CatelogModel newCatelog) {
    assert(newCatelog != null);
    _catelog = newCatelog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catelog.getById(id)).toList();

  // Get total price
  num get totalPrice => items.fold(0, (total, correct)=> total += correct.price);

  // Add Item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
