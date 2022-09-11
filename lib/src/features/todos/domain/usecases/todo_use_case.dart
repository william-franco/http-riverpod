// Project imports:
import 'package:http_riverpod/src/features/todos/domain/entities/todo_entity.dart';

abstract class TodoUseCase {
  Future<List<TodoEntity>> getTodos();
}
