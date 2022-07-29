import 'package:foonkie_monkey/core/entities/users.dart';
import 'package:foonkie_monkey/core/models/result.dart';

abstract class IReqResRepository{
  Future<Result<Users, BackendError>> getUsers({
    required int page,
  });
}