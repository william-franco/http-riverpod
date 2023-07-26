// Project imports:
import 'package:http_riverpod/src/exception_handling/exception_handling.dart';
import 'package:http_riverpod/src/features/users/domain/entities/user_entity.dart';

abstract interface class UserRepository {
  Future<Result<List<UserEntity>, Exception>> getUsers();
}
