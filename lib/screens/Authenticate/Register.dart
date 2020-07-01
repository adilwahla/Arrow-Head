import 'package:arrowhead/Services/auth.dart';
import 'package:arrowhead/constants.dart';
import 'package:arrowhead/loading.dart';
import 'package:flutter/material.dart';
class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth=AuthService();
  final _formKey=GlobalKey<FormState>();
  bool loading=false;
//text state field
  String email='';
  String password ='';
  String error='';
  @override
  Widget build(BuildContext context) {
    return loading?Loading(): Scaffold(
      appBar: AppBar(
        title: Text('sign up '),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
               widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Sign in'))
        ],
      ),
      body: Container(

        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child:Form(
          key: _formKey,
          child: Column(
          children: <Widget>[
            SizedBox(height: 20.0,),
            TextFormField(
              decoration:kTextinputdecoration.copyWith(hintText: 'Enter email'),
              validator: (val)=> val.isEmpty?'Enter an email':null,
              onChanged: (val){
                setState(() {
                  email=val;
                });
              },
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              decoration:kTextinputdecoration.copyWith(hintText: 'Enter password'),
              validator: (val)=> val.length < 5 ?'Enter a password 5+ char long':null,
              obscureText: true,
              onChanged: (val){
                setState(() {
                  password=val;
                });
              },
            ),
            SizedBox(height: 20.0,),
            RaisedButton(
              color: Colors.pink[400],
              child: Text(
                'Register ',
                style: TextStyle(
                  color: Colors.white,
                ),),
              onPressed: ()async{
              if(_formKey.currentState.validate()){
                setState(() {
                  loading=true;
                });
              dynamic result=await _auth.registerWithEmailAndPassword(email, password);
              if (result==null){
                 setState(() {
                   error='Please Enter a valid Email';
                   loading=false;
                 });
              }
              }
              },),
            SizedBox(height: 12.0,),
            Text(
              error,
              style: TextStyle(
                color: Colors.red,
                fontSize: 14.0,
              ),
            ),
          ],
        ),

        ),
      ),
    );
  }
}
