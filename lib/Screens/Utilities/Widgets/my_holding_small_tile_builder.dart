import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/Utilities/static_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyyHoldingSmallTileBuilder extends ConsumerWidget {
  final String image;
  final String shortname;
  const MyyHoldingSmallTileBuilder(
      {super.key, required this.image, required this.shortname});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
      child: GestureDetector(
        onTap: () {
          App.currentCoin = shortname;
          context
              .goNamed(RouteNames.coinPage, pathParameters: {"shortName": shortname});
        },
        child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(
              image,
            )),
      ),
    );
  }
}
