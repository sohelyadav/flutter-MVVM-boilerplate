import 'package:flutter/services.dart';
import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final AppBar? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNav;
  final Widget? body;
  final Color? canvasColor;
  final Widget? drawer;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  CustomScaffold({
    this.bottomNav,
    this.appBar,
    this.floatingActionButton,
    @required this.body,
    this.canvasColor = kWhite,
    this.drawer,
    this.floatingActionButtonLocation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Scaffold(
        floatingActionButtonLocation: floatingActionButtonLocation,
        drawer: drawer,
        floatingActionButton: floatingActionButton,
        backgroundColor: canvasColor,
        bottomNavigationBar: bottomNav != null
            ? SafeArea(child: bottomNav!)
            : null,
        appBar: appBar,
        body: SafeArea(child: body!),
      ),
    );
  }
}
