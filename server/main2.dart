import 'dart:convert';
import 'dart:io';

void main() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8081);
  print('Serving at ${server.address}:${server.port}');

  await for (var request in server) {
    handleRequest(request);
  }
}

void handleRequest(HttpRequest request) async {
  var path = request.uri.path;
  print("===>${path}");
  var response = request.response;

  if (path == '/') {
    await writeFile(response, './build/web/index.html');
  } else {
    await writeFile(response, './build/web/${path.trimRight()}');
  }
  await response.close();
}

void writeFile(HttpResponse response, String filePath) async {
  var myFile = File(filePath);

  if (!await myFile.exists()) {
    response.statusCode = 404;
    return;
  }
  if (filePath.endsWith('.html')) {
    response.headers.contentType = ContentType('text', 'html');
    await response.addStream(await myFile.openRead());
  } else if (filePath.endsWith('.css')) {
    response.headers.contentType = ContentType('text', 'css');
    await response.addStream(await myFile.openRead());
  } else if (filePath.endsWith('.js')) {
    response.headers.contentType = ContentType('application', 'javascript');
    await response.addStream(await myFile.openRead());
  } else if (filePath.endsWith('.map')) {
    response.headers.contentType = ContentType('text', 'plain');
    await response.addStream(await myFile.openRead());
  } else if (filePath.endsWith('.dart')) {
    response.headers.contentType = ContentType('application', 'dart');
    //var content = await myFile.readAsString();
    await response.addStream(myFile.openRead());
  } else {
    response.write(await myFile.readAsBytes());
  }

}
