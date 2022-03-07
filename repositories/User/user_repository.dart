//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepository() : _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future signUp(
      String email, String password, String phone, String name) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  late FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  void inputData() {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    print(uid);
    print(user?.email);

    // here you write the codes to input the data into firestore
  }

  // Future<void> signOut() async {
  //   return Future.wait([_firebaseAuth.signOut()]);
  // }

  // Future<bool> isSignedIn() async {
  //   final currentUser = await _firebaseAuth.currentUser();
  //   return currentUser != null;
  // }

  // Future<FirebaseUser> getUser() async {
  //    return await _firebaseAuth.currentUser();
  // }

  // Future<bool> isSignedIn() async {
  //   final currentUser = await _firebaseAuth.currentUser();
  //   return currentUser != null;
  // }

  // Future<FirebaseUser> getUser() async {
  //   return await _firebaseAuth.currentUser();
  // }
}
