// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/exceptions/networking_exception.dart';
import 'package:http_riverpod/src/features/todos/domain/usecases/todo_use_case.dart';
import 'package:http_riverpod/src/features/todos/presentation/state/todo_state.dart';

class TodoNotifier extends StateNotifier<TodoState> {
  final TodoUseCase _useCase;

  TodoNotifier(this._useCase) : super(const TodoInitial()) {
    getTodos();
  }

  Future<void> getTodos() async {
    try {
      state = const TodoLoading();
      final albums = await _useCase.getTodos();
      state = TodoLoaded(albums);
      _debugProvider();
    } on NetworkException {
      state = const TodoError('Couldnt fetch weather. Is the device online?');
      _debugProvider();
    }
  }

  void _debugProvider() {
    log('User state: $state');
  }
}
