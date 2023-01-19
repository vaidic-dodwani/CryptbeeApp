import 'dart:convert';
import 'dart:developer';
import 'package:cryptbee/Config/websocket_link.dart';
import 'package:cryptbee/Utilities/static_classes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';

final allCoinsSocketProvider =
    StreamProvider.autoDispose<dynamic>((ref) async* {
  // Open the connection
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
      log("invalid token");
    } else {
      yield jsonDecode(value);
    }
  }
});




//  channel.stream.listen(
//     (data) async {
//       if (data == "invalid token") {
//         log(data.toString());
//         await ApiCalls.renewToken();
//         channel = IOWebSocketChannel.connect(SocketLinks.allCoinWebSocketLink);
//         channel.sink.add(App.acesss);
//       }
//     },
//   );