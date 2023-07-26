// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/features/bottom/presentation/view_models/bottom_view_model.dart';
import 'package:http_riverpod/src/features/setting/presentation/view_models/setting_view_model.dart';
import 'package:http_riverpod/src/features/todos/data/datasources/todo_data_source.dart';
import 'package:http_riverpod/src/features/todos/data/datasources/todo_data_source_impl.dart';
import 'package:http_riverpod/src/features/todos/data/repositories/todo_repository_impl.dart';
import 'package:http_riverpod/src/features/todos/domain/repositories/todo_repository.dart';
import 'package:http_riverpod/src/features/todos/domain/usecases/todo_use_case.dart';
import 'package:http_riverpod/src/features/todos/domain/usecases/todo_use_case_impl.dart';
import 'package:http_riverpod/src/features/todos/presentation/state/todo_state.dart';
import 'package:http_riverpod/src/features/todos/presentation/view_models/todo_view_model.dart';
import 'package:http_riverpod/src/features/users/data/datasources/user_data_source.dart';
import 'package:http_riverpod/src/features/users/data/datasources/user_data_source_impl.dart';
import 'package:http_riverpod/src/features/users/data/repositories/user_repository_impl.dart';
import 'package:http_riverpod/src/features/users/domain/repositories/user_repository.dart';
import 'package:http_riverpod/src/features/users/domain/usecases/user_use_case.dart';
import 'package:http_riverpod/src/features/users/domain/usecases/user_use_case_impl.dart';
import 'package:http_riverpod/src/features/users/presentation/state/user_state.dart';
import 'package:http_riverpod/src/features/users/presentation/view_models/user_view_model.dart';
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

// ViewModels
final bottomViewModelProvider =
    StateNotifierProvider<BottomViewModel, int>((ref) {
  return BottomViewModel();
});

final settingViewModelProvider =
    StateNotifierProvider<SettingViewModel, bool>((ref) {
  return SettingViewModel(storageService: ref.watch(storageServiceProvider));
});

final todoViewModelProvider =
    StateNotifierProvider<TodoViewModel, TodoState>((ref) {
  return TodoViewModelImpl(useCase: ref.watch(todoUseCaseProvider));
});

final userViewModelProvider =
    StateNotifierProvider<UserViewModel, UserState>((ref) {
  return UserViewModelImpl(useCase: ref.watch(userUseCaseProvider));
});
