import 'package:flutter/material.dart';
import 'package:radar_soft_tech/features/core/models/user.dart';
import 'package:radar_soft_tech/features/users/view/screens/show_user.dart';
import 'package:radar_soft_tech/features/users/view/widgets/circle_image.dart';
import 'package:radar_soft_tech/features/users/view/widgets/user_info_tile.dart';

class UserGrid extends StatelessWidget {
  final List<User> users;

  const UserGrid({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 0.8,
        ),
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Hero(
            tag: 'user$index',
            child: GestureDetector(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  boxShadow: [BoxShadow(color: Color(0xFFCCCCCC), blurRadius: 8.0)],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleImage(radius: 64.0, imageUrl: users[index].imageUrl),
                    UserInfoTile(
                      name: '${users[index].firstName} ${users[index].lastName}',
                      email: users[index].email,
                    ),
                  ],
                ),
              ),
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
      ),
    );
  }
}
