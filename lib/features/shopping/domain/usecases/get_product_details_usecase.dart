import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/features/shopping/domain/entities/product.dart';
import 'package:clean_architecture/features/shopping/domain/repository/product_repository.dart';

class GetProductDetailsUseCase
    implements UseCase<DataState<ProductEntity>, String> {
  final ProductRepository _productRepository;

  GetProductDetailsUseCase(this._productRepository);

  @override
  Future<DataState<ProductEntity>> call({String? params}) {
    return _productRepository.getProductDetails(params ?? "");
  }
}
