// Project imports:
import 'package:http_riverpod/src/environments/environments.dart';
import 'package:http_riverpod/src/features/todos/data/datasources/todo_data_source.dart';
import 'package:http_riverpod/src/features/todos/data/models/todo_model.dart';
import 'package:http_riverpod/src/features/todos/domain/entities/todo_entity.dart';
import 'package:http_riverpod/src/services/http_service.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final HttpService httpService;

  TodoDataSourceImpl({
    required this.httpService,
  });

  @override
  Future<List<TodoEntity>> getTodos() async {
    final response = await httpService.getData(
      path: Environments.baseURL + Environments.todos,
    );
    try {
      if (response.statusCode == 200) {
        final success =
            (response.data as List).map((e) => TodoModel.fromJson(e)).toList();
        return success;
      } else {
        throw Exception('Failed to load todos. ${response.statusCode}');
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
