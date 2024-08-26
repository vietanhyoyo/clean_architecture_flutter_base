import 'dart:io';

import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/shopping/data/data_sources/remote/shopping_api_service.dart';
import 'package:clean_architecture/features/shopping/domain/entities/slider.dart';
import 'package:clean_architecture/features/shopping/domain/repository/slider_repository.dart';
import 'package:dio/dio.dart';

class SliderRepositoryImpl implements SliderRepository {
  final ShoppingApiService _shoppingApiService;

  SliderRepositoryImpl(this._shoppingApiService);

  @override
  Future<DataState<List<SliderEntity>>> getSliders() async {
    try {
      final httpResponse = await _shoppingApiService.getSliders();

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
