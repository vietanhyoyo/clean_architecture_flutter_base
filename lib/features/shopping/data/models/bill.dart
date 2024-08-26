// BillModel class that extends BillEntity
import 'package:clean_architecture/features/shopping/data/models/order_item.dart';
import 'package:clean_architecture/features/shopping/domain/entities/bill.dart';

class BillModel extends BillEntity {
  const BillModel({
    required super.code,
    required super.userId,
    required super.amount,
    required super.updatedAt,
    required super.createdAt,
    required super.id,
    required super.orderItems,
  });

  factory BillModel.fromJson(Map<String, dynamic> json) {
    return BillModel(
      code: json['code'] as String?,
      userId: json['user_id'] != null ? int.parse(json['user_id'].toString()) : null,
      amount: json['amount'] != null ? double.parse(json['amount'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      id: json['id'] != null ? int.parse(json['id'].toString()) : null,
      orderItems: json['order_items'] != null
          ? (json['order_items'] as List<dynamic>)
              .map((item) => OrderItemModel.fromJson(item as Map<String, dynamic>))
              .toList()
          : [],
    );
  }
}