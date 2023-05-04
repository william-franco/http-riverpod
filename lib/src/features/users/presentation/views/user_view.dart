// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/dependency_injector/dependency_injector.dart';
import 'package:http_riverpod/src/features/users/presentation/state/user_state.dart';

class UserView extends ConsumerWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async {
            return await ref.refresh(userNotifierProvider);
          },
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
                return const CircularProgressIndicator();
              } else if (state is UserError) {
                return Text(state.message);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
