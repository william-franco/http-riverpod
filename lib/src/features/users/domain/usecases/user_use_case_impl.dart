// Project imports:
import 'package:http_riverpod/src/features/users/domain/entities/user_entity.dart';
import 'package:http_riverpod/src/features/users/domain/repositories/user_repository.dart';
import 'package:http_riverpod/src/features/users/domain/usecases/user_use_case.dart';

class UserUseCaseImpl implements UserUseCase {
  final UserRepository _repository;

  UserUseCaseImpl(this._repository);

  @override
  Future<List<UserEntity>> getUsers() async {
    return await _repository.getUsers();
  }
}
