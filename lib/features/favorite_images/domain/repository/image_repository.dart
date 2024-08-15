import 'package:clean_architecture/features/favorite_images/domain/entities/image.dart';

abstract class ImageRepository {
  Future<List<ImageEntity>> getImageList();
}
