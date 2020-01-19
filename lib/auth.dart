import 'package:dartapp/db.dart' as db;
import 'package:firebase_auth/firebase_auth.dart';

class Auth {


  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerWithEmailAndPassword(String username, String email, String password) async
  {
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;


    await db.addNewUser(email, username,user.uid);

  }
}
