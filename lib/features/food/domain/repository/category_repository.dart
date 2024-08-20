import 'package:clean_architecture/features/food/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getCategoryList();
}
