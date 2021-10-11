import 'package:flutter/material.dart';
import 'package:radar_soft_tech/core/resources/styles.dart';

class UserInfoTile extends StatelessWidget {
  final String name, email;
  final Widget? leading;
  final Function()? onTap;

  const UserInfoTile({
    Key? key,
    required this.name,
    required this.email,
    this.leading,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        tileColor: const Color(0xBBFFFFFF),
        leading: leading,
        title: Text(name, maxLines: 1, style: AppStyles.titleText),
        subtitle: Text(email, maxLines: 1, style: AppStyles.subtitleText),
        onTap: onTap,
      ),
    );
  }
}
