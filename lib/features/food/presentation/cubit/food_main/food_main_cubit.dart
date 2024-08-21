import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/food/domain/entities/category.dart';
import 'package:clean_architecture/features/food/domain/usecases/get_category_list.dart';
import 'package:equatable/equatable.dart';

part 'food_main_state.dart';

class FoodMainCubit extends Cubit<FoodMainState> {
  final GetCategoryListUseCase _getCategoryListUseCate;

  FoodMainCubit(this._getCategoryListUseCate) : super(FoodMainInitial()) {
    _getCategoryList();
  }

  void _getCategoryList() async {
    try {
      final data = await _getCategoryListUseCate();
      emit(FoodMainLoaded(data));
    } catch (e) {
      emit(const FoodMainError('Failed to load category'));
    }
  }
}
