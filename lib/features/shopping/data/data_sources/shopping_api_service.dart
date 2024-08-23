import 'package:clean_architecture/core/constants/constants.dart';
import 'package:clean_architecture/features/shopping/data/models/category.dart';
import 'package:clean_architecture/features/shopping/data/models/slider.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'shopping_api_service.g.dart';

@RestApi(baseUrl: shoppingBaseURL)
abstract class ShoppingApiService {
  factory ShoppingApiService(Dio dio) = _ShoppingApiService;

  @GET('/mobile/sliders')
  Future<HttpResponse<List<SliderModel>>> getSliders();

  @GET('/mobile/categories')
  Future<HttpResponse<List<CategoryModel>>> getCategoryList();
}
