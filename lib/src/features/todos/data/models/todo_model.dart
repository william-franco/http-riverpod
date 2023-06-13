// Project imports:
import 'package:http_riverpod/src/features/todos/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  @override
  final int? userId;
  @override
  final int? id;
  @override
  final String? title;
  @override
  final bool? completed;

  const TodoModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      title: json['title'] as String?,
      completed: json['completed'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}
