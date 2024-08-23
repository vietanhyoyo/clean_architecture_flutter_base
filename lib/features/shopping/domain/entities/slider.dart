import 'package:equatable/equatable.dart';

class SliderEntity extends Equatable {
  final int? id;
  final String? name;
  final String? image;

  const SliderEntity(
      {required this.id, required this.name, required this.image});

  @override
  List<Object?> get props {
    return [id, name, image];
  }
}
