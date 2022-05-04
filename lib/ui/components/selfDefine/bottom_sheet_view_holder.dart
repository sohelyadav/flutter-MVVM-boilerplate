import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:stacked_services/stacked_services.dart';

void presentModalBottomSheet(Widget child) {
  showModalBottomSheet(
      isDismissible: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      backgroundColor: kWhite,
      context: StackedService.navigatorKey!.currentContext!,
      isScrollControlled: true,
      builder: (context) => child);
}
