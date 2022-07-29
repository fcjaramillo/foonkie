import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foonkie_monkey/core/data_sources/req_res_data_source.dart';
import 'package:foonkie_monkey/core/dependencies/apis_provider.dart';
import 'package:foonkie_monkey/core/repositories/users/reqres_repository.dart';
import 'package:foonkie_monkey/core/use_cases/get_users_use_case/get_users_use_case.dart';

final reqResDataSourceProvider =
    Provider((ref) => ReqResDataSource(apiUtils: ref.watch(reqResApiProvider)));

final reqRessRepositoryProvider = Provider((ref) =>
    ReqResRepository(reqResDataSource: ref.watch(reqResDataSourceProvider)));

final getUsersUseCaseProvider = Provider(
  (ref) => GetUsersUseCase(
    reqResRepository: ref.watch(reqRessRepositoryProvider),
  ),
);
