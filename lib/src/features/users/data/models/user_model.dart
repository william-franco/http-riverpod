// Project imports:
import 'package:http_riverpod/src/features/users/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? website;

  const UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      website: json['website'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['website'] = website;
    return data;
  }

  static List<UserModel> jsonToList(List<dynamic> data) {
    return data.map((itens) => UserModel.fromJson(itens)).toList();
  }
}
