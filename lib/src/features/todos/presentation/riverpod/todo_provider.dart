// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/features/todos/data/datasources/todo_data_source_impl.dart';
import 'package:http_riverpod/src/features/todos/data/repositories/todo_repository_impl.dart';
import 'package:http_riverpod/src/features/todos/domain/usecases/todo_use_case_impl.dart';
import 'package:http_riverpod/src/features/todos/presentation/riverpod/todo_notifier.dart';
import 'package:http_riverpod/src/features/todos/presentation/state/todo_state.dart';

final dioProvider = Provider((ref) => Dio());

final todoDatasourceProvider = Provider((ref) {
  return TodoDataSourceImpl(ref.watch(dioProvider));
});

final todoRepositoryProvider = Provider((ref) {
  return TodoRepositoryImpl(ref.watch(todoDatasourceProvider));
});

final todoUseCaseProvider = Provider((ref) {
  return TodoUseCaseImpl(ref.watch(todoRepositoryProvider));
});

final todoNotifierProvider =
    StateNotifierProvider<TodoNotifier, TodoState>((ref) {
  return TodoNotifier(ref.watch(todoUseCaseProvider));
});
