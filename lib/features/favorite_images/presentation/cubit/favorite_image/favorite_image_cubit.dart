import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/favorite_images/domain/entities/image.dart';
import 'package:clean_architecture/features/favorite_images/domain/usecases/get_image_list.dart';
import 'package:equatable/equatable.dart';

part 'favorite_image_state.dart';

class FavoriteImageCubit extends Cubit<FavoriteImageState> {
  final GetImageListUseCase _getImageListUseCase;

  FavoriteImageCubit(this._getImageListUseCase)
      : super(FavoriteImageInitial()) {
    _getImageList();
  }

  void _getImageList() async {
    try {
      final data = await _getImageListUseCase();
      print(data);
      emit(FavoriteImageLoaded(imageList: data, favoriteImageList: const []));
    } catch (e) {
      emit(const FavoriteImageError('Failed to load images'));
    }
  }
}
