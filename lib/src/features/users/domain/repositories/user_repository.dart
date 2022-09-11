// Project imports:
import 'package:http_riverpod/src/features/users/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
}
