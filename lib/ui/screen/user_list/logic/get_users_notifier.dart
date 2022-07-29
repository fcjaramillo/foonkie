import 'package:foonkie_monkey/core/entities/result_state.dart';
import 'package:foonkie_monkey/core/entities/users.dart';
import 'package:foonkie_monkey/core/models/result.dart';
import 'package:foonkie_monkey/core/use_cases/get_users_use_case/get_users_use_case.dart';
import 'package:riverpod/riverpod.dart';

class GetUsersNotifier
    extends StateNotifier<ResultState<Users, BackendError>> {
  final GetUsersUseCase _getUsersUseCase;

  GetUsersNotifier({
    required GetUsersUseCase getUsersUseCase,
  })  : _getUsersUseCase = getUsersUseCase,
        super(ResultState.loading());

  Future<void> getUsers() async {
    final response = await _getUsersUseCase.call(page: 1);
    final response2 = await _getUsersUseCase.call(page: 2);

    if(response.isFail){
      state = ResultState.error(response.failRes!);
    } else if (response2.isFail){
      state = ResultState.error(response2.failRes!);
    } else {

      state = ResultState.data(response2.successRes!.copyWith(
        data: [
          ...response.successRes!.data,
          ...response2.successRes!.data
        ],
      ));
    }

    /*state = response.when(
      fail: (fail) => ResultState.error(fail),
      success: (success) {

        return ResultState.data(success);
      },
    );*/
  }
}
