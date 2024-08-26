import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/features/shopping/domain/entities/bill.dart';
import 'package:clean_architecture/features/shopping/domain/repository/cart_repository.dart';

class PostMakeOrderUseCase
    implements UseCase<DataState<BillEntity>, Map<String, dynamic>> {
  final CartRepository _cartRepository;

  PostMakeOrderUseCase(this._cartRepository);

  @override
  Future<DataState<BillEntity>> call({Map<String, dynamic>? params}) {
    return _cartRepository.postMakeOrder(params!);
  }
}
