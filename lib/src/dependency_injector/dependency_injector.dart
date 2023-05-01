// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/features/bottom/presentation/riverpod/bottom_notifier.dart';
import 'package:http_riverpod/src/features/setting/presentation/riverpod/setting_notifier.dart';
import 'package:http_riverpod/src/features/todos/data/datasources/todo_data_source.dart';
import 'package:http_riverpod/src/features/todos/data/datasources/todo_data_source_impl.dart';
import 'package:http_riverpod/src/features/todos/data/repositories/todo_repository_impl.dart';
import 'package:http_riverpod/src/features/todos/domain/repositories/todo_repository.dart';
import 'package:http_riverpod/src/features/todos/domain/usecases/todo_use_case.dart';
import 'package:http_riverpod/src/features/todos/domain/usecases/todo_use_case_impl.dart';
import 'package:http_riverpod/src/features/todos/presentation/riverpod/todo_notifier.dart';
import 'package:http_riverpod/src/features/todos/presentation/state/todo_state.dart';
import 'package:http_riverpod/src/features/users/data/datasources/user_data_source.dart';
import 'package:http_riverpod/src/features/users/data/datasources/user_data_source_impl.dart';
import 'package:http_riverpod/src/features/users/data/repositories/user_repository_impl.dart';
import 'package:http_riverpod/src/features/users/domain/repositories/user_repository.dart';
import 'package:http_riverpod/src/features/users/domain/usecases/user_use_case.dart';
import 'package:http_riverpod/src/features/users/domain/usecases/user_use_case_impl.dart';
import 'package:http_riverpod/src/features/users/presentation/riverpod/user_notifier.dart';
import 'package:http_riverpod/src/features/users/presentation/state/user_state.dart';
import 'package:http_riverpod/src/services/http_service.dart';
import 'package:http_riverpod/src/services/storage_service.dart';

// Services
final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageServiceImpl();
});

final httpServiceProvider = Provider<HttpService>((ref) {
  return HttpServiceImpl();
});

// Data Sources
final todoDatasourceProvider = Provider<TodoDataSource>((ref) {
  return TodoDataSourceImpl(httpService: ref.watch(httpServiceProvider));
});

final userDatasourceProvider = Provider<UserDataSource>((ref) {
  return UserDataSourceImpl(httpService: ref.watch(httpServiceProvider));
});

// Repositories
final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  return TodoRepositoryImpl(dataSource: ref.watch(todoDatasourceProvider));
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(dataSource: ref.watch(userDatasourceProvider));
});

// Use Cases
final todoUseCaseProvider = Provider<TodoUseCase>((ref) {
  return TodoUseCaseImpl(repository: ref.watch(todoRepositoryProvider));
});

final userUseCaseProvider = Provider<UserUseCase>((ref) {
  return UserUseCaseImpl(repository: ref.watch(userRepositoryProvider));
});

// Notifier
final bottomNotifierProvider =
    StateNotifierProvider<BottomNotifier, int>((ref) {
  return BottomNotifier();
});

final settingNotifierProvider =
    StateNotifierProvider<SettingNotifier, bool>((ref) {
  return SettingNotifier(storageService: ref.watch(storageServiceProvider));
});

final todoNotifierProvider =
    StateNotifierProvider<TodoNotifier, TodoState>((ref) {
  return TodoNotifier(useCase: ref.watch(todoUseCaseProvider));
});

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier(useCase: ref.watch(userUseCaseProvider));
});
