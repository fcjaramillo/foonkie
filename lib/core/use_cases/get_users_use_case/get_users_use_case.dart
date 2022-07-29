import 'package:foonkie_monkey/core/entities/users.dart';
import 'package:foonkie_monkey/core/models/result.dart';
import 'package:foonkie_monkey/core/repositories/users/ireqres_repository.dart';

class GetUsersUseCase {
  final IReqResRepository _reqResRepository;

  GetUsersUseCase({
    required IReqResRepository reqResRepository,
  }) : _reqResRepository = reqResRepository;

  Future<Result<Users, BackendError>> call({
    required int page,
  }) =>
      _reqResRepository.getUsers(page: page);
}
