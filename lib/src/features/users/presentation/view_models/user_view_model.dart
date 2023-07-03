// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/features/users/domain/usecases/user_use_case.dart';
import 'package:http_riverpod/src/features/users/presentation/state/user_state.dart';

class UserViewModel extends StateNotifier<UserState> {
  final UserUseCase useCase;

  UserViewModel({
    required this.useCase,
  }) : super(UserInitial());

  Future<void> getUsers() async {
    try {
      state = UserLoading();
      final users = await useCase.getUsers();
      state = UserSuccess(users: users);
      _debugProvider();
    } catch (error) {
      state = UserFailure(
        message: 'Couldnt fetch weather. Is the device online?',
      );
      _debugProvider();
    }
  }

  void _debugProvider() {
    log('User state: $state');
  }
}
