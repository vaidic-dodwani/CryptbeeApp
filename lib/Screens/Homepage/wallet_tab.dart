import 'dart:developer';

import 'package:cryptbee/Config/websocket_integration.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/transaction_history_builder.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:cryptbee/Screens/Utilities/static_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletTab extends ConsumerWidget {
  const WalletTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ref.watch(walletSocketProvider).when(
                data: (data) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              data['holdings_value'] > 0
                                  ? "Total Profit"
                                  : "Total Loss",
                              style: headlineSmall(
                                fontColor: Palette.primaryColor,
                              )),
                          Text(
                            "₹ ${data['holdings_value'].toStringAsFixed(2)}",
                            style: headlineSmall(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Total Wallet Balance",
                          style: labelSmall(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "₹ ${data['wallet']} ",
                          style: headlineLarge(),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Total Standings",
                          style: labelSmall(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "₹ ${data['total'].toStringAsFixed(2)} ",
                          style: headlineLarge(),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  );
                },
                error: ((error, stackTrace) => Center(
                      child: Text(error.toString()),
                    )),
                loading: () => const SizedBox(
                  height: 148,
                  width: double.infinity,
                  child: Center(
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                              color: Palette.primaryColor))),
                ),
              ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Transaction History",
              style: titleLarge(),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 380,
                  child: ref.watch(transactionsProvider).when(
                        data: (data) {
                          return ListView.builder(
                            itemCount: 5 + 1,
                            itemBuilder: (context, index) {
                              return TransactionHistoryBuilder(
                                  history:
                                      "Bought_10.63343921_AE_on_January 24; 2023_at_price_6.4889636");
                            },
                          );
                        },
                        error: (error, stackTrace) => Center(
                          child: Text(error.toString()),
                        ),
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
        ],
      ),
    );
  }
}
