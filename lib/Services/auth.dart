import 'package:arrowhead/Services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:arrowhead/models/user.dart';
class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  // create user obj based on firebaseUser
 User _userFromFirebaseUser (FirebaseUser user){
    return user != null?User( uid:user.uid):null;
  }
  //auth changes user stream
  Stream<User>get user{
   return _auth.onAuthStateChanged
   //.map((FirebaseUser user) => _userFromFirebaseUser(user));
.map( _userFromFirebaseUser);
  }
  //sign in
Future SignInAnon()async {
  try{
    AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user=result.user;
    return _userFromFirebaseUser(user);
   // return user;
}catch(e){
    print(e.toString());
    return null;
  }


}
//sign in with email password
  Future signInWithEmailAndPassword(String email,String password)async{
    try{
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;

      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
//register in with email password
  Future registerWithEmailAndPassword(String email,String password)async{
   try{
     AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
     FirebaseUser user=result.user;
     //create a new document for the user with uid
     await DatabaseService(uid: user.uid).updateUserData('0');
    return _userFromFirebaseUser(user);
   }catch(e){
     print(e.toString());
     return null;
   }
  }
//sign out
Future signOut ()async{
   try{
     return await _auth.signOut();
   }
   catch(e){
print(e.toString());
    return null;
   }
}
}