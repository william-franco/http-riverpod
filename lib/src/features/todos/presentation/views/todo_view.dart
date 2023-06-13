// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/common_widgets/common_padding.dart';
import 'package:http_riverpod/src/dependency_injector/dependency_injector.dart';
import 'package:http_riverpod/src/features/todos/presentation/state/todo_state.dart';

class TodoView extends ConsumerStatefulWidget {
  const TodoView({super.key});

  @override
  ConsumerState<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends ConsumerState<TodoView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      ref.read(todoViewModelProvider.notifier).getTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Todos'),
      ),
      body: CommonPadding(
        child: RefreshIndicator(
          onRefresh: () {
            return ref.read(todoViewModelProvider.notifier).getTodos();
          },
          child: Consumer(
            builder: (context, ref, child) {
              return switch (ref.watch(todoViewModelProvider)) {
                TodoInitial() => const Text('List is empty.'),
                TodoLoading() => const CircularProgressIndicator(),
                TodoSuccess(todos: final todos) => ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      final user = todos[index];
                      return Card(
                        child: ListTile(
                          title: Text(user.title!),
                          subtitle: Text('${user.completed!}'),
                        ),
                      );
                    },
                  ),
                TodoFailure(message: final message) => Text(message),
              };
            },
          ),
        ),
      ),
    );
  }
}
