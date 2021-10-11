import 'package:flutter/material.dart';
import 'package:radar_soft_tech/features/core/models/user.dart';
import 'package:radar_soft_tech/features/users/view/screens/show_user.dart';
import 'package:radar_soft_tech/features/users/view/widgets/circle_image.dart';
import 'package:radar_soft_tech/features/users/view/widgets/user_info_tile.dart';

class UserList extends StatelessWidget {
  final List<User> users;

  const UserList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Hero(
          tag: 'user$index',
          child: UserInfoTile(
            leading: CircleImage(radius: 24.0, imageUrl: users[index].imageUrl),
            name: '${users[index].firstName} ${users[index].lastName}',
            email: users[index].email,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowUser(
                    heroTag: 'user$index',
                    user: users[index],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
