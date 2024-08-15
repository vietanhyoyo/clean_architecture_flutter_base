import 'package:clean_architecture/features/favorite_images/domain/entities/image.dart';

class ImageModel extends ImageEntity {
  const ImageModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory ImageModel.fromJson(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
      image: map['image'] ?? "",
    );
  }
}
