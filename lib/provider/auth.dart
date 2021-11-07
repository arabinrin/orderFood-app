// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_course/helper/user.dart';
import 'package:food_course/models/user.dart';

enum Status { Uninitialized, Unauthenticated, Authenticating, Authenticated }

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  Status _status = Status.Uninitialized;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserServices _userServices = UserServices();
  UserModel _userModel;

  Status get status => _status;
  UserModel get userModel => _userModel;
  User get user => _user;
  final formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();

  AuthProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen((_onstateChanged));
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return _onError(e.toString());
    }
  }

  Future<void> signOut() {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        _firestore.collection('users').doc(result.user?.uid).set({
          "name": name.text,
          "email": email.text,
          "id": result.user?.uid,
        });
        // Map<String, dynamic> values = {

        // };
        // _userServices.createUser(values);
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      return _onError(e.toString());
    }
  }

  bool _onError(String e) {
    _status = Status.Unauthenticated;
    notifyListeners();
    print(e);
    return false;
  }

  void cleanController() {
    email.text = "";
    password.text = "";
    name.text = "";
  }

  Future<void> _onstateChanged(User firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(firebaseUser.uid);
    }
    notifyListeners();
  }
}
