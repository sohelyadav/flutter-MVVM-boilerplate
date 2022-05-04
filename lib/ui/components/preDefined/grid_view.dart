import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/resources/demins.dart';

class PGridView extends StatelessWidget {
  final Widget Function(BuildContext, int)? itemBuilder;
  final int? crossAxisCount;
  final int? itemCount;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final bool? isScrollable;
  final EdgeInsets? padding;
  final double? childAspectRatio;
  const PGridView(
      {Key? key,
      @required this.itemBuilder,
      @required this.itemCount,
      this.crossAxisCount = 4,
      this.mainAxisSpacing = kWidgetMPadding,
      this.padding = EdgeInsets.zero,
      this.crossAxisSpacing = kWidgetMPadding,
      this.isScrollable = false,
      this.childAspectRatio = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: isScrollable!,
        physics: isScrollable!
            ? BouncingScrollPhysics()
            : NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: crossAxisSpacing!,
            childAspectRatio: childAspectRatio!,
            mainAxisSpacing: mainAxisSpacing!,
            crossAxisCount: crossAxisCount!),
        itemBuilder: itemBuilder!);
  }
}
