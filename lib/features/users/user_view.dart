import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod/features/users/user_singleton.dart';
import 'package:http_riverpod/widgets/atoms/loading_atom.dart';
import 'package:http_riverpod/widgets/atoms/text_atom.dart';
import 'package:http_riverpod/widgets/atoms/text_failed_atom.dart';
import 'package:http_riverpod/widgets/molecules/app_bar_molecule.dart';

class UserView extends ConsumerWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(getUsers);
    return Scaffold(
      appBar: AppBarMolecule(
        title: const TextAtom(text: 'Pessoas'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () async => await ref.refresh(refreshUsers),
          )
        ],
      ),
      body: SafeArea(
        child: userData.when(
          loading: () => const LoadingAtom(),
          error: (err, stack) => TextFailedAtom(error: '$err'),
          data: (users) => ListView.separated(
            itemCount: users.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8.0),
            itemBuilder: (BuildContext context, int index) {
              final user = users[index];
              return Card(
                child: ListTile(
                  title: TextAtom(
                    text: user.name!,
                    style: const TextStyle(fontSize: 16),
                  ),
                  subtitle: TextAtom(
                    text: user.email!,
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
                      text: user.id.toString(),
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
