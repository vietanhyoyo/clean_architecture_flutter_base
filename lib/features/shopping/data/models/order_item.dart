import 'package:clean_architecture/features/shopping/domain/entities/order.dart';
// OrderItemModel class that extends OrderItemEntity

class OrderItemModel extends OrderItemEntity {
  const OrderItemModel({
    required super.id,
    required super.orderId,
    required super.productId,
    required super.quantity,
    required super.amount,
    required super.createdAt,
    required super.updatedAt,
    required super.price,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'] != null ? int.parse(json['id'].toString()) : null,
      orderId: json['order_id'] != null
          ? int.parse(json['order_id'].toString())
          : null,
      productId: json['product_id'] != null
          ? int.parse(json['product_id'].toString())
          : null,
      quantity: json['quantity'] != null
          ? int.parse(json['quantity'].toString())
          : null,
      amount: json['amount'] != null
          ? double.parse(json['amount'].toString())
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      price:
          json['price'] != null ? double.parse(json['price'].toString()) : null,
    );
  }
}
