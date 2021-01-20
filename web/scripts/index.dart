import 'dart:developer';
import 'package:universal_html/html.dart';
//import '../../components/article.dart';
import '../widgets/article.dart';
import 'package:quickstart/widgets/article.dart';

void main() {
  // var htmlEl = document.createElement('html');
  // var bodyEl = document.createElement('body');
  // bodyEl.innerText = 'aaaa';
  // htmlEl.append(bodyEl);
  // document.append(htmlEl);

  //
  // window.fetch("localhost:8080").then((value) =>
  //   print(value)
  // );

  var artEl = document.querySelector('some-article');

  var art = new ArticleWidget();
  var context = Context(IsClient: true, IsDevelop: true);
  context.IsDevelop = true;
  context.IsClient = true;

  art.Render(artEl, context);

  var div = document.createElement('div');
  div.innerText = 'aaaabbbb';
  document.body.append(div);
}
