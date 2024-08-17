part of 'favorite_image_cubit.dart';

sealed class FavoriteImageState extends Equatable {
  const FavoriteImageState();

  @override
  List<Object> get props => [];
}

final class FavoriteImageInitial extends FavoriteImageState {}

final class FavoriteImageLoaded extends FavoriteImageState {
  final List<ImageEntity> imageList;
  final int favoriteTotal;
  final bool showFavorite;

  const FavoriteImageLoaded({
    required this.imageList,
    required this.favoriteTotal,
    required this.showFavorite,
  });

  @override
  List<Object> get props => [...imageList, favoriteTotal, showFavorite];
}

final class FavoriteImageError extends FavoriteImageState {
  final String message;

  const FavoriteImageError(this.message);

  @override
  List<Object> get props => [message];
}
