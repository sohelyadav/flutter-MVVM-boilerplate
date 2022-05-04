
class FirebaseAuthService {
  // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // SnackbarService _snackbarService = locator<SnackbarService>();
  // NavigationService _navigationService = locator<NavigationService>();

  // User? get currentUser => firebaseAuth.currentUser;

  // Future<bool> signInWithGoogle() async {
  //   locator<AnalyticsService>().logGoogleIdSelected();
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     //googleUser May be null if user cancel signIn
  //     if (googleUser != null) {
  //       final GoogleSignInAuthentication googleAuth =
  //           await googleUser.authentication;

  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth.accessToken,
  //         idToken: googleAuth.idToken,
  //       );
  //       await firebaseAuth.signInWithCredential(credential);
  //       await updateAuthToken();
  //       locator<AnalyticsService>().logLogin();
  //       return true;
  //     } else {
  //       customSnackbar('User Canceled Sign In');
  //       return false;
  //     }
  //   } on PlatformException catch (e) {
  //     print("FirebaseService signInWithGoogle error : ${e.toString()}");
  //     customSnackbar(e.code.replaceAll('_', ' '));
  //     return false;
  //   } on Exception catch (e) {
  //     print(
  //         "FirebaseService signInWithGoogle Exception error : ${e.toString()}");
  //     customSnackbar('User Canceled Sign In');
  //     return false;
  //   }
  // }

  // Future<void> updateAuthToken() async {
  //   if (firebaseAuth.currentUser != null) {
  //     await firebaseAuth.currentUser!.getIdToken(true).then((token) {
  //       print("Update token(Refresh token): $token");
  //       AppConstants.AUTH_TOKEN = token;
  //     });
  //   } else {
  //     AppConstants.AUTH_TOKEN = null;
  //   }
  // }

  // Future<void> signOut() async {
  //   try {
  //     await firebaseAuth.signOut();
  //     await _googleSignIn.disconnect();
  //     AppConstants.AUTH_TOKEN = null;
  //     locator<SharedPrefsService>().clear();
  //     _navigationService.pushNamedAndRemoveUntil(Routes.splashView);
  //     locator<AnalyticsService>().logSignOut();
  //   } on FirebaseAuthException catch (e) {
  //     print('signOut FirebaseAuthException ' + e.toString());
  //     customSnackbar(e.message ?? '');
  //   } on Exception catch (e) {
  //     print('signOut Exception ' + e.toString());
  //     customSnackbar(e.toString());
  //   }
  // }

  // Future<String> signInWithPhoneNumber(String phoneNumber) async {
  //   String _verificationId = "";
  //   try {
  //     await firebaseAuth.verifyPhoneNumber(
  //       phoneNumber: "+91$phoneNumber",
  //       timeout: const Duration(seconds: 60),
  //       verificationCompleted:
  //           (PhoneAuthCredential phoneAuthCredential) async {},
  //       verificationFailed: (error) {
  //         log("verificationFailed ${error.toString()}");
  //         customSnackbar(error.message ?? "");
  //       },
  //       codeSent: (verificationId, forceResendingToken) async {
  //         _verificationId = verificationId;
  //       },
  //       codeAutoRetrievalTimeout: (verificationId) {},
  //     );
  //     print(
  //         "-----------signInWithPhoneNumber _verificationId is ${_verificationId}");
  //     return _verificationId;
  //   } catch (e) {
  //     log("signInWithPhoneNumber error = ${e.toString()}");
  //     customSnackbar(e.toString());
  //     return '';
  //   }
  // }

  // Future<bool> verifyOtp(
  //     {required String otp, required String verificationId}) async {
  //   try {
  //     AuthCredential _authCredential = PhoneAuthProvider.credential(
  //         verificationId: verificationId, smsCode: otp);
  //     UserCredential userCredential =
  //         await firebaseAuth.signInWithCredential(_authCredential);
  //     print(
  //         "-----------verifyOtp userCredential ${userCredential.credential.toString()}");
  //     if (userCredential.credential != null) {
  //       return true;
  //     } else
  //       return false;
  //   } on Exception catch (e) {
  //     log("verifyOtp error = ${e.toString()}");
  //     return false;
  //   }
  // }

  // Future<bool> signInWithApple() async {
  //   try {
  //     // final appleIdCredential = await SignInWithApple.getAppleIDCredential(
  //     //   scopes: [
  //     //     AppleIDAuthorizationScopes.email,
  //     //     AppleIDAuthorizationScopes.fullName,
  //     //   ],
  //     // );
  //     // final oAuthProvider = OAuthProvider('apple.com');
  //     // final credential = oAuthProvider.credential(
  //     //   idToken: appleIdCredential.identityToken,
  //     //   accessToken: appleIdCredential.authorizationCode,
  //     // );
  //     // await FirebaseAuth.instance.signInWithCredential(credential);
  //     // await updateAuthToken();
  //     // locator<AnalyticsService>().logLogin();
  //     // print("-----------apple signing credential are $credential");
  //     return true;
  //   } catch (e) {
  //     //USer may cancel Sign In
  //     customSnackbar('Canceled Sign In with Apple');
  //     return false;
  //   }
  // }
}
