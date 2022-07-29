import 'package:equatable/equatable.dart';
import 'package:foonkie_monkey/core/entities/user.dart';

class Users extends Equatable {
  final int page;
  final int perPage;
  final int total;
  final int totalPage;
  final List<User> data;

  const Users({
    required this.data,
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPage,
  });

  Users copyWith({List<User>? data}) => Users(
        data: data ?? this.data,
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
