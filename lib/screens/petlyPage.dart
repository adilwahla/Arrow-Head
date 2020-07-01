import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PetlyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PETLY '),
      ),
      body:  WebView(
        initialUrl: 'https://www.petly.com/ ',
        javascriptMode:JavascriptMode.unrestricted,
      ),
    );
  }
}