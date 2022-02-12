
import 'package:blogging_app/App/Utils/Dailog.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirebaseAuthtentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
 

  Future<void> createAccount(String email, String password) async {
    try {
      
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      showAlert('User Account Created Successfully');
    } catch (e) {
      
      showAlert(e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
       showAlert(e.toString());
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
