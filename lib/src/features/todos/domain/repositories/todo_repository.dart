// Project imports:
import 'package:http_riverpod/src/features/todos/domain/entities/todo_entity.dart';

abstract interface class TodoRepository {
  Future<List<TodoEntity>> getTodos();
}
