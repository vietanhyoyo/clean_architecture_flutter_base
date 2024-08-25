import 'dart:io';

import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/shopping/data/data_sources/shopping_api_service.dart';
import 'package:clean_architecture/features/shopping/domain/entities/product.dart';
import 'package:clean_architecture/features/shopping/domain/repository/product_repository.dart';
import 'package:dio/dio.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ShoppingApiService _shoppingApiService;

  ProductRepositoryImpl(this._shoppingApiService);

  @override
  Future<DataState<List<ProductEntity>>> getProductList(
      Map<String, dynamic> params) async {
    try {
      final httpResponse = await _shoppingApiService.getProductList(params);

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
