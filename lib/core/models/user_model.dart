import 'package:equatable/equatable.dart';
import 'package:foonkie_monkey/core/entities/user.dart';

class UserModel extends Equatable {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const UserModel({
    required this.id,
    required this.avatar,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory UserModel.fromEntity(User entity) {
    return UserModel(
        id: entity.id,
        avatar: entity.avatar,
        email: entity.email,
        firstName: entity.firstName,
        lastName: entity.lastName);
  }

  User toEntity() => User(
        id: id,
        avatar: avatar,
        email: email,
        firstName: firstName,
        lastName: lastName,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: ((json['id'] ?? 0) as num).toInt(),
      avatar: json['avatar'] ?? '',
      email: json['email'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['first_name'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        id,
        avatar,
        email,
        firstName,
        lastName,
      ];
}
