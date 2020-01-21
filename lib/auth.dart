import 'package:dartapp/db.dart' as db;
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future registerWithEmailAndPassword(
    String username, String email, String password) async {
  try {
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;

    await db.addNewUser(email, username, user.uid);
  } catch (ex) {}
}
