import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/shopping/domain/entities/bill.dart';

abstract class OrderRepository {
  Future<DataState<List<BillEntity>>> getHistory();
}
