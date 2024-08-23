import 'package:clean_architecture/features/shopping/domain/entities/slider.dart';

class SliderModel extends SliderEntity {
  const SliderModel(
      {required super.id, required super.name, required super.image});

  factory SliderModel.fromJson(Map<String, dynamic> map) {
    return SliderModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? "",
      image: map['image'] ?? "",
    );
  }
}
