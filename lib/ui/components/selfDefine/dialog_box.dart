import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_mvvm_boilerplate/app/app.locator.dart';

class CustomDialogBox {
  NavigationService _navigationService = locator<NavigationService>();

  showForceUpdateDialog() {
    return showDialog<void>(
      context: StackedService.navigatorKey!.currentContext!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update required'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'This app version is no longer supported. Kindly update/install the latest version.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Update'),
              onPressed: () {
                LaunchReview.launch(
                  iOSAppId: "1406656314",
                  writeReview: false,
                );
              },
            ),
          ],
        );
      },
    );
  }

  showOptionalUpdateDialog(String? message) {
    return showDialog<void>(
      context: StackedService.navigatorKey!.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('New version available'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'Looks like you have an older version of the app.\nPlease update to get latest features and best experience'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Update Later'),
              onPressed: () async {
                _navigationService.back();
                // ref.read(splashViewModelProvider).checkUserLoginStatus();
              },
            ),
            TextButton(
              child: Text('Update Now'),
              onPressed: () {
                LaunchReview.launch();
                //_navigationService.back();
              },
            ),
          ],
        );
      },
    );
  }
}
