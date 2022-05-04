import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:stacked_services/stacked_services.dart';

enum AppUpdateStatus { NO_UPDATE, FORCE_UPDATE, OPTIONAL_UPDATE }

showUpdateDialog({AppUpdateStatus? appUpdateStatus, Function()? onPressed}) {
  return showDialog<void>(
    context: StackedService.navigatorKey!.currentContext!,
    barrierDismissible:
        appUpdateStatus == AppUpdateStatus.FORCE_UPDATE ? false : true,
    builder: (BuildContext context) {
      return appUpdateStatus == AppUpdateStatus.FORCE_UPDATE
          ? AlertDialog(
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
                    LaunchReview.launch();
                  },
                ),
              ],
            )
          : AlertDialog(
              title: Text('New version available'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                        'Looks like you have an older version of the app.\nPlease update to get latest features and best experience \n'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Later'),
                  onPressed: onPressed,
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
