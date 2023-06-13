// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/common_widgets/common_padding.dart';
import 'package:http_riverpod/src/dependency_injector/dependency_injector.dart';
import 'package:http_riverpod/src/features/users/presentation/state/user_state.dart';

class UserView extends ConsumerStatefulWidget {
  const UserView({super.key});

  @override
  ConsumerState<UserView> createState() => _UserViewState();
}

class _UserViewState extends ConsumerState<UserView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      ref.read(userViewModelProvider.notifier).getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Users'),
      ),
      body: CommonPadding(
        child: RefreshIndicator(
          onRefresh: () {
            return ref.read(userViewModelProvider.notifier).getUsers();
          },
          child: Consumer(
            builder: (context, ref, child) {
              return switch (ref.watch(userViewModelProvider)) {
                UserInitial() => const Text('List is empty.'),
                UserLoading() => const CircularProgressIndicator(),
                UserSuccess(users: final users) => ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      final user = users[index];
                      return Card(
                        child: ListTile(
                          title: Text(user.username!),
                          subtitle: Text(user.email!),
                        ),
                      );
                    },
                  ),
                UserFailure(message: final message) => Text(message),
              };
            },
          ),
        ),
      ),
    );
  }
}
