import 'package:clean_architecture/features/food/data/data_sources/category_service.dart';
import 'package:clean_architecture/features/food/domain/entities/category.dart';
import 'package:clean_architecture/features/food/domain/entities/product.dart';
import 'package:clean_architecture/features/food/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryService _categoryService;

  CategoryRepositoryImpl(this._categoryService);

  @override
  Future<List<CategoryEntity>> getCategoryList() async {
    final httpResponse = await _categoryService.getCategoryList();
    return httpResponse;
  }
  
  @override
  Future<List<ProductEntity>> getProductsByCategory(String id) async {
    final httpResponse = await _categoryService.getProductsByCategory(id);
    return httpResponse;
  }
}
