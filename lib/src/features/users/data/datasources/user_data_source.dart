// Project imports:
import 'package:http_riverpod/src/features/users/domain/entities/user_entity.dart';

abstract interface class UserDataSource {
  Future<List<UserEntity>> getUsers();
}
