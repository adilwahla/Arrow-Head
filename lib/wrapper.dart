import 'package:arrowhead/main.dart';
import 'package:arrowhead/models/user.dart';
import 'package:arrowhead/screens/Authenticate/Authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //return either bome or authenticate user
    if(user==null){
      return Authenticate();
    }else{
      return MyHomePage();
    }

  }
}
