import 'package:equatable/equatable.dart';

// OrderItemEntity class to represent individual order items
class OrderItemEntity extends Equatable {
  final int? id;
  final int? orderId;
  final int? productId;
  final int? quantity;
  final double? amount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final double? price;

  const OrderItemEntity({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
    required this.price,
  });

  @override
  List<Object?> get props {
    return [id, orderId, productId, quantity, amount, createdAt, updatedAt, price];
  }
}