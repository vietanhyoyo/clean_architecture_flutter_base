import 'package:clean_architecture/features/favorite_images/data/data_sources/local/image_service.dart';
import 'package:clean_architecture/features/favorite_images/domain/entities/image.dart';
import 'package:clean_architecture/features/favorite_images/domain/repository/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageService _imageService;

  ImageRepositoryImpl(this._imageService);

  @override
  Future<List<ImageEntity>> getImageList() async {
    final httpResponse = await _imageService.getImageList();
    return httpResponse;
  }
}
