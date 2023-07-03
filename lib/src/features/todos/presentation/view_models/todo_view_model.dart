// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/features/todos/domain/usecases/todo_use_case.dart';
import 'package:http_riverpod/src/features/todos/presentation/state/todo_state.dart';

class TodoViewModel extends StateNotifier<TodoState> {
  final TodoUseCase useCase;

  TodoViewModel({
    required this.useCase,
  }) : super(TodoInitial());

  Future<void> getTodos() async {
    try {
      state = TodoLoading();
      final todos = await useCase.getTodos();
      state = TodoSuccess(todos: todos);
      _debug();
    } catch (error) {
      state = TodoFailure(
        message: 'Couldnt fetch weather. Is the device online?',
      );
      _debug();
    }
  }

  void _debug() {
    log('User state: $state');
  }
}
