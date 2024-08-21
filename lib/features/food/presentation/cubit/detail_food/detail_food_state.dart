part of 'detail_food_cubit.dart';

sealed class DetailFoodState extends Equatable {
  const DetailFoodState();

  @override
  List<Object> get props => [];
}

final class DetailFoodInitial extends DetailFoodState {}

final class DetailFoodLoaded extends DetailFoodState {
  final ProductEntity product;

  const DetailFoodLoaded(this.product);

  @override
  List<Object> get props => [product];
}

final class DetailFoodError extends DetailFoodState {
  final String message;

  const DetailFoodError(this.message);

  @override
  List<Object> get props => [message];
}

