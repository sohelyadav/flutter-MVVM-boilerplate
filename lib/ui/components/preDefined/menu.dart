import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter_mvvm_boilerplate/resources/demins.dart';
import 'package:flutter_mvvm_boilerplate/resources/themes.dart';
import 'package:flutter/material.dart';

class PMenu extends StatefulWidget {
  Color? color;
  Color? iconColor;
  double? borderRadius;
  Color? textColor;
  double? elevation;
  List<PMenuItem>? items;
  PMenu(
      {Key? key,
      this.color = kSecondaryColor,
      this.items,
      this.textColor = kWhite,
      this.iconColor = kWhite,
      this.borderRadius = 5,
      this.elevation = 0})
      : super(key: key);
  @override
  _PMenuState createState() => _PMenuState();
}

class _PMenuState extends State<PMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        color: widget.color,
        padding: EdgeInsets.all(kAppPadding),
        elevation: widget.elevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius!)),
        icon: Icon(Icons.more_vert),
        itemBuilder: (BuildContext context) => List.generate(
            widget.items!.length,
            (index) => PopupMenuItem(
                    child: InkWell(
                  // onTap: widget.items[index].onTap,
                  child: Row(
                    children: [
                      Icon(
                        widget.items![index].icon,
                        color: widget.iconColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.items![index].title!,
                          style: appTheme.textTheme.bodyText2!.copyWith(
                              color: widget.textColor,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ))));
  }
}

class PMenuItem {
  String? title;
  IconData? icon;
  Function? onTap;

  PMenuItem({@required this.title, @required this.icon, @required this.onTap});
}
