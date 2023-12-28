import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app_flutter/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _items = [];

  Future<void> fetchAndSetProduct() async {
    Uri uri = Uri.parse('https://fakestoreapi.com/products/');
    try {
      final response = await http.get(uri);
    final List<dynamic> extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData.isEmpty) {
        return;
      }
      final List<ProductModel> loadedProducts = [];
      for (var prodData in extractedData) {
        loadedProducts.add(ProductModel.fromJson(prodData));
      }
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  List<ProductModel> get items {
    return [..._items];
  }

  ProductModel findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
