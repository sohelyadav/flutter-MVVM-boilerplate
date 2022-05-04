import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:status_bar_control/status_bar_control.dart';
import 'package:flutter_mvvm_boilerplate/app/app.router.dart';
import 'package:flutter_mvvm_boilerplate/resources/color.dart';

class CustomRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  // List<Route<dynamic>> routeStack = [];
  void _sendScreen(PageRoute<dynamic> route) {
    _sendIOSScreen(route);
  }

  void _sendIOSScreen(PageRoute<dynamic> route) {
    var screenName = route.settings.name;
    print('screenName 👉 $screenName');

    switch (screenName) {
      case Routes.splashView:
        setAndroidStatusBar(color: kBlack);
        break;
      default:
        setAndroidStatusBar(color: kPrimaryColor);
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // routeStack.add(route);
    super.didPush(route, previousRoute);

    if (route is PageRoute) {
      _sendScreen(route);
      lodDataOnPush(route);
    }
  }

  @override
  void didRemove(Route route, Route<dynamic>? previousRoute) {
    // routeStack.removeLast();
  }

  lodDataOnPush(PageRoute route) async {}

  lodDataOnPop(PageRoute route) async {}

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    // routeStack.removeLast();
    // routeStack.add(newRoute);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _sendScreen(newRoute);
      lodDataOnPush(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // routeStack?.removeLast();
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      _sendScreen(route);
      lodDataOnPop(previousRoute);
    }
  }
}

setAndroidStatusBar({Color color = kPrimaryColor}) async {
  await StatusBarControl.setColor(color, animated: true);
  await StatusBarControl.setStyle(StatusBarStyle.LIGHT_CONTENT);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
  );
  StatusBarControl.setNavigationBarColor(kBlack);
}

// setIOSStatusBar(
//     {StatusBarStyle statusBarStyle = StatusBarStyle.DARK_CONTENT}) async {
//   StatusBarControl.setStyle(statusBarStyle);
// }
