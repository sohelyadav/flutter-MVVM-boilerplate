import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/app/app.router.dart';
import 'package:flutter_mvvm_boilerplate/ui/home/home_view.dart';
import 'package:flutter_mvvm_boilerplate/utils/routeobserver.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:flutter_mvvm_boilerplate/resources/themes.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/sharedprefs_services.dart';
import '../services/social_signin_service.dart';
import '../ui/splash/splash_view.dart';
import '../utils/routeobserver.dart';
import 'app.locator.dart';

Alice alice = Alice(showNotification: true);

/// run these code in terminal to generate route setting
/// flutter packages pub run build_runner watch --delete-conflicting-outputs (while development)
/// flutter packages pub run build_runner build (one time)
@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: HomeView)
  ],
  dependencies: [
    // abstracted class type support
    LazySingleton(classType: NavigationService, asType: NavigationService),
    LazySingleton(classType: DialogService, asType: DialogService),
    // LazySingleton(classType: SnackbarService, asType: SnackbarService),
    LazySingleton(classType: BottomSheetService, asType: BottomSheetService),
    Singleton(classType: SocialSignInService),
    Singleton(classType: SnackbarService),

    Presolve(
      classType: SharedPrefsService,
      presolveUsing: SharedPrefsService.getInstance,
    ),
  ],
  logger: StackedLogger(),
)
class AppSetup {}

class YourApp extends StatelessWidget {
  const YourApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    alice.setNavigatorKey(StackedService.navigatorKey!);
    return RefreshConfiguration(
      footerBuilder: () => ClassicFooter(
        noDataText: "No more result",
        noMoreIcon: Container(),
      ),
      footerTriggerDistance: 500,
      headerTriggerDistance: 80.0,
      enableScrollWhenRefreshCompleted: true,
      enableLoadingWhenFailed: true,
      hideFooterWhenNotFull: false,
      enableBallisticLoad: true,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          navigatorObservers: [
            CustomRouteObserver(),
            NavigationHistoryObserver(),
          ],
          home: SplashView(),
          // initialRoute:StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: alice.getNavigatorKey()
          // navigatorKey: StackedService.navigatorKey,
          ),
    );
  }
}
