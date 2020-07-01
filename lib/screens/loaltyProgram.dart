import 'package:arrowhead/RewardCard/points.dart';
import 'package:arrowhead/Services/database.dart';
import 'package:arrowhead/models/Userpoint.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoaltyProgram extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<UserPoint>>.value(
    
      value: DatabaseService().point,
      child: Scaffold(
        backgroundColor: Color(0xff22222b),
        body: Points(),
      ),
    );


  }

}

