import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radar_soft_tech/features/core/models/user.dart';
import 'package:radar_soft_tech/features/users/controller/users_controller.dart';
import 'package:radar_soft_tech/features/users/view/widgets/loading_indicator.dart';
import 'package:radar_soft_tech/features/users/view/widgets/user_display/user_grid.dart';
import 'package:radar_soft_tech/features/users/view/widgets/user_display/user_list.dart';

class ListOrGrid extends StatelessWidget {
  const ListOrGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsersController _controller = Provider.of<UsersController>(context);

    return FutureBuilder<List<User>?>(
      future: _controller.users,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const LoadingIndicator();

          case ConnectionState.done:
            if (snapshot.hasData && snapshot.data != null) {
              if (_controller.showGrid) {
                return UserGrid(users: snapshot.data!);
              } else {
                return UserList(users: snapshot.data!);
              }
            } else {
              return const Center(child: Text('Something went wrong'));
            }

          default:
            return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
