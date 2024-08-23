import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int? id;
  final String? name;
  final String? image;

  const CategoryEntity(
      {required this.id, required this.name, required this.image});

  @override
  List<Object?> get props {
    return [id, name, image];
  }
}
