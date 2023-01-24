import 'dart:convert';
import 'dart:developer';
import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Config/websocket_link.dart';
import 'package:cryptbee/Screens/Utilities/static_classes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';

final allCoinsSocketProvider =
    StreamProvider.autoDispose<dynamic>((ref) async* {
  IOWebSocketChannel channel =
      IOWebSocketChannel.connect(SocketLinks.allCoinWebSocketLink);

  ref.onDispose(() {
    log("Closing allCoinsSocketProvider");
    channel.sink.close();
  });

  await for (final value in channel.stream) {
    if (value == "connection established, send token to recieve data") {
      log("send token");
      channel.sink.add(App.acesss);
    } else if (value == "invalid token") {
      await ApiCalls.renewToken();
      channel.sink.add(App.acesss);
      log("invalid token");
    } else if (value ==
        "authorised, enter ALL or name of the coin ,PROFIT to get current holdings") {
      log("sending all");
      channel.sink.add("ALL");
    } else {
      yield jsonDecode(value);
    }
  }
});

final singleCoinsSocketProvider = StreamProvider.autoDispose<dynamic>(
  (ref) async* {
    await ApiCalls.renewToken();
    IOWebSocketChannel channel =
        IOWebSocketChannel.connect(SocketLinks.allCoinWebSocketLink);

    ref.onDispose(() {
      log("Closing singleCoinSocketProvider${App.currentCoin}");
      channel.sink.close();
    });

    await for (final value in channel.stream) {
      if (value == "connection established, send token to recieve data") {
        log("send token");
        channel.sink.add(App.acesss);
      } else if (value ==
          "authorised, enter ALL or name of the coin ,PROFIT to get current holdings") {
        log("sending ${App.currentCoin}");
        channel.sink.add(App.currentCoin);
      } else {
        yield jsonDecode(value);
      }
    }
  },
);

final walletSocketProvider = StreamProvider.autoDispose<dynamic>(
  (ref) async* {
    await ApiCalls.renewToken();
    IOWebSocketChannel channel =
        IOWebSocketChannel.connect(SocketLinks.allCoinWebSocketLink);

    ref.onDispose(() {
      log("Closing singleCoinSocketProvider${App.currentCoin}");
      channel.sink.close();
    });

    await for (final value in channel.stream) {
      if (value == "connection established, send token to recieve data") {
        log("send token");
        channel.sink.add(App.acesss);
      } else if (value ==
          "authorised, enter ALL or name of the coin ,PROFIT to get current holdings") {
        log("sending Profit}");
        channel.sink.add("PROFIT");
      } else {
        yield jsonDecode(value);
      }
    }
  },
);
