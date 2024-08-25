import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/features/shopping/domain/entities/product.dart';
import 'package:clean_architecture/features/shopping/domain/repository/category_repository.dart';

class GetProductListOfCategoryUseCase
    implements UseCase<DataState<List<ProductEntity>>, String> {
  final CategoryRepository _categoryRepository;

  GetProductListOfCategoryUseCase(this._categoryRepository);

  @override
  Future<DataState<List<ProductEntity>>> call({String? params}) {
    return _categoryRepository.getProductListOfCatagory(params ?? "");
  }
}
