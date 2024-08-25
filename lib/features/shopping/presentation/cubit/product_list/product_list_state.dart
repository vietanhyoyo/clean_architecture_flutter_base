part of 'product_list_cubit.dart';

sealed class ProductListState extends Equatable {
  const ProductListState();

  @override
  List<Object> get props => [];
}

final class ProductListInitial extends ProductListState {}

final class ProductListLoaded extends ProductListState {
  final List<ProductEntity> productList;

  const ProductListLoaded(this.productList);

  @override
  List<Object> get props => [productList];
}

final class ProductListError extends ProductListState {
  final String message;

  const ProductListError(this.message);

  @override
  List<Object> get props => [message];
}
