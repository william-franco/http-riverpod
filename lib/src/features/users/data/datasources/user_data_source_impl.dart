// Project imports:
import 'package:http_riverpod/src/environments/environments.dart';
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
  Future<List<UserEntity>> getUsers() async {
    final response = await httpService.getData(
      path: Environments.baseURL + Environments.users,
    );
    try {
      if (response.statusCode == 200) {
        final success =
            (response.data as List).map((e) => UserModel.fromJson(e)).toList();
        return success;
      } else {
        throw Exception('Failed to load users. ${response.statusCode}');
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
