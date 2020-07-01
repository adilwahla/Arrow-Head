import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AdressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address '),
      ),
      body:WebView(
        initialUrl: 'https://arrowheadvetclinic.com/contact-us/getdirections/',
        javascriptMode:JavascriptMode.unrestricted,
      ),
    );
  }
}
