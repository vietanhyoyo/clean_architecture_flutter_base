import 'package:clean_architecture/features/food/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProduct(String id);
}
