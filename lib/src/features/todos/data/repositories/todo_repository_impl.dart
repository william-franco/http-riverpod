// Project imports:
import 'package:http_riverpod/src/features/todos/data/datasources/todo_data_source.dart';
import 'package:http_riverpod/src/features/todos/domain/entities/todo_entity.dart';
import 'package:http_riverpod/src/features/todos/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSource;

  TodoRepositoryImpl(this._dataSource);

  @override
  Future<List<TodoEntity>> getTodos() async {
    return await _dataSource.getTodos();
  }
}
