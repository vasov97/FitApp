import 'package:fit_app/screens/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../screens/profile.dart';


class GoogleSignInProvider extends ChangeNotifier
{

  final googleSignIn = GoogleSignIn(scopes: ['email']);
  final storage = new FlutterSecureStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;

  Future googleLogin(BuildContext context) async
  {
    try
    {
    final googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential
  (
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
  );

  if(googleUser!=null)
  {
    _user=googleUser;
    await _auth.signInWithCredential(credential);
    }
    }
  catch(e)
  {
    final snackBar = SnackBar(content: Text(e.toString()));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
    notifyListeners();
  
  }
  
  Future googleLogout()async
  {
    await googleSignIn.disconnect();
    _auth.signOut();
  }

}