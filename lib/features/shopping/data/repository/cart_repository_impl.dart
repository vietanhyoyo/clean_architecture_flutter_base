import 'dart:io';

import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/shopping/data/data_sources/remote/shopping_api_service.dart';
import 'package:clean_architecture/features/shopping/domain/entities/bill.dart';
import 'package:clean_architecture/features/shopping/domain/repository/cart_repository.dart';
import 'package:dio/dio.dart';

class CartRepositoryImpl implements CartRepository {
  final ShoppingApiService _shoppingApiService;

  CartRepositoryImpl(this._shoppingApiService);

  @override
  Future<DataState<BillEntity>> postMakeOrder(
      Map<String, dynamic> params) async {
    try {
      final httpResponse = await _shoppingApiService.postMakeOrder(params);

      if (httpResponse.response.statusCode == HttpStatus.created) {
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
