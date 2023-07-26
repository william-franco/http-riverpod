// Project imports:
import 'package:http_riverpod/src/exception_handling/exception_handling.dart';
import 'package:http_riverpod/src/features/todos/domain/entities/todo_entity.dart';
import 'package:http_riverpod/src/features/todos/domain/repositories/todo_repository.dart';
import 'package:http_riverpod/src/features/todos/domain/usecases/todo_use_case.dart';

class TodoUseCaseImpl implements TodoUseCase {
  final TodoRepository repository;

  TodoUseCaseImpl({
    required this.repository,
  });

  @override
  Future<Result<List<TodoEntity>, Exception>> getTodos() async {
    try {
      return await repository.getTodos();
    } on Exception catch (error) {
      return Failure(exception: error);
    }
  }
}
