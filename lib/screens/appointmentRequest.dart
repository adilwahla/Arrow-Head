import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppointmentRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Request '),
      ),
      body:  Center(

        child: WebView(
          initialUrl: 'https://www.pethealthnetworkpro.com/communications/public/petowner/#/request-appointment?pid=6a3a9af6-b51f-4aa5-a096-b831b7e61efc&tlaeid=797481c1-7076-4fd0-ae48-8b08640ac3bf%20target ',
          javascriptMode:JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}