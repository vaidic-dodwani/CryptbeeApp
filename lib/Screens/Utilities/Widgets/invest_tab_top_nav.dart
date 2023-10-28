import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InvestTabTopNav extends ConsumerWidget {
  const InvestTabTopNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InvestTopNavItemGenerator(text: "All", index: 0),
            InvestTopNavItemGenerator(text: "My Holdings", index: 1),
            InvestTopNavItemGenerator(text: "Watchlist", index: 2),
          ],
        ),
      ),
    );
  }
}

class InvestTopNavItemGenerator extends ConsumerWidget {
  final String text;
  final int index;

  const InvestTopNavItemGenerator(
      {super.key, required this.text, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        investTopNavNotifier.setPage(index);
      },
      child: SizedBox(
        height: 40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(text, style: bodyLarge()),
            Container(
              width: (size - 32) / 3,
              height: 2,
              color: ref.watch(investTopNavProvider) == index
                  ? Palette.primaryColor
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
