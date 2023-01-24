import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:cryptbee/Screens/Utilities/static_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

PreferredSize homeAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(73),
    child: Consumer(
      builder: (context, ref, child) => AppBar(
        elevation: 0,
        leadingWidth: 68,
        backgroundColor: Palette.secondaryBlackColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 24,
            backgroundImage: CachedNetworkImageProvider(
              ref.watch(profilePhotoProvider) ?? User.photo,
            ),
          ),
        ),
        title: Text(
          User.name.toUpperCase(),
          style: bodyMedium(),
        ),
      ),
    ),
  );
}
