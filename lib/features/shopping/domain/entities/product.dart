import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final int? price;
  final int? priceSaleOff;
  final int? rating;
  final bool? special;
  final String? summary;
  final String? description;
  final bool? isNew;
  final int? categoryId;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.image,
    this.price,
    this.priceSaleOff,
    this.rating,
    this.special,
    this.summary,
    this.description,
    this.isNew,
    this.categoryId,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      image,
      price,
      priceSaleOff,
      rating,
      special,
      summary,
      description,
      isNew,
      categoryId,
    ];
  }
}
