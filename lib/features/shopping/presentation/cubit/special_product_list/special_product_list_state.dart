part of 'special_product_list_cubit.dart';

sealed class SpecialProductListState extends Equatable {
  const SpecialProductListState();

  @override
  List<Object> get props => [];
}

final class SpecialProductListInitial extends SpecialProductListState {}

final class SpecialProductListLoaded extends SpecialProductListState {
  final List<ProductEntity> productList;

  const SpecialProductListLoaded(this.productList);

  @override
  List<Object> get props => [productList];
}

final class SpecialProductListError extends SpecialProductListState {
  final String message;

  const SpecialProductListError(this.message);

  @override
  List<Object> get props => [message];
}
