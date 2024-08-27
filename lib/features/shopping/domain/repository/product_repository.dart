import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/shopping/domain/entities/product.dart';

abstract class ProductRepository {
  Future<DataState<List<ProductEntity>>> getProductList(Map<String, dynamic> params);
  Future<DataState<ProductEntity>> getProductDetails(String params);
}
