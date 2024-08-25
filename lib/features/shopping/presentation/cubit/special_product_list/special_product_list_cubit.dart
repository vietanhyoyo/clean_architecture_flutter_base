import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/shopping/domain/entities/product.dart';
import 'package:clean_architecture/features/shopping/domain/usecases/get_product_list_usecase.dart';
import 'package:equatable/equatable.dart';

part 'special_product_list_state.dart';

class SpecialProductListCubit extends Cubit<SpecialProductListState> {
  final GetProductListUseCase _getProductListUseCase;

  SpecialProductListCubit(this._getProductListUseCase)
      : super(SpecialProductListInitial()) {
    _getProductList();
  }

  void _getProductList() async {
    try {
      final data = await _getProductListUseCase(params: {
        "offset": 0,
        "sortBy": "id",
        "order": "asc",
        "special": true
      });
      emit(SpecialProductListLoaded(data.data ?? []));
    } catch (e) {
      emit(
          const SpecialProductListError('Failed to load special product list'));
    }
  }
}
