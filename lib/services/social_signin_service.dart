import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:flutter_mvvm_boilerplate/helper/network_error_handling.dart';

class SocialSignInService {
  GoogleSignIn? googleSignIn;
  Map? profile = {};

  SocialLogInModel? socialLogInModel;

  init() {
    googleSignIn = GoogleSignIn(
      scopes: <String>['email', "openid"],
    );
  }

  GoogleSignInAccount? get currentUser => googleSignIn?.currentUser;
  Future<GoogleSignInAccount?> googleSignin() async {
    GoogleSignInAccount? googleId;
    try {
      await signOut();

      googleId = await googleSignIn!.signIn().then((value) {
        return value;
      });
    } catch (e) {
      throw Failure(e.toString());
    }
    return googleId;
  }

  Future signOut() async {
    try {
      profile = {};
      await googleSignIn?.signOut();
      socialLogInModel = null;
    } catch (e) {
      throw Failure(e.toString());
    }
  }
}

class SocialLogInModel {
  String? name;
  String? profileImage;
  String? email;
  String? socialID;
  String? type;

  SocialLogInModel(
      {@required this.name,
      @required this.profileImage,
      @required this.email,
      @required this.socialID,
      @required this.type});
}
