// Project imports:
import 'package:http_riverpod/src/features/todos/domain/entities/todo_entity.dart';

abstract class TodoState {
  const TodoState();
}

class TodoInitial extends TodoState {
  const TodoInitial();
}

class TodoLoading extends TodoState {
  const TodoLoading();
}

class TodoLoaded extends TodoState {
  final List<TodoEntity> todos;
  const TodoLoaded(this.todos);
}

class TodoError extends TodoState {
  final String message;
  const TodoError(this.message);
}
