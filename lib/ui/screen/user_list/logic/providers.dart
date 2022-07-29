import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foonkie_monkey/core/dependencies/req_res_providers.dart';
import 'package:foonkie_monkey/core/entities/result_state.dart';
import 'package:foonkie_monkey/core/entities/users.dart';
import 'package:foonkie_monkey/core/models/result.dart';
import 'package:foonkie_monkey/ui/screen/user_list/logic/get_users_notifier.dart';

final getUsersNotifierProvider =
    StateNotifierProvider.autoDispose<GetUsersNotifier, ResultState<Users, BackendError>>(
  (ref) => GetUsersNotifier(
    getUsersUseCase: ref.watch(getUsersUseCaseProvider),
  ),
);
