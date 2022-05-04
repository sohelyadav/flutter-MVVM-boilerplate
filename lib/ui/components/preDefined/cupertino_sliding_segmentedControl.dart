// import 'dart:math';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_mvvm_boilerplate/resources/color.dart';

// /// Example:
// ///
// /// ```dart
// /// CustomSlidingSegmentedControl<int>(
// ///   fromMax: true,
// ///   children: {
// ///     1: Text(
// ///       'Segmentation',
// ///       textAlign: TextAlign.center,
// ///     ),
// ///     2: Text(
// ///       'Max',
// ///       textAlign: TextAlign.center,
// ///     ),
// ///   },
// ///   onValueChanged: (int value) {
// ///     print(value);
// ///   },
// /// ),
// /// ```
// ///
// /// * `isStretch` - stretches CustomSlidingSegmentedControl to full width
// /// * `onValueChanged` - on change current segment
// /// * `children` - segment items map
// /// * `initialValue` - initial segment
// /// * `duration` - speed animation
// /// * `radius` - segment and AnimationPanel border radius
// /// * `elevation` - elevation
// /// * `backgroundColor` - background color
// /// * `thumbColor` - AnimationPanel color
// /// * `curve` - curve animation
// /// * `innerPadding` - inner padding
// /// * `fromMax` - gets the largest element, while the rest of the elements get its size
// /// * `fixedWidth` - fixed width items
// /// * `decoration` - decoration for controls
// /// * `padding` - item padding
// /// * `clipBehavior` - for container
// class PSlidingSegmentedControl<T> extends StatefulWidget {
//   const PSlidingSegmentedControl({
//     Key key,
//     @required this.children,
//     this.onValueChanged,
//     this.initialValue,
//     this.duration,
//     this.radius = 24,
//     this.elevation = 2.0,
//     this.backgroundColor = kWhite,
//     this.thumbColor = kWhite,
//     this.curve = Curves.easeInOut,
//     this.innerPadding = 0.0,
//     this.padding = 0,
//     this.fixedWidth,
//     this.decoration,
//     this.isStretch = true,
//     this.fromMax = false,
//     this.clipBehavior = Clip.none,
//   })  : assert(children.length != 0),
//         super(key: key);
//   final BoxDecoration decoration;
//   final ValueChanged<T> onValueChanged;
//   final Duration duration;
//   final double radius;
//   final double elevation;
//   final Color backgroundColor;
//   final Color thumbColor;
//   final Curve curve;
//   final double innerPadding;
//   final double padding;
//   final double fixedWidth;
//   final Map<T, Widget> children;
//   final bool isStretch;
//   final T initialValue;
//   final bool fromMax;
//   final Clip clipBehavior;

//   @override
//   _PSlidingSegmentedControlState<T> createState() =>
//       _PSlidingSegmentedControlState();
// }

// class _PSlidingSegmentedControlState<T>
//     extends State<PSlidingSegmentedControl<T>> {
//   T current;
//   double height;
//   double offset = 0.0;
//   Map<T, double> sizes = {};
//   bool hasTouch = false;
//   double maxSize;

//   @override
//   void initState() {
//     super.initState();
//     final List<T> _list = widget.children.keys.toList();
//     final _index = _list.indexOf(widget.initialValue);
//     final _keys = _list.toList();
//     if (widget.initialValue != null) {
//       current = _keys[_index];
//     } else {
//       current = _keys.first;
//     }
//   }

//   void _calculateSize(Size v, MapEntry<T, Widget> item) {
//     height ??= 30;
//     final Map<T, double> _temp = {};
//     _temp.putIfAbsent(item.key, () => widget.fixedWidth ?? v.width);
//     if (widget.initialValue != null && widget.initialValue == item.key) {
//       final _offset = computeOffset<T>(
//         current: current,
//         items: widget.children.keys.toList(),
//         sizes: sizes.values.toList(),
//       );
//       setState(() {
//         offset = _offset;
//       });
//     }
//     setState(() {
//       sizes = {...sizes, ..._temp};
//       if (widget.fromMax) {
//         maxSize = sizes.values.toList().reduce(max);
//       }
//     });
//   }

//   void _onTapItem(MapEntry<T, Widget> item) {
//     if (!hasTouch) {
//       setState(() => hasTouch = true);
//     }
//     setState(() => current = item.key);
//     final List<T> _keys = widget.children.keys.toList();
//     final _offset = computeOffset<T>(
//       current: current,
//       items: _keys,
//       sizes: sizes.values.toList(),
//     );
//     setState(() => offset = _offset);
//     final _value = _keys[_keys.indexOf(current)];
//     if (widget.onValueChanged != null) {
//       widget.onValueChanged(_value);
//     }
//   }

//   Widget segmentItem(MapEntry<T, Widget> item) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(widget.radius),
//       onTap: () {
//         _onTapItem(item);
//       },
//       child: Center(
//         child: Container(
//           // width: maxSize ?? widget.fixedWidth,
//           padding: EdgeInsets.symmetric(horizontal: 8),
//           margin: EdgeInsets.symmetric(horizontal: 8),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(widget.radius),
//           ),
//           child: item.value,
//         ),
//       ),
//     );
//   }

//   Widget layout() {
//     return Container(
//       clipBehavior: widget.clipBehavior,
//       decoration: widget.decoration ??
//           BoxDecoration(
//             color: widget.backgroundColor,
//             borderRadius: BorderRadius.circular(
//               widget.radius != 0 ? widget.radius + 2 : widget.radius,
//             ),
//           ),
//       padding: EdgeInsets.all(0),
//       child: Stack(
//         children: [
//           AnimationPanel<T>(
//             hasTouch: hasTouch,
//             offset: offset,
//             height: 30,
//             width: sizes[current],
//             duration: widget.duration,
//             radius: widget.radius,
//             elevation: widget.elevation,
//             color: widget.thumbColor,
//             curve: widget.curve,
//           ),
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               for (final item in widget.children.entries)
//                 MeasureSize(
//                   onChange: (v) {
//                     _calculateSize(v, item);
//                   },
//                   child:
//                       widget.isStretch ? segmentItem(item) : segmentItem(item),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [if (widget.isStretch) layout() else layout()],
//     );
//   }
// }
// // Flutter imports:

// class MeasureSize extends StatefulWidget {
//   final Widget child;
//   final Function(Size size) onChange;

//   const MeasureSize({
//     Key key,
//     @required this.onChange,
//     @required this.child,
//   }) : super(key: key);

//   @override
//   _MeasureSizeState createState() => _MeasureSizeState();
// }

// class _MeasureSizeState extends State<MeasureSize> {
//   @override
//   Widget build(BuildContext context) {
//     SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
//     return Container(
//       key: widgetKey,
//       child: widget.child,
//     );
//   }

//   GlobalKey<State<StatefulWidget>> widgetKey = GlobalKey();
//   Size oldSize;

//   void postFrameCallback(Duration d) {
//     final context = widgetKey.currentContext;
//     if (context == null) return;

//     final Size newSize = context.size;
//     if (oldSize == newSize) return;

//     oldSize = newSize;
//     widget.onChange(newSize);
//   }
// }

// double computeOffset<T>({
//   @required List<double> sizes,
//   @required List<T> items,
//   T current,
// }) {
//   return sizes
//       .getRange(0, items.indexOf(current))
//       .toList()
//       .fold<double>(0, (previousValue, element) => previousValue + element);
// }

// class AnimationPanel<T> extends StatelessWidget {
//   const AnimationPanel({
//     Key key,
//     @required this.offset,
//     @required this.width,
//     @required this.height,
//     @required this.hasTouch,
//     this.elevation,
//     this.duration,
//     this.radius,
//     this.color,
//     this.curve,
//   }) : super(key: key);

//   final double offset;
//   final double width;
//   final double height;
//   final double radius;
//   final double elevation;
//   final Duration duration;
//   final Color color;
//   final Curve curve;
//   final bool hasTouch;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       transform: Matrix4.translationValues(offset, 0, 0),
//       duration: hasTouch == false
//           ? const Duration()
//           : duration ?? const Duration(milliseconds: 200),
//       curve: curve,
//       width: width,
//       child: PhysicalModel(
//         elevation: elevation,
//         clipBehavior: Clip.antiAlias,
//         color: color,
//         borderRadius: BorderRadius.circular(radius),
//         child: Container(height: height),
//       ),
//     );
//   }
// }
