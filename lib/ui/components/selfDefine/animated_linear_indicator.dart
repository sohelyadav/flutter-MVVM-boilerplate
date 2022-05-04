import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/resources/color.dart';

class CustomAnimatedContainer extends StatefulWidget {
  final Color color;
  final double height;

  CustomAnimatedContainer({this.color = kPrimaryColor, this.height = 100});

  @override
  _CustomAnimatedContainerState createState() =>
      _CustomAnimatedContainerState();
}

class _CustomAnimatedContainerState extends State<CustomAnimatedContainer> {
  int duration = 2;
  double width = 5;
  double height = 0;

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: widget.color,
      ),
      duration: Duration(seconds: duration),
      width: width,
      height: height,
      curve: Curves.fastOutSlowIn,
    );
  }

  Future<void> animate() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      height = 75;
    });
  }
}
