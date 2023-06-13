// Project imports:
import 'package:http_riverpod/src/features/users/domain/entities/user_entity.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  final List<UserEntity> users;

  UserSuccess({required this.users});
}

final class UserFailure extends UserState {
  final String message;

  UserFailure({required this.message});
}
