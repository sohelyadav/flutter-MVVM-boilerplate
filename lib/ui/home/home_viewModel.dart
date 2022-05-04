import 'package:flutter_mvvm_boilerplate/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  SnackbarService _snackbarService = locator<SnackbarService>();
  NavigationService _navigationService = locator<NavigationService>();
  BottomSheetService _bottomSheetService = locator<BottomSheetService>();
}

// final homeViewModelProvider = Provider<HomeViewModel>((ref) {
//   return HomeViewModel(
//     ref: ref,
//     userRepository: ref.watch(userRepositoryProvider),
//   );
// });
