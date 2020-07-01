import 'package:arrowhead/RewardCard/Styles.dart';
import 'package:arrowhead/RewardCard/rounded_shadow.dart';
import 'package:arrowhead/models/Userpoint.dart';

import'package:flutter/material.dart';
import 'package:provider/provider.dart';
    class Points extends StatefulWidget {
      @override
      _PointsState createState() => _PointsState();
    }

    class _PointsState extends State<Points> {

      @override
      Widget build(BuildContext context) {
        dynamic   earnedpoints='';
        final points=Provider.of<List<UserPoint>>(context);
        points.forEach((userPoint) {
          print(userPoint.points);
          earnedpoints=userPoint.points;
        });

        return Container(
          child: Theme(
            data: ThemeData(fontFamily: "Poppins", primarySwatch: Colors.orange),
            child: Stack(
              children: <Widget>[


                Container(
                  alignment: Alignment.topCenter,
                  height: 800,
                  child: RoundedShadow(
                      topLeftRadius: 0,
                      topRightRadius: 0,
                      shadowColor: Color(0x0).withAlpha(65),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset("asset/Header-Dark.png", fit: BoxFit.fill,
                          //package: ArrowHead.pkg,
                        ),
                      )),
                ),
                SafeArea(

                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: EdgeInsets.all(300 * .08),
                      constraints: BoxConstraints(maxHeight: 400),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("My Rewards", style: Styles.text(300 * .13, Colors.white, true)),
                          Icon(Icons.star, color: AppColors.redAccent, size: 300 * .2),
                          SizedBox(width: 6),
                          Text("$earnedpoints", style: Styles.text(280 * .3, Colors.white, true)),
                          Text("\t\t\t \t10 Points will earn you \$50 in  \t\t\t\t\t\t\t\t \t \t \t\t\t \t\tclinic credit", style: Styles.text(200 * .1, Colors.white, false)),
                        ],
                      ),
                    ),
                  ),
                ),



              ],
            ),
          ),
        );
      }
    }
