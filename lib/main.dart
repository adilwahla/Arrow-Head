import 'package:arrowhead/Services/auth.dart';
import 'package:arrowhead/Services/database.dart';
import 'package:arrowhead/models/Userpoint.dart';
import 'package:arrowhead/models/user.dart';
import 'package:arrowhead/screens/adress.dart';
import 'package:arrowhead/screens/appointmentRequest.dart';
import 'package:arrowhead/screens/boardingInfo.dart';
import 'package:arrowhead/screens/call.dart';
import 'package:arrowhead/screens/loaltyProgram.dart';
import 'package:arrowhead/screens/petlyPage.dart';
import 'package:arrowhead/wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ArrowHead());
}

class ArrowHead extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Color(0xFF004C56),
              scaffoldBackgroundColor: Color(0xFF004C56),
              accentColor: Colors.white,

             // textTheme: TextTheme(display1: TextStyle(color: Colors.amber)),//0xFF0A0E21
            ),
        home: wrapper(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AuthService _auth =AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserPoint>>.value(
      value: DatabaseService().point,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async{
               await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Logout'))
          ],
          title: Center(child: Text('Arrowhead',style: TextStyle(fontWeight: FontWeight.bold),)),
        ),
        body:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Image(image: AssetImage('asset/av.png'),

                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                        onTap: (){Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AdressPage()),
                        );},
                        child: ReusableCard(
                          txt: '515E.Durham Rd.,Dewey,OK  74029',
                          colour: Color(0XFF1D1E33),
                          x: 27.0,
                        ),
                      )
                  ),

                  Expanded(child: GestureDetector(
                      onTap: (){Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CallPage()),
                      );},
                      child: ReusableCard(txt: 'Call or Text  (918)534-1958 ',colour: Color(0XFF1D1E33),x: 26.0,)))
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: GestureDetector(
                      onTap: (){Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoaltyProgram()),
                      );},child: ReusableCard(txt: 'Loyalty  Program',colour: Color(0XFF1D1E33),x: 35.0,))),
                  Expanded(child: GestureDetector(
                      onTap: (){Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PetlyPage()),
                      );},child: ReusableCard(txt: 'Your   Petly  Page',colour: Color(0XFF1D1E33),x: 33.0,)))
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: GestureDetector(
                      onTap: (){Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AppointmentRequest()),
                      );},
                      child: ReusableCard(txt: 'Appointment\nRequest',colour: Color(0XFF1D1E33),x: 32.0,))),
                  Expanded(child: GestureDetector(
                      onTap: (){Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BordingInfo()),
                      );},
                      child: ReusableCard(txt: 'Boarding Information',colour: Color(0XFF1D1E33),x: 32.0,)))
                ],
              ),

            ],
          ),
        ),
//ReusableCard(txt: 'Appointment\nRequest',colour: Color(0XFF1D1E33),)
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({this.txt,@required this.colour ,this.x});
final String txt;
final Color colour;
final double x;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
       child: Padding(
         padding: const EdgeInsets.all(11.0),
         child: Center(child: Text( '$txt',style: TextStyle(
             color: Colors.white,
            // fontWeight: FontWeight.bold,
             fontSize: x,
             wordSpacing: 100.0,
             fontFamily: 'DancingScript',),)),
       ),
        height: 144.0,
        width: 180.0,
    // margin: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
