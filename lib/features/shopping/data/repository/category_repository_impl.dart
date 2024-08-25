import 'dart:io';

import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/shopping/data/data_sources/shopping_api_service.dart';
import 'package:clean_architecture/features/shopping/domain/entities/category.dart';
import 'package:clean_architecture/features/shopping/domain/entities/product.dart';
import 'package:clean_architecture/features/shopping/domain/repository/category_repository.dart';
import 'package:dio/dio.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final ShoppingApiService _shoppingApiService;

  CategoryRepositoryImpl(this._shoppingApiService);

  @override
  Future<DataState<List<CategoryEntity>>> getCategoryList() async {
    try {
      final httpResponse = await _shoppingApiService.getCategoryList();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
            DioException(requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<ProductEntity>>> getProductListOfCatagory(String categoryId) async {
    try {
      final httpResponse = await _shoppingApiService.getProductListOfCategory(categoryId);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
            DioException(requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
