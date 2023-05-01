// Dart imports:
import 'dart:developer';

// Project imports:
import 'package:http_riverpod/src/environments/environments.dart';
import 'package:http_riverpod/src/features/users/data/datasources/user_data_source.dart';
import 'package:http_riverpod/src/features/users/data/models/user_model.dart';
import 'package:http_riverpod/src/features/users/domain/entities/user_entity.dart';
import 'package:http_riverpod/src/services/http_service.dart';

class UserDataSourceImpl implements UserDataSource {
  final List<UserEntity> _listOfUsers = [];

  final HttpService httpService;

  UserDataSourceImpl({required this.httpService});

  @override
  Future<List<UserEntity>> getUsers() async {
    try {
      final response = await httpService.getData(
        path: Environments.baseURL + Environments.users,
      );
      _listOfUsers.addAll(UserModel.jsonToList(response.data));
      log('List: $_listOfUsers');
      return _listOfUsers;
    } catch (e) {
      log('$e');
    }
    return _listOfUsers;
  }
}
