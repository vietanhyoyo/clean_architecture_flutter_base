import 'package:clean_architecture/features/food/data/data_sources/product_service.dart';
import 'package:clean_architecture/features/food/domain/entities/product.dart';
import 'package:clean_architecture/features/food/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService _producteService;

  ProductRepositoryImpl(this._producteService);

  @override
  Future<ProductEntity> getProduct(String id) async {
    final httpResponse = await _producteService.getProduct(id);
    return httpResponse;
  }
  
  @override
  Future<List<ProductEntity>> getProductList() async {
    final httpResponse = await _producteService.getProductList();
    return httpResponse;
  }
}
