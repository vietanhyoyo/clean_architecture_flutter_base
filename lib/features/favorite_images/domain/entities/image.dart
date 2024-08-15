import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String id;
  final String name;
  final String image;

  const ImageEntity({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props {
    return [id, name, image];
  }
}
