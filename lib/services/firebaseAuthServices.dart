import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm_boilerplate/app/app.locator.dart';
import 'package:flutter_mvvm_boilerplate/app/app.router.dart';
import 'package:flutter_mvvm_boilerplate/ui/components/selfDefine/custom_snackbar.dart';
import 'package:flutter_mvvm_boilerplate/utils/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked_services/stacked_services.dart';

class FirebaseAuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  SnackbarService _snackbarService = locator<SnackbarService>();
  NavigationService _navigationService = locator<NavigationService>();

  User? get currentUser => firebaseAuth.currentUser;

  Future<bool> signInWithGoogle() async {
    // locator<AnalyticsService>().logGoogleIdSelected();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      //googleUser May be null if user cancel signIn
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await firebaseAuth.signInWithCredential(credential);
        await updateAuthToken();
        // locator<AnalyticsService>().logLogin();
        return true;
      } else {
        customSnackbar('User Canceled Sign In');
        return false;
      }
    } on PlatformException catch (e) {
      print("FirebaseService signInWithGoogle error : ${e.toString()}");
      customSnackbar(e.code.replaceAll('_', ' '));
      return false;
    } on Exception catch (e) {
      print(
          "FirebaseService signInWithGoogle Exception error : ${e.toString()}");
      customSnackbar('User Canceled Sign In');
      return false;
    }
  }

  Future<bool> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);  
      await updateAuthToken();
      return true;
    } on FirebaseAuthException catch (e) {
      //USer may cancel Sign In
      customSnackbar('Auth error ${e.message ?? ''}');
      return false;
    }
  }

  Future<void> updateAuthToken() async {
    if (firebaseAuth.currentUser != null) {
      await firebaseAuth.currentUser!.getIdToken(true).then((token) {
        print("Update token(Refresh token): $token");
        AppConstants.AUTH_TOKEN = token;
      });
    } else {
      AppConstants.AUTH_TOKEN = null;
    }
  }

  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
      await _googleSignIn.disconnect();
      AppConstants.AUTH_TOKEN = null;
      _navigationService.pushNamedAndRemoveUntil(Routes.splashView);
      // locator<AnalyticsService>().logSignOut()
    } on FirebaseAuthException catch (e) {
      print('signOut FirebaseAuthException ' + e.toString());
      customSnackbar(e.message ?? '');
    } on Exception catch (e) {
      print('signOut Exception ' + e.toString());
      customSnackbar(e.toString());
    }
  }

  Future<void> signInWithPhoneNumber(String phoneNumber) async {}

  Future<void> verifyOtp(
      {required String otp, required String verificationId}) async {}

  Future<bool> signInWithApple() async {
    try {
      // final appleIdCredential = await SignInWithApple.getAppleIDCredential(
      //   scopes: [
      //     AppleIDAuthorizationScopes.email,
      //     AppleIDAuthorizationScopes.fullName,
      //   ],
      // );
      // final oAuthProvider = OAuthProvider('apple.com');
      // final credential = oAuthProvider.credential(
      //   idToken: appleIdCredential.identityToken,
      //   accessToken: appleIdCredential.authorizationCode,
      // );
      // await FirebaseAuth.instance.signInWithCredential(credential);
      // await updateAuthToken();
      // locator<AnalyticsService>().logLogin();
      // print("-----------apple signing credential are $credential");
      return true;
    } catch (e) {
      //USer may cancel Sign In
      customSnackbar('Canceled Sign In with Apple');
      return false;
    }
  }
}
