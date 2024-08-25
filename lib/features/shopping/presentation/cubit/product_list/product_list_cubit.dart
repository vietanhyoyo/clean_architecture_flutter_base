import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/shopping/domain/entities/product.dart';
import 'package:clean_architecture/features/shopping/domain/usecases/get_product_list_of_category_usecase.dart';
import 'package:equatable/equatable.dart';

part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final GetProductListOfCategoryUseCase _getProductListOfCategoryUseCase;
  final String categoryId;

  ProductListCubit(this._getProductListOfCategoryUseCase, this.categoryId)
      : super(ProductListInitial()) {
    _getProductList(categoryId);
  }

  void _getProductList(String id) async {
    try {
      final data = await _getProductListOfCategoryUseCase(params: id);
      emit(ProductListLoaded(data.data ?? []));
    } catch (e) {
      emit(const ProductListError('Failed to load product list'));
    }
  }
}
