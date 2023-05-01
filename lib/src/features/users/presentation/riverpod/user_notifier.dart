// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/exceptions/networking_exception.dart';
import 'package:http_riverpod/src/features/users/domain/usecases/user_use_case.dart';
import 'package:http_riverpod/src/features/users/presentation/state/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  final UserUseCase useCase;

  UserNotifier({required this.useCase}) : super(const UserInitial()) {
    getUsers();
  }

  Future<void> getUsers() async {
    try {
      state = const UserLoading();
      final albums = await useCase.getUsers();
      state = UserLoaded(albums);
      _debugProvider();
    } on NetworkException {
      state = const UserError('Couldnt fetch weather. Is the device online?');
      _debugProvider();
    }
  }

  void _debugProvider() {
    log('User state: $state');
  }
}
