import 'package:clean_architecture/core/constants/constants.dart';
import 'package:clean_architecture/features/shopping/data/models/auth.dart';
import 'package:clean_architecture/features/shopping/data/models/category.dart';
import 'package:clean_architecture/features/shopping/data/models/product.dart';
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

  @GET('/mobile/categories/{id}/products')
  Future<HttpResponse<List<ProductModel>>> getProductListOfCategory(
      @Path("id") String id);

  @POST('/auth/login')
  Future<HttpResponse<AuthModel>> postLogin(
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/mobile/products')
  Future<HttpResponse<List<ProductModel>>> getProductList(
    @Queries() Map<String, dynamic> queries,
  );
}
