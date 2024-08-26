part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoaded extends CartState {
  final Map<int, CartItemEntity> cartList;

  const CartLoaded(this.cartList);

  @override
  List<Object> get props => [cartList];
}

final class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object> get props => [message];
}
