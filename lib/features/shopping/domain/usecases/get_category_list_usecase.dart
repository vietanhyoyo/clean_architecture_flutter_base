import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/features/shopping/domain/entities/category.dart';
import 'package:clean_architecture/features/shopping/domain/repository/category_repository.dart';

class GetCategoryListUseCase
    implements UseCase<DataState<List<CategoryEntity>>, void> {
  final CategoryRepository _categoryRepository;

  GetCategoryListUseCase(this._categoryRepository);

  @override
  Future<DataState<List<CategoryEntity>>> call({void params}) {
    return _categoryRepository.getCategoryList();
  }
}
