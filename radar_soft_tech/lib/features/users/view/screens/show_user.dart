import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:radar_soft_tech/core/resources/strings.dart';
import 'package:radar_soft_tech/features/core/models/user.dart';
import 'package:radar_soft_tech/features/users/view/widgets/circle_image.dart';
import 'package:radar_soft_tech/features/users/view/widgets/loading_indicator.dart';
import 'package:radar_soft_tech/features/users/view/widgets/user_info_tile.dart';

class ShowUser extends StatelessWidget {
  final String heroTag;
  final User user;

  const ShowUser({
    Key? key,
    required this.heroTag,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isInnerBoxScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: 256.0,
              flexibleSpace: CachedNetworkImage(
                imageUrl: user.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => const LoadingIndicator(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Color(0xFFFF0000),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(72.0),
                child: Hero(
                  tag: heroTag,
                  child: UserInfoTile(
                    name: '${user.firstName} ${user.lastName}',
                    email: user.email,
                  ),
                ),
              ),
            ),
          ];
        },
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(AppStrings.loremIpsum),
        ),
      ),
    );
  }
}
