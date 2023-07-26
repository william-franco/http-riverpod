// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/exception_handling/exception_handling.dart';
import 'package:http_riverpod/src/features/todos/domain/usecases/todo_use_case.dart';
import 'package:http_riverpod/src/features/todos/presentation/state/todo_state.dart';

abstract base class TodoViewModel extends StateNotifier<TodoState> {
  TodoViewModel() : super(TodoInitial());

  Future<void> getTodos();
}

base class TodoViewModelImpl extends StateNotifier<TodoState>
    implements TodoViewModel {
  final TodoUseCase useCase;

  TodoViewModelImpl({
    required this.useCase,
  }) : super(TodoInitial());

  @override
  Future<void> getTodos() async {
    state = TodoLoading();
    final result = await useCase.getTodos();
    final todos = switch (result) {
      Success(value: final todos) => TodoSuccess(todos: todos),
      Failure(exception: final exception) =>
        TodoFailure(message: 'Something went wrong: $exception'),
    };
    state = todos;
    _debug();
  }

  void _debug() {
    log('User state: $state');
  }
}
