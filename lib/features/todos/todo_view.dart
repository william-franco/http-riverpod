import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod/features/todos/todo_singleton.dart';
import 'package:http_riverpod/widgets/atoms/loading_atom.dart';
import 'package:http_riverpod/widgets/atoms/text_atom.dart';
import 'package:http_riverpod/widgets/atoms/text_failed_atom.dart';
import 'package:http_riverpod/widgets/molecules/app_bar_molecule.dart';

class TodoView extends ConsumerWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(getTodos);
    return Scaffold(
      appBar: AppBarMolecule(
        title: const TextAtom(text: 'Notas'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () async => await ref.refresh(refreshTodos),
          )
        ],
      ),
      body: SafeArea(
        child: todoData.when(
          loading: () => const LoadingAtom(),
          error: (err, stack) => TextFailedAtom(error: '$err'),
          data: (todos) => ListView.separated(
            itemCount: todos.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8.0),
            itemBuilder: (BuildContext context, int index) {
              final todo = todos[index];
              return Card(
                child: ListTile(
                  title: TextAtom(
                    text: todo.title!,
                    style: const TextStyle(fontSize: 16),
                  ),
                  subtitle: TextAtom(
                    text: 'completed: ${todo.completed!}',
                    style: const TextStyle(fontSize: 12),
                  ),
                  leading: Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextAtom(
                      text: todo.id.toString(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
