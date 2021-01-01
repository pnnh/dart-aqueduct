import 'dart:io';

import 'widget.dart';

void main() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  print('Serving at ${server.address}:${server.port}');

  await for (var request in server) {
    request.response
      ..headers.contentType = ContentType('text', 'plain', charset: 'utf-8')
      ..write(ColumnView().Render())
      ..close();
  }
}
