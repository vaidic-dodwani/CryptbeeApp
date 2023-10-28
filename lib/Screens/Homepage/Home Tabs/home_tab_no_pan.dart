// ignore_for_file: use_build_context_synchronously
import 'package:cryptbee/Models/news_model.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/auth_heading.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/cypto_news_item_builder.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/log_in_button.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:cryptbee/Screens/Utilities/static_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeTabNoPan extends ConsumerWidget {
  const HomeTabNoPan({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(getNewsProvider);
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assests/illustrations/pan.svg",
            ),
            const SizedBox(
              height: 24,
            ),
            LogInButton(
              text: "Verify Pan",
              function: () {
                context.pushNamed(RouteNames.panNumber,
                    pathParameters: {'email': User.email});
                // context.goNamed(RouteNames.panNumberHome,
                //     pathParameters: {'email': User.email});
              },
            ),
            const SizedBox(
              height: 36,
            ),
            authTitleMediumText("Crypto News"),
            const SizedBox(height: 8),
            Expanded(
              child: news.when(
                data: (data) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ((index) != (data.length))
                          ? cryptoNewsItemBuilder(
                              News(
                                headline: data[index]['headline'],
                                news: data[index]['news'],
                                image: data[index]['image'],
                              ),
                            )
                          : Container(height: 100);
                    },
                    itemCount: data.length + 1,
                  );
                },
                error: (error, stackTrace) {
                  return Center(
                    child: Text(
                      error.toString(),
                      style: titleLarge(),
                    ),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Palette.primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
