import 'dart:convert';

import 'package:clean_architecture/features/food/data/models/product.dart';
import 'package:flutter/services.dart';

class ProductService {
  Future<ProductModel> getProduct(String id) async {
    final String response =
        await rootBundle.loadString("assets/jsons/product.json");

    final List<dynamic> data = await json.decode(response);
    final productData =
        data.firstWhere((element) => element['id'] == id, orElse: () => null);

    return ProductModel.fromJson(productData);
  }

  Future<List<ProductModel>> getProductList() async {
    final String response =
        await rootBundle.loadString("assets/jsons/product.json");

    final List<dynamic> data = await json.decode(response);

    final List<ProductModel> productData = data.map((item) {
      return ProductModel.fromJson(item);
    }).toList();

    return productData;
  }
}
