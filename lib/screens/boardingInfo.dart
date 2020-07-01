import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BordingInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boarding '),
      ),
      body: Center(

        child: WebView(
          initialUrl: 'https://arrowheadvetclinic.com/services/boarding/ ',
          javascriptMode:JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}