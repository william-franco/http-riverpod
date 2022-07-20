import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http_riverpod/env/env_config.dart';
import 'package:http_riverpod/features/todos/todo_model.dart';

final dioOptions = BaseOptions(baseUrl: Environment.baseURL);

final httpClient = Dio(dioOptions);

abstract class TodoRepository {
  Future<TodoModel> getTodo(int id);
  Future<List<TodoModel>> getTodos();
  Future<List<TodoModel>> refreshTodos();
}

class TodoRepositoryImpl implements TodoRepository {
  List<TodoModel> listOfTodos = [];
  late TodoModel itemOfTodos;

  @override
  Future<TodoModel> getTodo(int id) async {
    final response = await httpClient.get('${Environment.todos}/$id');
    return TodoModel.fromJson(response.data);
  }

  @override
  Future<List<TodoModel>> getTodos() async {
    final response = await httpClient.get(Environment.todos);
    if (response.statusCode == 200) {
      listOfTodos.addAll(TodoModel.jsonToList(response.data));
      log('List: $listOfTodos');
      return listOfTodos;
    } else {
      log('Failed to load todos.');
      return [];
    }
  }

  @override
  Future<List<TodoModel>> refreshTodos() async {
    listOfTodos.clear();
    log('List: $listOfTodos');
    final response = await httpClient.get(Environment.todos);
    if (response.statusCode == 200) {
      listOfTodos.addAll(TodoModel.jsonToList(response.data));
      log('List: $listOfTodos');
      return listOfTodos;
    } else {
      log('Failed to refresh todos.');
      return [];
    }
  }
}
