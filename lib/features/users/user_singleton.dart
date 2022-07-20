// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod/features/users/user_repository.dart';

final userProvider = Provider((ref) {
  return UserRepositoryImpl();
});

final getUser = FutureProvider((ref) async {
  int id = 0;
  return await ref.read(userProvider).getUser(id);
});

final getUsers = FutureProvider((ref) async {
  return await ref.read(userProvider).getUsers();
});

final refreshUsers = FutureProvider((ref) async {
  return await ref.read(userProvider).refreshUsers();
});
