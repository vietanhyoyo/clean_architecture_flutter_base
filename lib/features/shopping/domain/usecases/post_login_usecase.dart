import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/features/shopping/domain/entities/auth.dart';
import 'package:clean_architecture/features/shopping/domain/repository/auth_repository.dart';

class PostLoginUseCase
    implements UseCase<DataState<AuthEntity>, Map<String, String>> {
  final AuthRepository _authRepository;

  PostLoginUseCase(this._authRepository);

  @override
  Future<DataState<AuthEntity>> call({Map<String, String>? params}) {
    return _authRepository.postLogin(params!);
  }
}
