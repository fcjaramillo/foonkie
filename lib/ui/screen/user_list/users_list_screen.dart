import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foonkie_monkey/ui/screen/user/user_screen.dart';
import 'package:foonkie_monkey/ui/screen/user_list/logic/providers.dart';
import 'package:foonkie_monkey/ui/utils/constants/constants.dart';
import 'package:foonkie_monkey/ui/utils/constants/routes.dart';

class UsersListScreen extends ConsumerStatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  static Route goTo() => MaterialPageRoute(
        builder: (_) => const UsersListScreen(),
        settings: const RouteSettings(name: kRouteUserList),
      );

  @override
  ConsumerState<UsersListScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UsersListScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () => ref.read(getUsersNotifierProvider.notifier).getUsers(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getUsersNotifierProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      appBar: AppBar(
        title: Text('User list. Page ${state.data?.page ?? 1}'),
      ),
      body: SafeArea(
        child: Visibility(
          replacement: Visibility(
            replacement: ListView.builder(
              itemBuilder: (context, int i) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(state.data!.data[i].avatar),
                  ),
                  title: Text(
                      '${state.data!.data[i].firstName} ${state.data!.data[i].lastName}'),
                  subtitle: Text(state.data!.data[i].email),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserScreen(user: state.data?.data[i]),
                        settings: const RouteSettings(name: kRouteUserScreen),
                      ),
                    );
                  },
                );
              },
              itemCount: state.data?.data.length ?? kDimens0.toInt(),
            ),
            visible: state.data == null,
            child: const Center(child: Text('Error')),
          ),
          visible: state.isLoading,
          child: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
