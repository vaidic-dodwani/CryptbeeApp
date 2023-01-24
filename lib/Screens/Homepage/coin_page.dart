// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Config/websocket_integration.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Screens/Utilities/Riverpod/riverpod_variables.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:cryptbee/Screens/Utilities/Widgets/auth_heading.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/log_in_button.dart';
import 'package:cryptbee/Screens/Utilities/Widgets/utilities.dart';
import 'package:cryptbee/Screens/Utilities/static_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:toast/toast.dart';

class CoinPage extends ConsumerStatefulWidget {
  CoinPage({super.key, required this.shortName});
  final String shortName;
  List<CoinData> chartData = [];
  final controller = TextEditingController();

  ChartSeriesController? chartSeriesController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CoinPageState();
}

class _CoinPageState extends ConsumerState<CoinPage> {
  @override
  void initState() {
    log(widget.shortName);
    ApiCalls.inWatchlist(widget.shortName).then((value) {
      log(value.toString());
      inWatchListBoolNotifier.setBool(value);
    });
    ApiCalls.getCoinDetails().then((value) {
      coinPageCoinDescNotifier.setVal(value['Description']);
    });
    ref.listenManual(singleCoinsSocketProvider, (previous, next) {
      {
        next.whenData((value) {
          var data = value['data'];
          if (widget.chartData.length < 10) {
            widget.chartData = [
              ...widget.chartData,
              CoinData(DateTime.now(), data['Price'])
            ];
          } else {
            widget.chartData.add(CoinData(DateTime.now(), data['Price']));
            widget.chartData.removeAt(0);
          }
          if (widget.chartSeriesController != null) {
            if (widget.chartData.length >= 10) {
              widget.chartSeriesController!.updateDataSource(
                  addedDataIndex: widget.chartData.length - 1,
                  removedDataIndex: 0);
            } else {
              widget.chartSeriesController!.updateDataSource(
                  addedDataIndex: widget.chartData.length - 1);
            }
          }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.currentCoin = widget.shortName;
    final singleCoinsAsyncValue = ref.watch(singleCoinsSocketProvider);
    return singleCoinsAsyncValue.when(
      data: (data) {
        data = data['data'];
        return Scaffold(
          backgroundColor: Palette.secondaryBlackColor,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 38),
                        GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: Row(
                              children: [
                                const SizedBox(
                                  height: 28,
                                  width: 28,
                                  child: Icon(
                                    Icons.chevron_left_sharp,
                                    color: Palette.secondaryOffWhiteColor,
                                  ),
                                ),
                                authTitleMediumText("Back")
                              ],
                            )),
                        const SizedBox(height: 29),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 19,
                              backgroundImage: CachedNetworkImageProvider(
                                "https://www.${data['ImageURL']}",
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                widget.shortName,
                                style: titleLarge(),
                              ),
                            )
                          ],
                        ),
                        Center(
                            child: SizedBox(
                          height: 325,
                          child: Center(
                            child: SfCartesianChart(
                              enableAxisAnimation: true,
                              primaryXAxis: DateTimeAxis(
                                dateFormat: DateFormat.Hms(),
                                majorGridLines: const MajorGridLines(width: 0),
                              ),
                              primaryYAxis: NumericAxis(
                                  isVisible: true,
                                  majorGridLines:
                                      const MajorGridLines(width: 0)),
                              zoomPanBehavior:
                                  ZoomPanBehavior(enablePanning: true),
                              series: <ChartSeries>[
                                FastLineSeries<CoinData, DateTime>(
                                  onRendererCreated: (series) {
                                    widget.chartSeriesController = series;
                                  },
                                  dataSource: widget.chartData,
                                  xValueMapper: (CoinData data, _) => data.time,
                                  yValueMapper: (CoinData data, _) => data.data,
                                )
                              ],
                            ),
                          ),
                        )),
                        const SizedBox(height: 25),
                        SizedBox(
                          height: 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Prices", style: titleMedium()),
                              Text("₹ ${data['Price'].toStringAsFixed(2)}",
                                  style: bodyLarge()),
                              Row(
                                children: [
                                  (data['ChangePct'] >= 0)
                                      ? const Icon(Icons.arrow_upward_rounded,
                                          color: Palette.secondaryCorrectColor)
                                      : const Icon(Icons.arrow_downward_rounded,
                                          color: Palette.secondaryErrorColor),
                                  Text(
                                    "${data['ChangePct'].toStringAsFixed(2)} %",
                                    style: bodyLarge(
                                        fontColor: (data['ChangePct'] >= 0)
                                            ? Palette.secondaryCorrectColor
                                            : Palette.secondaryErrorColor),
                                  ),
                                ],
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  if (ref.watch(inWatchlistBoolProvider)) {
                                    ApiCalls.modifyWatchlist("remove");
                                  } else {
                                    ApiCalls.modifyWatchlist("add");
                                  }
                                  inWatchListBoolNotifier.toggle();
                                },
                                icon: Icon(
                                  ref.watch(inWatchlistBoolProvider) ?? false
                                      ? Icons.bookmark_sharp
                                      : Icons.bookmark_border_sharp,
                                  color: Palette.secondaryOffWhiteColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        authBodyLarge("About"),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 148,
                          child: SingleChildScrollView(
                            child: ref.watch(coinPageCoinDescProvider) == null
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Palette.primaryColor,
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      ref
                                          .watch(coinPageCoinDescProvider)
                                          .toString(),
                                      style: bodyLarge(),
                                    ),
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: User.panVerify ?? false
                                ? LogInButton(
                                    text: "Buy Now",
                                    function: () {
                                      log("toggle 1");
                                      coinPagePopupNotifier.toggle();
                                      log("toggle 2");
                                    })
                                : LogInButton(
                                    text: "Verify Pan",
                                    function: () {
                                      context
                                          .goNamed(RouteNames.personalDetails);
                                    },
                                  ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ref.watch(coinPagePopUpProvider)
                      ? SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.05)),
                              child: Center(
                                child: Container(
                                  color: Palette.secondaryBlackColor,
                                  width: 264,
                                  height: 362,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: IconButton(
                                              icon: const Icon(
                                                Icons.close_sharp,
                                                color: Palette
                                                    .secondaryOffWhiteColor,
                                              ),
                                              onPressed: () {
                                                coinPagePopupNotifier.toggle();
                                              }),
                                        ),
                                        const SizedBox(height: 9),
                                        Text(
                                          "Do You Want To Buy",
                                          style: titleMedium(),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "Current Price     ₹${data['Price'].toStringAsFixed(4)}",
                                          style: bodyLarge(),
                                        ),
                                        const SizedBox(height: 30),
                                        TextFormField(
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[0-9]')),
                                          ],
                                          onChanged: (text) {
                                            coinPageCoinControllerNotifier
                                                .setVal(text);
                                          },
                                          controller: widget.controller,
                                          keyboardType: TextInputType.number,
                                          style: bodyMedium(),
                                          decoration: InputDecoration(
                                            counterText: "",
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            hintStyle: bodyMedium(),
                                            labelText: "Amount",
                                            hintText: "Enter the amount",
                                            labelStyle: labelMedium(),
                                            errorBorder: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                                borderSide: BorderSide(
                                                    color: Palette
                                                        .secondaryOffWhiteColor,
                                                    width: 2)),
                                            enabledBorder: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                                borderSide: BorderSide(
                                                    color: Palette
                                                        .secondaryOffWhiteColor,
                                                    width: 2)),
                                            disabledBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                12)),
                                                    borderSide: BorderSide(
                                                        color: Palette
                                                            .secondaryOffWhiteColor,
                                                        width: 2)),
                                            focusedBorder: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                                borderSide: BorderSide(
                                                    color: Palette
                                                        .secondaryOffWhiteColor,
                                                    width: 2)),
                                            border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                                borderSide: BorderSide(
                                                    color: Palette
                                                        .secondaryOffWhiteColor,
                                                    width: 2)),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "Total Coins   ${((ref.watch(coinPageCoinControllerProvider) ?? 1) / (data['Price'])).toStringAsFixed(6)}",
                                          style: bodyLarge(),
                                        ),
                                        const SizedBox(height: 20),
                                        LogInButton(
                                          loaderProvider:
                                              coinPageButtonLoaderProvider,
                                          text: "Buy",
                                          function: () async {
                                            coinPageButtonLoaderNotifier
                                                .toggle();
                                            final output = await ApiCalls
                                                .buyCoin(ref.watch(
                                                        coinPageCoinControllerProvider) ??
                                                    1);

                                            if (output['statusCode'] == 202) {
                                              coinPagePopupNotifier.toggle;
                                              ToastContext().init(context);
                                              Toast.show(
                                                  output[output.keys.first][0],
                                                  duration: 5,
                                                  gravity: Toast.bottom);
                                            } else {
                                              ToastContext().init(context);
                                              Toast.show(
                                                  output[output.keys.first][0],
                                                  duration: 5,
                                                  gravity: Toast.bottom);
                                            }
                                            coinPageButtonLoaderNotifier
                                                .toggle();
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Text(
          error.toString(),
          style: titleLarge(),
        );
      },
      loading: () {
        return const SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(color: Palette.primaryColor),
            ),
          ),
        );
      },
    );
  }
}

class CoinData {
  CoinData(this.time, this.data);
  final DateTime time;
  final double data;
}
