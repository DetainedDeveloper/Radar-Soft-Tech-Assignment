import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radar_soft_tech/core/resources/strings.dart';
import 'package:radar_soft_tech/features/users/controller/users_controller.dart';
import 'package:radar_soft_tech/features/users/view/widgets/list_grid_switch.dart';
import 'package:radar_soft_tech/features/users/view/widgets/user_display/list_or_grid.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UsersController>(
      create: (_) => UsersController(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('${AppStrings.appName} Users'),
          actions: const [ListGridSwitch()],
        ),
        body: const ListOrGrid(),
      ),
    );
  }
}
