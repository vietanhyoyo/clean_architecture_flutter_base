import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/food/domain/entities/category.dart';
import 'package:clean_architecture/features/food/domain/usecases/get_category_list.dart';
import 'package:equatable/equatable.dart';

part 'food_home_state.dart';

class FoodHomeCubit extends Cubit<FoodHomeState> {
  final GetCategoryListUseCase _getCategoryListUseCate;

  FoodHomeCubit(this._getCategoryListUseCate) : super(FoodHomeInitial()) {
    _getCategoryList();
  }

  void _getCategoryList() async {
    try {
      final data = await _getCategoryListUseCate();
      emit(FoodHomeLoaded(data));
    } catch (e) {
      emit(const FoodHomeError('Failed to load category'));
    }
  }
}
