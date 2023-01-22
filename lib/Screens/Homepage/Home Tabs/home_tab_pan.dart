// ignore_for_file: use_build_context_synchronously

import 'package:cryptbee/Models/news_model.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/auth_heading.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/cypto_news_item_builder.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/my_holding_small_tile_builder.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTabPan extends ConsumerWidget {
  const HomeTabPan({super.key});

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
            authTitleMediumText("My Holdings"),
            const SizedBox(height: 24),
            SizedBox(
              height: 148,
              child: Wrap(
                direction: Axis.vertical,
                children: List.generate(
                  15,
                  (index) {
                    return const MyyHoldingSmallTileBuilder(
                      image: 'https://www.' +
                          'cryptocompare.com/media/37746251/btc.png',
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),
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
