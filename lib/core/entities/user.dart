import 'package:equatable/equatable.dart';

class User extends Equatable{
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const User({
    required this.id,
    required this.avatar,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object?> get props => [
    id,
    avatar,
    email,
    firstName,
    lastName,
  ];

}