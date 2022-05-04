import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:status_bar_control/status_bar_control.dart';
import 'package:flutter_mvvm_boilerplate/app/app.locator.dart';
import 'package:flutter_mvvm_boilerplate/ui/components/preDefined/snackbar.dart';
import 'app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    // super.createHttpClient(context)..maxConnectionsPerHost = 5;
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => false;
  }
}

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();

  // runZonedGuarded(() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await StatusBarControl.setTranslucent(false);

  setupSnackbarUi();
  // setupBottomSheetUi();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(SetOrientation());
  });
  // }, (error, stackTrace) {
  //   FirebaseCrashlytics.instance.recordError(error, stackTrace);
  // });
}

class SetOrientation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ProviderScope(child: YourApp());
  }
}
