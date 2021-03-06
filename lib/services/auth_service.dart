import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/model/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

User _userFromFirebaseUser(FirebaseUser user){
  return user != null ? User(uid: user.uid):null;
}

Future signInWithEmailAndPassword(String email, String password)async{
  try {
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user= result.user;
    return _userFromFirebaseUser(user);
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Future registrationWithEmailAndPassword(String email, String password)async{
  try {
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user= result.user;
    return _userFromFirebaseUser(user);
  } catch (e) {
    print(e.toString());
    return null;
  }
}
Future signOut()async{
try {
  return await _auth.signOut();
} catch (e) {
  print(e.toString());
  return null;
}
}
  Stream<User> get user{
    return _auth.onAuthStateChanged
    .map((FirebaseUser user)=>_userFromFirebaseUser(user));
  }
}