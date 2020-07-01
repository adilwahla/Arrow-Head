import 'package:arrowhead/models/Userpoint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  //collection refrence
  final CollectionReference users=Firestore.instance.collection('Users  ');
  Future updateUserData(String points)async{
    return await users.document(uid).setData({
      'points':points
    });
  }
  List<UserPoint>_userpointsFromSnapshot(QuerySnapshot snapshot){
   return snapshot.documents.map((doc) {
     return UserPoint(
       points: doc.data['points']?? '0'
     );
   }).toList();
  }

  Stream< List<UserPoint>> get point{
    return users.snapshots()
        .map(_userpointsFromSnapshot);
  }
}
