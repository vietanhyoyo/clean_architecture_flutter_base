import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/features/food/domain/entities/product.dart';
import 'package:clean_architecture/features/food/domain/repository/product_repository.dart';

class GetProductListUseCase implements UseCase<List<ProductEntity>, void> {
  final ProductRepository _productRepository;

  GetProductListUseCase(this._productRepository);

  @override
  Future<List<ProductEntity>> call({void params}) {
    return _productRepository.getProductList();
  }
}
