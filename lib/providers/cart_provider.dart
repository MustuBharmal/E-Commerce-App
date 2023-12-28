import 'package:flutter/material.dart';

import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void removeItem(dynamic productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void removeSingleItem(dynamic prodId) {
    if (!_items.containsKey(prodId)) {
      return;
    } else if (_items[prodId]!.quantity > 1) {
      _items.update(
        prodId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity - 1,
          price: existingCartItem.price,
        ),
      );
    } else {
      _items.remove(prodId);
    }
    notifyListeners();
  }

  void addItem(dynamic prodId, String title, dynamic price) {
    if (_items.containsKey(prodId.toString())) {
      _items.update(
        prodId.toString(),
        (existenceCartItem) => CartItem(
          id: existenceCartItem.id,
          title: existenceCartItem.title,
          quantity: existenceCartItem.quantity + 1,
          price: existenceCartItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        prodId.toString(),
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }
}
