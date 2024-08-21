import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/features/food/domain/entities/product.dart';
import 'package:clean_architecture/features/food/domain/repository/product_repository.dart';

class GetProductUseCase implements UseCase<ProductEntity, String> {
  final ProductRepository _productRepository;

  GetProductUseCase(this._productRepository);

  @override
  Future<ProductEntity> call({String? params}) {
    return _productRepository.getProduct(params ?? "");
  }
}
