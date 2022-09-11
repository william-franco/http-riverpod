// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/features/users/data/datasources/user_data_source_impl.dart';
import 'package:http_riverpod/src/features/users/data/repositories/user_repository_impl.dart';
import 'package:http_riverpod/src/features/users/domain/usecases/user_use_case_impl.dart';
import 'package:http_riverpod/src/features/users/presentation/riverpod/user_notifier.dart';
import 'package:http_riverpod/src/features/users/presentation/state/user_state.dart';

final dioProvider = Provider((ref) => Dio());

final userDatasourceProvider = Provider((ref) {
  return UserDataSourceImpl(ref.watch(dioProvider));
});

final userRepositoryProvider = Provider((ref) {
  return UserRepositoryImpl(ref.watch(userDatasourceProvider));
});

final userUseCaseProvider = Provider((ref) {
  return UserUseCaseImpl(ref.watch(userRepositoryProvider));
});

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier(ref.watch(userUseCaseProvider));
});
