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
    // log(value.toString());

    if (value == "connection established, send token to recieve data") {
      log("send token");
      channel.sink.add(App.acesss);
    } else if (value == "invalid token") {
      await ApiCalls.renewToken();
      channel.sink.add(App.acesss);
      log("invalid token");
    } else {
      yield jsonDecode(value);
    }
  }
});
