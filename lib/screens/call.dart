import 'package:arrowhead/Button/FancyButton.dart';
import 'package:arrowhead/RewardCard/rounded_shadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class CallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

   //  backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Call or text '),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: 10.0,),
                  Container(
                    height: 500, width: 320,
                    decoration: BoxDecoration(
                      color: Color(0xff84ced6).withOpacity(0.4),
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),

                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [

                        Expanded(child:  Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                                FancyButton(
                                  child: Text(
                                    "Call us ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'Gameplay',
                                    ),
                                  ),
                                  size: 70,
                                  color: Color(0xFF228B22),
                                  onPressed: () async {
                                    const url = 'tel:9185341958';
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }},
                                ),
                                SizedBox(width: 15.0,),
                                FancyButton(
                                  child: Text(
                                    "Text us ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'Gameplay',
                                    ),
                                  ),
                                  size: 70,
                                  color: Color(0xFF228B22),
                                  onPressed: _launchURL,
                                ),

                              ],
                            )),),
                       // const MySeparator(color: Colors.grey),

                      ],
                    ),
                  ),
                ],
              ),
            //  _buildTopBg(110.0),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'sms:9185341958';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }

  }
}
