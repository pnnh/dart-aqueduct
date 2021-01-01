import 'dart:html';

void main() {
  querySelector('#output').text = '生生世世';
  querySelector('#output').style.color = 'green';


  window.fetch("localhost:8080").then((value) =>
    print(value)
  );
}
