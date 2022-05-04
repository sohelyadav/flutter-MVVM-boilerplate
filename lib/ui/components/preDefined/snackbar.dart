import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/app/app.locator.dart';
import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter_mvvm_boilerplate/resources/demins.dart';
import 'package:stacked_services/stacked_services.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
        snackPosition: SnackPosition.TOP,
        borderRadius: 15,
        isDismissible: true,
        messageColor: kWhite,
        backgroundColor: kErrorColor,
        textColor: kWhite,
        mainButtonTextColor: kBlack,
        margin: EdgeInsets.all(kAppPadding)),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
        borderRadius: 15,
        isDismissible: true,
        messageColor: kWhite,
        snackPosition: SnackPosition.TOP,
        // animationDuration: Duration(seconds: 3),
        backgroundColor: kSuccessColor,
        // forwardAnimationCurve: Curves.bounceIn,
        textColor: kWhite,
        mainButtonTextColor: kBlack,
        margin: EdgeInsets.all(kAppPadding)),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.warning,
    config: SnackbarConfig(
        borderRadius: 15,
        isDismissible: true,
        messageColor: kBlack,
        snackPosition: SnackPosition.TOP,
        // animationDuration: Duration(seconds: 3),
        backgroundColor: kWarningColor,
        // forwardAnimationCurve: Curves.bounceIn,
        textColor: kBlack,
        mainButtonTextColor: kBlack,
        margin: EdgeInsets.all(kAppPadding)),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.primary,
    config: SnackbarConfig(
        borderRadius: 15,
        isDismissible: true,
        messageColor: kWhite,
        snackPosition: SnackPosition.BOTTOM,
        // animationDuration: Duration(seconds: 3),
        backgroundColor: kPrimaryColor,
        // forwardAnimationCurve: Curves.bounceIn,
        textColor: kWhite,
        mainButtonTextColor: kWhite,
        margin: EdgeInsets.all(kAppPadding)),
  );
}

enum SnackbarType { error, success, warning, primary }

class DoubleBackToCloseApp extends StatefulWidget {
  final SnackBar snackBar;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Creates a widget that allows the user to close the app by double tapping
  /// the back-button.
  const DoubleBackToCloseApp({
    Key? key,
    required this.snackBar,
    required this.child,
  }) : super(key: key);

  @override
  _DoubleBackToCloseAppState createState() => _DoubleBackToCloseAppState();
}

class _DoubleBackToCloseAppState extends State<DoubleBackToCloseApp> {
  /// The last time the user tapped Android's back-button.
  DateTime? _lastTimeBackButtonWasTapped;

  /// Returns whether the current platform is Android.
  bool get _isAndroid => Theme.of(context).platform == TargetPlatform.android;

  /// Returns whether the [DoubleBackToCloseApp.snackBar] is currently visible.
  bool get _isSnackBarVisible {
    final lastTimeBackButtonWasTapped = _lastTimeBackButtonWasTapped;
    return (lastTimeBackButtonWasTapped != null) &&
        (widget.snackBar.duration >
            DateTime.now().difference(lastTimeBackButtonWasTapped));
  }

  bool get _willHandlePopInternally =>
      ModalRoute.of(context)?.willHandlePopInternally ?? false;

  @override
  Widget build(BuildContext context) {
    assert(() {
      _ensureThatContextContainsScaffold(context);
      return true;
    }());

    if (_isAndroid) {
      return WillPopScope(
        onWillPop: () => _handleWillPop(context),
        child: widget.child,
      );
    } else {
      return widget.child;
    }
  }

  /// Handles [WillPopScope.onWillPop].
  Future<bool> _handleWillPop(BuildContext context) async {
    if (_isSnackBarVisible || _willHandlePopInternally) {
      return true;
    } else {
      _lastTimeBackButtonWasTapped = DateTime.now();
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      scaffoldMessenger.hideCurrentSnackBar();
      scaffoldMessenger.showSnackBar(widget.snackBar);
      return false;
    }
  }

  /// Throws a [FlutterError] if this widget was not wrapped in a [Scaffold].
  void _ensureThatContextContainsScaffold(BuildContext context) {
    if (Scaffold.maybeOf(context) == null) {
      throw FlutterError(
        '`DoubleBackToCloseApp` must be wrapped in a `Scaffold`.',
      );
    }
  }
}
