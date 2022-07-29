import 'package:foonkie_monkey/core/api/api_utils.dart';
import 'package:foonkie_monkey/core/models/result.dart';
import 'package:foonkie_monkey/core/models/users_model.dart';

const String _kRootPath = '/api';

class ReqResDataSource {
  final ApiUtils _apiUtils;

  ReqResDataSource({
    required ApiUtils apiUtils,
  }) : _apiUtils = apiUtils;

  Future<Result<UsersModel, BackendError>> getUsers({
    required int page,
  }) async {
    final String path = '$_kRootPath/users';

    Result<dynamic, BackendError> result = await _apiUtils.makeRequest(
        method: Method.get,
        path: path,
        queryParameters: {
          'page': page.toString(),
        }
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(UsersModel.fromJson(success)),
    );
  }
}
