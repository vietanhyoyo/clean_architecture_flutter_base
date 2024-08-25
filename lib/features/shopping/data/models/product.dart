import 'package:clean_architecture/features/shopping/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.image,
    super.price,
    super.priceSaleOff,
    super.rating,
    super.special,
    super.summary,
    super.description,
    super.isNew,
    super.categoryId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? "",
      image: map['image'] ?? "",
      price: map['price'],
      priceSaleOff: map['priceSaleOff'],
      rating: map['rating'],
      special: map['special'] ?? false,
      summary: map['summary'] ?? "",
      description: map['description'] ?? "",
      isNew: map['isNew'] ?? false,
      categoryId: map['categoryId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'priceSaleOff': priceSaleOff,
      'rating': rating,
      'special': special,
      'summary': summary,
      'description': description,
      'isNew': isNew,
      'categoryId': categoryId,
    };
  }
}
