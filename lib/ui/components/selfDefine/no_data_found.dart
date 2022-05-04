import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter_mvvm_boilerplate/resources/demins.dart';
import 'package:flutter_mvvm_boilerplate/resources/themes.dart';

class PNoDataFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: const EdgeInsets.all(kAppPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/no_data_found.png",
              width: MediaQuery.of(context).size.width / 2,
            ),
            SizedBox(height: kWidgetMPadding),
            Text(
              "No Record",
              style: appTheme.textTheme.bodyText1!
                  .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
