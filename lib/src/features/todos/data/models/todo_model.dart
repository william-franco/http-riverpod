// Project imports:
import 'package:http_riverpod/src/features/todos/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TodoModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }

  static List<TodoModel> jsonToList(List<dynamic> data) {
    return data.map((itens) => TodoModel.fromJson(itens)).toList();
  }
}
