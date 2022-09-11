// Project imports:
import 'package:http_riverpod/src/features/users/domain/entities/user_entity.dart';

abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  final List<UserEntity> users;
  const UserLoaded(this.users);
}

class UserError extends UserState {
  final String message;
  const UserError(this.message);
}
