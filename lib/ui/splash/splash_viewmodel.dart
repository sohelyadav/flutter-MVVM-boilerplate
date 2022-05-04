import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_mvvm_boilerplate/app/app.locator.dart';
import 'package:flutter_mvvm_boilerplate/app/app.router.dart';
import 'package:flutter_mvvm_boilerplate/services/firebaseAuthServices.dart';
import 'package:flutter_mvvm_boilerplate/services/sharedprefs_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  SnackbarService _snackbarService = locator<SnackbarService>();
  NavigationService _navigationService = locator<NavigationService>();
  SharedPrefsService _sharedPrefsService = locator<SharedPrefsService>();
  FirebaseAuthService _firebaseService = FirebaseAuthService();

  Ref ref;

  SplashViewModel({required this.ref});

  checkUser() {
    bool isOnboard =
        _sharedPrefsService.read(SharedPrefsService.IS_ONBOARDING_COMPLETED) ??
            false;
    if (isOnboard) {
      navigateToHome();
    } else {
      navigateToOnBoarding();
    }
  }

  navigateToHome() async {
    await Future.delayed(Duration(seconds: 2));
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  navigateToOnBoarding() async {
    await Future.delayed(Duration(seconds: 2));
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }
}

final splashViewModelProvider = StateProvider<SplashViewModel>((ref) {
  return SplashViewModel(ref: ref);
});
