import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/shopping/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<DataState<List<CategoryEntity>>> getCategoryList();
}
