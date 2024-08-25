import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/features/shopping/domain/entities/product.dart';
import 'package:clean_architecture/features/shopping/domain/repository/product_repository.dart';

class GetProductListUseCase
    implements UseCase<DataState<List<ProductEntity>>, Map<String, dynamic>> {
  final ProductRepository _productRepository;

  GetProductListUseCase(this._productRepository);

  @override
  Future<DataState<List<ProductEntity>>> call({Map<String, dynamic>? params}) {
    return _productRepository.getProductList(params!);
  }
}
