/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Duration pingInterval
 * Set and get the interval for sending ping signals.
 * ...
 * Set the pingInterval to null to disable sending ping messages.
 * @description Checks that the [pingInterval] is set to null correctly.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  HttpServer.bind("127.0.0.1", 0).then((server) {
    server.listen((request) {
      WebSocketTransformer
          .upgrade(request)
          .then((websocket) {
        Expect.isNull(websocket.pingInterval);
        websocket.pingInterval = const Duration(milliseconds: 100);
        Expect.isTrue(websocket.pingInterval.toString().endsWith(":00.100000"));
        websocket.pingInterval = null;
        Expect.isTrue(websocket.pingInterval == null);
        websocket.close();
      });
    });

    var webs = WebSocket.connect("ws://127.0.0.1:${server.port}/");
    webs.then((client) {
      client.close().then((_) {
        server.close();
      });
    });
  });
}
