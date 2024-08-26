import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final int? price;
  final int? quantity;

  const CartItemEntity(
      {required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.quantity});

  @override
  List<Object?> get props {
    return [id, name, image, price, quantity];
  }
}
