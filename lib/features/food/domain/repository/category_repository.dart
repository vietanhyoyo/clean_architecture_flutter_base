import 'package:clean_architecture/features/food/domain/entities/category.dart';
import 'package:clean_architecture/features/food/domain/entities/product.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getCategoryList();
  Future<List<ProductEntity>> getProductsByCategory(String id);
}
