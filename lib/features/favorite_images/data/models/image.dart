import 'package:clean_architecture/features/favorite_images/domain/entities/image.dart';

class ImageModel extends ImageEntity {
  const ImageModel({super.id, super.name, super.image, super.like});

  factory ImageModel.fromJson(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
      image: map['image'] ?? "",
      like: map['like'] ?? "",
    );
  }
}
