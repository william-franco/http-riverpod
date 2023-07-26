// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/exception_handling/exception_handling.dart';
import 'package:http_riverpod/src/features/users/domain/usecases/user_use_case.dart';
import 'package:http_riverpod/src/features/users/presentation/state/user_state.dart';

abstract base class UserViewModel extends StateNotifier<UserState> {
  UserViewModel() : super(UserInitial());

  Future<void> getUsers();
}

base class UserViewModelImpl extends StateNotifier<UserState>
    implements UserViewModel {
  final UserUseCase useCase;

  UserViewModelImpl({
    required this.useCase,
  }) : super(UserInitial());

  @override
  Future<void> getUsers() async {
    state = UserLoading();
    final result = await useCase.getUsers();
    final users = switch (result) {
      Success(value: final users) => UserSuccess(users: users),
      Failure(exception: final exception) =>
        UserFailure(message: 'Something went wrong: $exception'),
    };
    state = users;
    _debug();
  }

  void _debug() {
    log('User state: $state');
  }
}
