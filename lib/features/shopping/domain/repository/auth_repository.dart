import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/shopping/domain/entities/auth.dart';

abstract class AuthRepository {
  Future<DataState<AuthEntity>> postLogin(Map<String, String> params);
}
