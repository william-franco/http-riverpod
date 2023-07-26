// Project imports:
import 'package:http_riverpod/src/environments/environments.dart';
import 'package:http_riverpod/src/exception_handling/exception_handling.dart';
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
  Future<Result<List<TodoEntity>, Exception>> getTodos() async {
    try {
      final response = await httpService.getData(
        path: Environments.baseURL + Environments.todos,
      );
      switch (response.statusCode) {
        case 200:
          final success = (response.data as List)
              .map((e) => TodoModel.fromJson(e))
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
