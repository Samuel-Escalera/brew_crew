import 'package:brew_crew/models/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserEntity? _userEntityFromFairebaseUser (User user) {
    return user != null ? UserEntity(uid: user.uid) : null;
  }

  // auth change user stream
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
}