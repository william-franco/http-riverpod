// Project imports:
import 'package:http_riverpod/src/exception_handling/exception_handling.dart';
import 'package:http_riverpod/src/features/users/data/datasources/user_data_source.dart';
import 'package:http_riverpod/src/features/users/domain/entities/user_entity.dart';
import 'package:http_riverpod/src/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Result<List<UserEntity>, Exception>> getUsers() async {
    try {
      return await dataSource.getUsers();
    } on Exception catch (error) {
      return Failure(exception: error);
    }
  }
}
