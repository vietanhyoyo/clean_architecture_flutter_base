part of 'food_main_cubit.dart';

sealed class FoodMainState extends Equatable {
  const FoodMainState();

  @override
  List<Object> get props => [];
}

final class FoodMainInitial extends FoodMainState {}

final class FoodMainLoaded extends FoodMainState {
  final List<CategoryEntity> categoryList;
  final List<ProductEntity> productList;

  const FoodMainLoaded(this.categoryList, this.productList);

  @override
  List<Object> get props => [categoryList, productList];
}

final class FoodMainError extends FoodMainState {
  final String message;

  const FoodMainError(this.message);

  @override
  List<Object> get props => [message];
}
