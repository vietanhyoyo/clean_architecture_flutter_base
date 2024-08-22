import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? id;
  final String? categoryId;
  final String? title;
  final String? image;
  final String? intro;
  final String? ingredients;
  final String? instructions;
  final String? view;
  final String? favorite;
  final bool? isLiked;
  final bool? isViewed;

  const ProductEntity(
      {required this.id,
      required this.categoryId,
      required this.title,
      required this.image,
      required this.intro,
      required this.ingredients,
      required this.instructions,
      required this.view,
      required this.favorite,
      required this.isLiked,
      required this.isViewed});

  @override
  List<Object?> get props {
    return [
      id,
      categoryId,
      title,
      image,
      intro,
      ingredients,
      instructions,
      view,
      favorite,
      isLiked,
      isViewed
    ];
  }
}
