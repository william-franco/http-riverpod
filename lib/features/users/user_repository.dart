import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http_riverpod/env/env_config.dart';
import 'package:http_riverpod/features/users/user_model.dart';

final dioOptions = BaseOptions(baseUrl: Environment.baseURL);

final httpClient = Dio(dioOptions);

abstract class UserRepository {
  Future<UserModel> getUser(int id);
  Future<List<UserModel>> getUsers();
  Future<List<UserModel>> refreshUsers();
}

class UserRepositoryImpl implements UserRepository {
  List<UserModel> listOfUsers = [];
  late UserModel itemOfUsers;

  @override
  Future<UserModel> getUser(int id) async {
    final response = await httpClient.get('${Environment.users}/$id');
    return UserModel.fromJson(response.data);
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await httpClient.get(Environment.users);
    if (response.statusCode == 200) {
      listOfUsers.addAll(UserModel.jsonToList(response.data));
      log('List: $listOfUsers');
      return listOfUsers;
    } else {
      log('Failed to load users.');
      return [];
    }
  }

  @override
  Future<List<UserModel>> refreshUsers() async {
    listOfUsers.clear();
    log('List: $listOfUsers');
    final response = await httpClient.get(Environment.users);
    if (response.statusCode == 200) {
      listOfUsers.addAll(UserModel.jsonToList(response.data));
      log('List: $listOfUsers');
      return listOfUsers;
    } else {
      log('Failed to refresh users.');
      return [];
    }
  }
}
