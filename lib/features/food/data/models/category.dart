import 'package:clean_architecture/features/food/domain/entities/category.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel(
      {required super.id, required super.name, required super.image});

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
      image: map['image'] ?? "",
    );
  }
}
