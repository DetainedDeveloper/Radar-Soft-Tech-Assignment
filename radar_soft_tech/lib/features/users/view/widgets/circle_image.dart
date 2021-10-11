import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:radar_soft_tech/features/users/view/widgets/loading_indicator.dart';

class CircleImage extends StatelessWidget {
  final double radius;
  final String imageUrl;

  const CircleImage({
    Key? key,
    required this.radius,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(64.0)),
      child: SizedBox.fromSize(
        size: Size.fromRadius(radius),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => const LoadingIndicator(),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: Color(0xFFFF0000),
          ),
        ),
      ),
    );
  }
}
