library quickstart;

import 'package:universal_html/html.dart';


class Context {
  bool IsClient;
  bool IsDevelop;

  Context({IsClient, IsDevelop}) {
    if (IsDevelop) {
      IsClient = true;
    }
  }
}

class ArticleWidget {
  String text = '哈哈啊';

  // void OnServer() {
  //
  // }
  //
  // void OnBrowser() {
  //
  // }

  void Render(HtmlElement element, Context context) {
    // 通过xml呈现，返回xml节点

    //final div = new DivElement();
    element.append(new Element.tag("h1")
    //..classes.add("greeting")
      ..appendText("Hello world222!"));

    // Print outer HTML
    print(element.outerHtml);
    // --> <div><h1>Hello world</h1></div>

    // Do a CSS query
    print(element.querySelector("h1").text);

    if (context.IsClient) {
      var h1 = element.querySelector('h1');
      h1.onClick.listen((event) {
        window.console.log('哈哈哈');
      });
    }
  }

  //
  // void RenderHtml() {
  //   // 通过dom操作呈现，返回dom对象
  //   return null;
  // }
}
