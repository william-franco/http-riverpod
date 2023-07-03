// Project imports:
import 'package:http_riverpod/src/features/users/domain/entities/user_entity.dart';
import 'package:http_riverpod/src/features/users/domain/repositories/user_repository.dart';
import 'package:http_riverpod/src/features/users/domain/usecases/user_use_case.dart';

class UserUseCaseImpl implements UserUseCase {
  final UserRepository repository;

  UserUseCaseImpl({
    required this.repository,
  });

  @override
  Future<List<UserEntity>> getUsers() async {
    try {
      return await repository.getUsers();
    } catch (error) {
      throw Exception(error);
    }
  }
}
