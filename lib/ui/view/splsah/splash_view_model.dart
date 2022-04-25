import 'package:flutter_mvvm_boilerplate/app/base_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashViewModel extends BaseViewModel{

  showLoader() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 4));
    setLoading(false);
  }
}

final splashViewModelProvider = Provider<SplashViewModel>((ref) {
  return SplashViewModel();
});