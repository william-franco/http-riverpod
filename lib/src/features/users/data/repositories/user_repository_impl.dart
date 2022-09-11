// Project imports:
import 'package:http_riverpod/src/features/users/data/datasources/user_data_source.dart';
import 'package:http_riverpod/src/features/users/domain/entities/user_entity.dart';
import 'package:http_riverpod/src/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<List<UserEntity>> getUsers() async {
    return await _dataSource.getUsers();
  }

  // @override
  // Future<List<AlbumEntity>> getAlbums() async {
  //   try {
  //     final result = await dataSource.getAlbums();
  //     return result;
  //   } catch (e) {
  //     // return NetworkException();
  //     throw UnimplementedError();
  //   }
  // }
}
