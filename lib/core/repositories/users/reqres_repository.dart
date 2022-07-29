import 'package:foonkie_monkey/core/data_sources/req_res_data_source.dart';
import 'package:foonkie_monkey/core/entities/users.dart';
import 'package:foonkie_monkey/core/models/result.dart';
import 'package:foonkie_monkey/core/repositories/users/ireqres_repository.dart';

class ReqResRepository extends IReqResRepository {
  final ReqResDataSource _reqResDataSource;

  ReqResRepository({
    required ReqResDataSource reqResDataSource,
  }) : _reqResDataSource = reqResDataSource;

  @override
  Future<Result<Users, BackendError>> getUsers({
    required int page,
  }) async {
    final result = await _reqResDataSource.getUsers(
      page: page,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(success.toEntity()),
    );
  }
}
