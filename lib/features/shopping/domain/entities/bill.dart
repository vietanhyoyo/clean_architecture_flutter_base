// BillEntity class to represent the bill
import 'package:clean_architecture/features/shopping/domain/entities/order.dart';
import 'package:equatable/equatable.dart';

class BillEntity extends Equatable {
  final String? code;
  final int? userId;
  final double? amount;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;
  final List<OrderItemEntity>? orderItems;

  const BillEntity({
    required this.code,
    required this.userId,
    required this.amount,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.orderItems,
  });

  @override
  List<Object?> get props {
    return [code, userId, amount, updatedAt, createdAt, id, orderItems];
  }
}
