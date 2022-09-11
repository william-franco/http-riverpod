// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:http_riverpod/src/env/env_config.dart';
import 'package:http_riverpod/src/features/todos/data/datasources/todo_data_source.dart';
import 'package:http_riverpod/src/features/todos/data/models/todo_model.dart';
import 'package:http_riverpod/src/features/todos/domain/entities/todo_entity.dart';

class TodoDataSourceImpl implements TodoDataSource {
  List<TodoEntity> listOfTodos = [];

  final Dio _dio;

  TodoDataSourceImpl(this._dio);

  @override
  Future<List<TodoEntity>> getTodos() async {
    try {
      final response = await _dio.get(Environment.baseURL + Environment.todos);
      listOfTodos.addAll(TodoModel.jsonToList(response.data));
      log('List: $listOfTodos');
      return listOfTodos;
    } catch (e) {
      log('$e');
    }
    return listOfTodos;
  }
}
