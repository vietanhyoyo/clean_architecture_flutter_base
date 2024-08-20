part of 'category_food_cubit.dart';

sealed class CategoryFoodState extends Equatable {
  const CategoryFoodState();

  @override
  List<Object> get props => [];
}

final class CategoryFoodInitial extends CategoryFoodState {}

final class CategoryFoodLoaded extends CategoryFoodState {
  final List<ProductEntity> productList;

  const CategoryFoodLoaded(this.productList);

  @override
  List<Object> get props => [productList];
}

final class CategoryFoodError extends CategoryFoodState {
  final String message;

  const CategoryFoodError(this.message);

  @override
  List<Object> get props => [message];
}
