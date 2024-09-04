import 'package:brew_crew/models/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserEntity? _userEntityFromFairebaseUser (User user) {
    return user != null ? UserEntity(uid: user.uid) : null;
  }

  Stream<UserEntity?> get user {
    return _auth.authStateChanges()
      .map((User? user) => _userEntityFromFairebaseUser(user!));
  }

  Future signInAnonymous () async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;

      return _userEntityFromFairebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future? signOut () async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      return _userEntityFromFairebaseUser(user!);
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      return _userEntityFromFairebaseUser(user!);
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}