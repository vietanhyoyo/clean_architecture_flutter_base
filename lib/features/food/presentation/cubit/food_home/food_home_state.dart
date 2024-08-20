part of 'food_home_cubit.dart';

sealed class FoodHomeState extends Equatable {
  const FoodHomeState();

  @override
  List<Object> get props => [];
}

final class FoodHomeInitial extends FoodHomeState {}

final class FoodHomeLoaded extends FoodHomeState {
  final List<CategoryEntity> categoryList;

  const FoodHomeLoaded(this.categoryList);

  @override
  List<Object> get props => [categoryList];
}

final class FoodHomeError extends FoodHomeState {
  final String message;

  const FoodHomeError(this.message);

  @override
  List<Object> get props => [message];
}
