// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/features/users/presentation/riverpod/user_provider.dart';
import 'package:http_riverpod/src/features/users/presentation/state/user_state.dart';
import 'package:http_riverpod/src/widgets/atoms/loading_atom.dart';
import 'package:http_riverpod/src/widgets/atoms/text_atom.dart';
import 'package:http_riverpod/src/widgets/atoms/text_failed_atom.dart';
import 'package:http_riverpod/src/widgets/molecules/app_bar_molecule.dart';

class UserView extends ConsumerWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userNotifierProvider);
    return Scaffold(
      appBar: AppBarMolecule(
        title: const TextAtom(text: 'Users'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () async => await ref.refresh(userNotifierProvider),
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            if (state is UserLoaded) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (BuildContext context, int index) {
                  final user = state.users[index];
                  return Card(
                    child: ListTile(
                      title: Text(user.username!),
                      subtitle: Text(user.email!),
                    ),
                  );
                },
              );
            } else if (state is UserLoading) {
              return const Center(child: LoadingAtom());
            } else if (state is UserError) {
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
