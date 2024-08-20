import 'dart:convert';

import 'package:clean_architecture/features/food/data/models/category.dart';
import 'package:clean_architecture/features/food/data/models/product.dart';
import 'package:flutter/services.dart';

class CategoryService {
  Future<List<CategoryModel>> getCategoryList() async {
    final String response =
        await rootBundle.loadString("assets/jsons/category.json");

    final List<dynamic> data = await json.decode(response);

    final List<CategoryModel> categoryData = data.map((item) {
      return CategoryModel.fromJson(item);
    }).toList();

    return categoryData;
  }

  Future<List<ProductModel>> getProductsByCategory(String id) async {
    final String response =
        await rootBundle.loadString("assets/jsons/product.json");

    final List<dynamic> data = await json.decode(response);

    final List<ProductModel> productData =
        data.where((item) => item["categoryId"] == id).map((item) {
      return ProductModel.fromJson(item);
    }).toList();

    return productData;
  }
}
