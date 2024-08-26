import 'dart:io';

import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/shopping/data/data_sources/remote/shopping_api_service.dart';
import 'package:clean_architecture/features/shopping/domain/entities/bill.dart';
import 'package:clean_architecture/features/shopping/domain/repository/order_repository.dart';
import 'package:dio/dio.dart';

class OrderRepositoryImpl implements OrderRepository {
  final ShoppingApiService _shoppingApiService;

  OrderRepositoryImpl(this._shoppingApiService);

  @override
  Future<DataState<List<BillEntity>>> getHistory() async {
    try {
      final httpResponse = await _shoppingApiService.getHistory();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print("ok");
        return DataSuccess(httpResponse.data);
      } else {
        print("false");

        return DataFailed(
            DioException(requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
        print(e);

      return DataFailed(e);
    }
  }
}
