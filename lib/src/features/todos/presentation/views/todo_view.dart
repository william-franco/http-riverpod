// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod/src/dependency_injector/dependency_injector.dart';

// Project imports:
import 'package:http_riverpod/src/features/todos/presentation/state/todo_state.dart';
import 'package:http_riverpod/src/widgets/atoms/loading_atom.dart';
import 'package:http_riverpod/src/widgets/atoms/text_atom.dart';
import 'package:http_riverpod/src/widgets/atoms/text_failed_atom.dart';
import 'package:http_riverpod/src/widgets/molecules/app_bar_molecule.dart';

class TodoView extends ConsumerWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todoNotifierProvider);
    return Scaffold(
      appBar: const AppBarMolecule(
        title: TextAtom(text: 'Todos'),
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async {
            return await ref.refresh(todoNotifierProvider);
          },
          child: Consumer(
            builder: (context, ref, child) {
              if (state is TodoLoaded) {
                return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final user = state.todos[index];
                    return Card(
                      child: ListTile(
                        title: Text(user.title!),
                        subtitle: Text('${user.completed!}'),
                      ),
                    );
                  },
                );
              } else if (state is TodoLoading) {
                return const LoadingAtom();
              } else if (state is TodoError) {
                return TextFailedAtom(error: state.message);
              } else {
                return const LoadingAtom();
              }
            },
          ),
        ),
      ),
    );
  }
}
