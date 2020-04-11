import 'package:firebase_auth/firebase_auth.dart';
import 'package:sports_fields_rental/Model/User.dart';
import 'package:sports_fields_rental/Services/database.dart';
class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in anon
  User firebaseUserToUser(FirebaseUser user){
    return user != null? User(uid: user.uid) : null;
  }

  User firebaseUserToRealUser(FirebaseUser user, String fName, String lName, String phone, String pass, String email, String gender){
    return user != null? User.detailedUser(user.uid, fName, lName, phone, pass, email, gender) : null;
  }

  Stream<User> get user{
    return _auth.onAuthStateChanged.map((FirebaseUser user)=> firebaseUserToUser(user));
  }

  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return firebaseUserToUser(user);

    } catch(e) {
      print(e.toString());
      return null;

    }
  }


  //sign in with email & password
 Future signInWithEmailPassword(String email, String password) async{
    try{
      AuthResult authResult = await _auth.signInWithEmailAndPassword(email: email,password: password);
      FirebaseUser fuser = authResult.user;
      return firebaseUserToUser(fuser);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //register with email & password

  Future registerWithEmailPassword(String email, String password, String firstName, String lastName, String gender, String phone) async{
    try{
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(email: email,password: password);
      FirebaseUser fuser = authResult.user;
      await DatabaseService(uid: fuser.uid).updateUserInfo(email, password, firstName, lastName, gender, phone);
      return firebaseUserToRealUser(fuser,firstName, lastName,phone, password, email, gender );

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}