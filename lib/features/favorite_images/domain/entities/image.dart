import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String? id;
  final String? name;
  final String? image;
  final bool? like;

  const ImageEntity({this.id, this.name, this.image, this.like});

  @override
  List<Object?> get props {
    return [id, name, image];
  }
}
