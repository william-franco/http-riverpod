// Dart imports:
import 'dart:developer';

// Project imports:
import 'package:http_riverpod/src/environments/environments.dart';
import 'package:http_riverpod/src/features/todos/data/datasources/todo_data_source.dart';
import 'package:http_riverpod/src/features/todos/data/models/todo_model.dart';
import 'package:http_riverpod/src/features/todos/domain/entities/todo_entity.dart';
import 'package:http_riverpod/src/services/http_service.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final List<TodoEntity> _listOfTodos = [];

  final HttpService httpService;

  TodoDataSourceImpl({required this.httpService});

  @override
  Future<List<TodoEntity>> getTodos() async {
    try {
      final response = await httpService.getData(
        path: Environments.baseURL + Environments.todos,
      );
      _listOfTodos.addAll(TodoModel.jsonToList(response.data));
      log('List: $_listOfTodos');
      return _listOfTodos;
    } catch (e) {
      log('$e');
    }
    return _listOfTodos;
  }
}
