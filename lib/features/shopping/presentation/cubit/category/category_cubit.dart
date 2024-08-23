import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/shopping/domain/entities/category.dart';
import 'package:clean_architecture/features/shopping/domain/usecases/get_category_list_usecase.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoryListUseCase _getCategoryUseCate;

  CategoryCubit(this._getCategoryUseCate) : super(CategoryInitial()) {
    _getCategoryList();
  }

  void _getCategoryList() async {
    try {
      final data = await _getCategoryUseCate();
      emit(CategoryLoaded(data.data ?? []));
    } catch (e) {
      emit(const CategoryError('Failed to load category'));
    }
  }
}
