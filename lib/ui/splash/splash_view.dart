import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/app/app.locator.dart';
import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter_mvvm_boilerplate/resources/images.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_mvvm_boilerplate/ui/components/preDefined/safe_area.dart';
import 'package:flutter_mvvm_boilerplate/ui/splash/splash_viewmodel.dart';
import 'package:flutter_mvvm_boilerplate/ui/webReader/webView_page.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  NavigationService _navigationService = locator<NavigationService>();
  SnackbarService _snackbarService = locator<SnackbarService>();


  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize() async {
    ref.read(splashViewModelProvider).checkUser();
  }


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        backgroundColor: kBlack,
      ),
      canvasColor: kBlack,
      body: Column(
        children: [
          Image.asset(Images.appLogo),
          CircularProgressIndicator(
            color: kWhite,
          )
        ],
      ),
    );
  }
}
