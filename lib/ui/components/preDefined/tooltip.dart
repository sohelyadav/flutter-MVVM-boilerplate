import 'package:flutter/material.dart';

class PTooltip extends StatelessWidget {
  Widget child;
  String message;

  PTooltip(this.message, this.child) : super();

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      child: child,
    );
  }
}
