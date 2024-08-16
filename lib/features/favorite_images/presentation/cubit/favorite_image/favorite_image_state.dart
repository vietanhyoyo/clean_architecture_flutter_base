part of 'favorite_image_cubit.dart';

sealed class FavoriteImageState extends Equatable {
  const FavoriteImageState();

  @override
  List<Object> get props => [];
}

final class FavoriteImageInitial extends FavoriteImageState {}

final class FavoriteImageLoaded extends FavoriteImageState {
  final List<ImageEntity> imageList;

  const FavoriteImageLoaded(
      {required this.imageList});

  @override
  List<Object> get props => [imageList];
}

final class FavoriteImageError extends FavoriteImageState {
  final String message;

  const FavoriteImageError(this.message);

  @override
  List<Object> get props => [message];
}
