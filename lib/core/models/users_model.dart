import 'package:equatable/equatable.dart';
import 'package:foonkie_monkey/core/entities/users.dart';
import 'package:foonkie_monkey/core/models/user_model.dart';

class UsersModel extends Equatable {
  final int page;
  final int perPage;
  final int total;
  final int totalPage;
  final List<UserModel> data;

  const UsersModel({
    required this.data,
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPage,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      data: ((json['data'] ?? []) as List)
          .map((u) => UserModel.fromJson(u))
          .toList(),
      page: ((json['page'] ?? 0) as num).toInt(),
      perPage: ((json['per_page'] ?? 0) as num).toInt(),
      total: ((json['total'] ?? 0) as num).toInt(),
      totalPage: ((json['total_pages'] ?? 0) as num).toInt(),
    );
  }

  Users toEntity() => Users(
        data: data.map((u) => u.toEntity()).toList(),
        page: page,
        perPage: perPage,
        total: total,
        totalPage: totalPage,
      );

  @override
  List<Object?> get props => [
        data,
        page,
        perPage,
        total,
        totalPage,
      ];
}
