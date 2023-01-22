import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyyHoldingSmallTileBuilder extends ConsumerWidget {
  final String image;
  const MyyHoldingSmallTileBuilder({super.key, required this.image});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
      child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 25,
          backgroundImage: CachedNetworkImageProvider(
            image,
          )),
    );
  }
}
