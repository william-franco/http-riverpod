// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod/features/todos/todo_repository.dart';

final todoProvider = Provider((ref) {
  return TodoRepositoryImpl();
});

final getTodo = FutureProvider((ref) async {
  int id = 0;
  return await ref.read(todoProvider).getTodo(id);
});

final getTodos = FutureProvider((ref) async {
  return await ref.read(todoProvider).getTodos();
});

final refreshTodos = FutureProvider((ref) async {
  return await ref.read(todoProvider).refreshTodos();
});
