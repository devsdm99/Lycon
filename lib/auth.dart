import 'package:dartapp/db.dart' as db;
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future registerWithEmailAndPassword(
    String username, String email, String password) async {
  try {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;

    await db.addNewUser(email, username, user!.uid);
  } catch (ex) {}
}
