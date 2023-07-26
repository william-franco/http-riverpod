// Project imports:
import 'package:http_riverpod/src/environments/environments.dart';
import 'package:http_riverpod/src/exception_handling/exception_handling.dart';
import 'package:http_riverpod/src/features/users/data/datasources/user_data_source.dart';
import 'package:http_riverpod/src/features/users/data/models/user_model.dart';
import 'package:http_riverpod/src/features/users/domain/entities/user_entity.dart';
import 'package:http_riverpod/src/services/http_service.dart';

class UserDataSourceImpl implements UserDataSource {
  final HttpService httpService;

  UserDataSourceImpl({
    required this.httpService,
  });

  @override
  Future<Result<List<UserEntity>, Exception>> getUsers() async {
    try {
      final response = await httpService.getData(
        path: Environments.baseURL + Environments.users,
      );
      switch (response.statusCode) {
        case 200:
          final success = (response.data as List)
              .map((e) => UserModel.fromJson(e))
              .toList();
          return Success(value: success);
        default:
          return Failure(exception: Exception(response.statusMessage));
      }
    } on Exception catch (error) {
      return Failure(exception: error);
    }
  }
}
