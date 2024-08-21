import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/food/domain/entities/product.dart';
import 'package:clean_architecture/features/food/domain/usecases/get_product.dart';
import 'package:equatable/equatable.dart';

part 'detail_food_state.dart';

class DetailFoodCubit extends Cubit<DetailFoodState> {
  final GetProductUseCase _getProductUseCate;
  final String _productId;

  DetailFoodCubit(this._getProductUseCate, this._productId)
      : super(DetailFoodInitial()) {
    _getProduct(_productId);
  }

  void _getProduct(String id) async {
    try {
      final data = await _getProductUseCate(params: id);
      emit(DetailFoodLoaded(data));
    } catch (e) {
      emit(const DetailFoodError('Failed to load product'));
    }
  }
}
