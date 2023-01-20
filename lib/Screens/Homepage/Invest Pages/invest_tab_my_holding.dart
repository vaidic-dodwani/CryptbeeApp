import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InvestTabMyHoldings extends ConsumerWidget {
  const InvestTabMyHoldings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: Text(
      "My Handlings",
      style: bodyLarge(),
    ));
  }
}
