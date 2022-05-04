import 'package:flutter_mvvm_boilerplate/app/app.locator.dart';
import 'package:flutter_mvvm_boilerplate/ui/components/preDefined/snackbar.dart';
import 'package:stacked_services/stacked_services.dart';

customSnackbar(String message,
    {bool isSuccess = false, Function()? onRetry, SnackbarType? snackbarType}) {
  SnackbarService _snackbarService = locator<SnackbarService>();
  _snackbarService.showCustomSnackBar(
    mainButtonTitle: onRetry == null ? null : "Retry",
    duration: Duration(seconds: 6),
    onMainButtonTapped: onRetry,
    message: message,
    variant: snackbarType != null
        ? snackbarType
        : isSuccess
            ? SnackbarType.success
            : SnackbarType.error,
  );
}
