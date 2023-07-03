// Project imports:
import 'package:http_riverpod/src/features/todos/domain/entities/todo_entity.dart';

sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class TodoLoading extends TodoState {}

final class TodoSuccess extends TodoState {
  final List<TodoEntity> todos;

  TodoSuccess({required this.todos});
}

final class TodoFailure extends TodoState {
  final String message;

  TodoFailure({required this.message});
}
