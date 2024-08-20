import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/food/domain/entities/product.dart';
import 'package:clean_architecture/features/food/domain/usecases/get_products_by_category.dart';
import 'package:equatable/equatable.dart';

part 'category_food_state.dart';

class CategoryFoodCubit extends Cubit<CategoryFoodState> {
  final GetProductsByCategoryUseCase _getProductsByCategoryUseCate;
  final String categoryId;

  CategoryFoodCubit(this._getProductsByCategoryUseCate, this.categoryId)
      : super(CategoryFoodInitial()) {
    _getProductsByCategory(categoryId);
  }

  void _getProductsByCategory(String id) async {
    try {
      final data = await _getProductsByCategoryUseCate(params: id);
      print(data.length);
      emit(CategoryFoodLoaded(data));
    } catch (e) {
      emit(const CategoryFoodError('Failed to load products'));
    }
  }
}
