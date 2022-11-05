// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/features/todos/presentation/riverpod/todo_provider.dart';
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
      appBar: AppBarMolecule(
        title: const TextAtom(text: 'Todos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () async => await ref.refresh(todoNotifierProvider),
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            if (state is TodoLoaded) {
              return ListView.separated(
                itemCount: state.todos.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 8.0),
                itemBuilder: (BuildContext context, int index) {
                  final user = state.todos[index];
                  return ListTile(
                    title: Text(user.title!),
                    subtitle: Text('${user.completed!}'),
                  );
                },
              );
            } else if (state is TodoLoading) {
              return const Center(child: LoadingAtom());
            } else if (state is TodoError) {
              return Center(
                child: TextFailedAtom(error: state.message),
              );
            } else {
              return const Center(child: LoadingAtom());
            }
          },
        ),
      ),
    );
  }
}
