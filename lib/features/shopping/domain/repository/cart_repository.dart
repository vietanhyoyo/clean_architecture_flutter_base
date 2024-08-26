import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/shopping/domain/entities/bill.dart';

abstract class CartRepository {
  Future<DataState<BillEntity>> postMakeOrder(Map<String, dynamic> params);
}
