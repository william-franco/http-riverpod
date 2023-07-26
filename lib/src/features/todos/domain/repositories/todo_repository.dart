// Project imports:
import 'package:http_riverpod/src/exception_handling/exception_handling.dart';
import 'package:http_riverpod/src/features/todos/domain/entities/todo_entity.dart';

abstract interface class TodoRepository {
  Future<Result<List<TodoEntity>, Exception>> getTodos();
}
