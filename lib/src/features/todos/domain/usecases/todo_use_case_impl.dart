// Project imports:
import 'package:http_riverpod/src/features/todos/domain/entities/todo_entity.dart';
import 'package:http_riverpod/src/features/todos/domain/repositories/todo_repository.dart';
import 'package:http_riverpod/src/features/todos/domain/usecases/todo_use_case.dart';

class TodoUseCaseImpl implements TodoUseCase {
  final TodoRepository repository;

  TodoUseCaseImpl({
    required this.repository,
  });

  @override
  Future<List<TodoEntity>> getTodos() async {
    try {
      return await repository.getTodos();
    } catch (error) {
      throw Exception(error);
    }
  }
}
