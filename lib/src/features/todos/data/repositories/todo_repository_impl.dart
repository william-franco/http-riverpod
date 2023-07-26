// Project imports:
import 'package:http_riverpod/src/exception_handling/exception_handling.dart';
import 'package:http_riverpod/src/features/todos/data/datasources/todo_data_source.dart';
import 'package:http_riverpod/src/features/todos/domain/entities/todo_entity.dart';
import 'package:http_riverpod/src/features/todos/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource dataSource;

  TodoRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Result<List<TodoEntity>, Exception>> getTodos() async {
    try {
      return await dataSource.getTodos();
    } on Exception catch (error) {
      return Failure(exception: error);
    }
  }
}
