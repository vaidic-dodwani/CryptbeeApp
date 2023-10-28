// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/auth_heading.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/profile_tile_builder.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:cryptbee/Screens/Utilities/static_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class ProfileTab extends ConsumerWidget {
  ProfileTab({super.key});
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Container(
                height: 552,
                width: 328,
                decoration: const BoxDecoration(
                  color: Palette.neutralBlack,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 120,
                      width: 116,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 58,
                            backgroundImage: CachedNetworkImageProvider(
                              ref.watch(profilePhotoProvider) ?? User.photo,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () async {
                                  final XFile? image = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (image != null) {
                                    profileTabBlurLoaderNotifier.toggle();
                                    final output =
                                        await ApiCalls.sendProfilePhoto(
                                            File(image.path));

                                    if (output['statusCode'] == 200) {
                                      profilePhoto.updateProfilePhoto(
                                          output['profile_picture']);
                                    } else {
                                      ToastContext().init(context);
                                      Toast.show(output[output.keys.first][0],
                                          duration: 5, gravity: Toast.bottom);
                                    }
                                    profileTabBlurLoaderNotifier.toggle();
                                  }
                                },
                                icon: const Icon(
                                  Icons.edit_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    authTitleLargeText(User.name),
                    const SizedBox(height: 8),
                    authLabelLargeText(User.email),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      child: Column(
                        children: [
                          ProfileTileBuilder(
                            text: "Personal Details",
                            route: RouteNames.personalDetails,
                          ),
                          ProfileTileBuilder(
                            text: "Security",
                            route: RouteNames.security,
                          ),
                          ProfileTileBuilder(text: "About Cryptbee"),
                          ProfileTileBuilder(text: "Help And Support"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        ref.watch(profileTabBlurLoaderProvider)
            ? SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.05)),
                    child: const Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Palette.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
