import 'package:universal_html/html.dart';
import 'package:universal_html/parsing.dart';
import 'dart:io' as io;
import 'package:quickstart/widgets/article.dart';

void main() async {
  var myFile = io.File("web/index.html");
  var fileStr = myFile.readAsString();

  final xmlDocument = parseHtmlDocument(await fileStr);
  var artEl = xmlDocument.querySelector('some-article');
  artEl.innerText = 'B';

  var art = new ArticleWidget();
  var context = Context(IsClient: false, IsDevelop: false);
  context.IsDevelop = false;
  context.IsClient = false;
  art.Render(artEl, context);

  print(xmlDocument.documentElement.outerHtml);
  //
  // // Create a DOM tree
  // final div = new DivElement();
  // div.append(new Element.tag("h1")
  //   //..classes.add("greeting")
  //   ..appendText("Hello world!"));
  //
  // // Print outer HTML
  // print(div.outerHtml);
  // // --> <div><h1>Hello world</h1></div>
  //
  // // Do a CSS query
  // print(div.querySelector("h1").text);

  // XML
  // --> Hello world
}
