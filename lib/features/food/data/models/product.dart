import 'package:clean_architecture/features/food/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {required super.id,
      required super.categoryId,
      required super.title,
      required super.image,
      required super.intro,
      required super.ingredients,
      required super.instructions,
      required super.view,
      required super.favorite});

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? "",
      categoryId: map['categoryId'] ?? "",
      title: map['title'] ?? "",
      image: map['image'] ?? "",
      intro: map['intro'] ?? "",
      ingredients: map['ingredients'] ?? "",
      instructions: map['instructions'] ?? "",
      view: map['view'] ?? "",
      favorite: map['favorite'] ?? "",
    );
  }
}
