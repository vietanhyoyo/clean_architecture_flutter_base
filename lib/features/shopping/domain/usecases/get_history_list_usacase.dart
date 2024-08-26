import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/features/shopping/domain/entities/bill.dart';
import 'package:clean_architecture/features/shopping/domain/repository/order_repository.dart';

class GetHistoryUseCase
    implements UseCase<DataState<List<BillEntity>>, void> {
  final OrderRepository _orderRepository;

  GetHistoryUseCase(this._orderRepository);

  @override
  Future<DataState<List<BillEntity>>> call({void params}) {
    return _orderRepository.getHistory();
  }
}
