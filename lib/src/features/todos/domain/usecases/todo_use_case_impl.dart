// Project imports:
import 'package:http_riverpod/src/features/todos/domain/entities/todo_entity.dart';
import 'package:http_riverpod/src/features/todos/domain/repositories/todo_repository.dart';
import 'package:http_riverpod/src/features/todos/domain/usecases/todo_use_case.dart';

class TodoUseCaseImpl implements TodoUseCase {
  final TodoRepository _repository;

  TodoUseCaseImpl(this._repository);

  @override
  Future<List<TodoEntity>> getTodos() async {
    return await _repository.getTodos();
  }
}
