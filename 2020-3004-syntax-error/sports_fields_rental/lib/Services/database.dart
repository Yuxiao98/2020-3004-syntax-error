import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference userCollection = Firestore.instance.collection('users');
  final CollectionReference fieldCollection = Firestore.instance.collection('fields');
  final CollectionReference timeCollection = Firestore.instance.collection('time');

  Future updateUserInfo(String email, String password, String firstName, String lastName, String gender, String phone) async{
    print('updateUserInfo called');
    return await userCollection.document(uid).setData({
      'firstName': firstName,
      'lastName' : lastName,
      'gender': gender,
      'phone': phone,
      'email': email,
      'password':password
    });
  }

   Future changeTimeSLotColor(String index, String color, String timeSlots) async{
    print('updateUserInfo called');
    return await timeCollection.document(index).setData({
      'colour': color,
      'timeSlots': timeSlots
    });
  }

   Future getUserInfoItem() async{
    return await userCollection.document(uid).get();
  }


  Stream<QuerySnapshot> get users{
    return userCollection.snapshots();
  }

}