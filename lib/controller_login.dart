import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:krishworks_app/UserDetails.dart';


import 'UserDetails.dart';


class ControllerLogin extends ChangeNotifier {

  var googleSignInNow = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  UserDetailsModel ? userDetailsModel;

  allowuserToLogin() async {
    googleSignInAccount = await googleSignInNow.signIn();
    this.userDetailsModel = new UserDetailsModel(

      displayName: this.googleSignInAccount!.displayName,
      email: this.googleSignInAccount!.email,
      photoURL: this.googleSignInAccount!.photoUrl,
    );

    notifyListeners();
  }

  allowUserToLogout() async {
    this.googleSignInAccount = await googleSignInNow.signOut();
    userDetailsModel = null;
    notifyListeners();
  }
}