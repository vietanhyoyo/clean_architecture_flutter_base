import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/features/food/domain/entities/category.dart';
import 'package:clean_architecture/features/food/domain/repository/category_repository.dart';

class GetCategoryListUseCase implements UseCase<List<CategoryEntity>, void> {
  final CategoryRepository _categoryRepository;

  GetCategoryListUseCase(this._categoryRepository);

  @override
  Future<List<CategoryEntity>> call({void params}) {
    return _categoryRepository.getCategoryList();
  }
}
