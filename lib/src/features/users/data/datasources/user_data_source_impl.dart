// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:http_riverpod/src/environments/environments.dart';
import 'package:http_riverpod/src/features/users/data/datasources/user_data_source.dart';
import 'package:http_riverpod/src/features/users/data/models/user_model.dart';
import 'package:http_riverpod/src/features/users/domain/entities/user_entity.dart';

class UserDataSourceImpl implements UserDataSource {
  List<UserEntity> listOfUsers = [];

  final Dio _dio;

  UserDataSourceImpl(this._dio);

  @override
  Future<List<UserEntity>> getUsers() async {
    try {
      final response = await _dio.get(
        Environments.baseURL + Environments.users,
      );
      listOfUsers.addAll(UserModel.jsonToList(response.data));
      log('List: $listOfUsers');
      return listOfUsers;
    } catch (e) {
      log('$e');
    }
    return listOfUsers;
  }
}
