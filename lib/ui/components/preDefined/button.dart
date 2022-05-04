import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter_mvvm_boilerplate/resources/demins.dart';
import 'package:flutter_mvvm_boilerplate/resources/themes.dart';

enum CustomButtonType {
  Submit,
  SubmitWithOutline,
  Primary,
  PrimaryWithOutline,
  Secondary,
  SecondaryWithOutline,
  Warning,
  WarningWithOutline,
  Error,
  ErrorWithOutline,
  Disabled,
  Default,
  DefaultWithOutline,
}
enum CustomButtonSize { XSmall, Small, Default, Large, XLarge }
// enum PButtonBorderType { Outline, Normal }

class CustomButton extends ConsumerStatefulWidget {
  final CustomButtonType customButtonType;
  final CustomButtonSize customButtonSize;
  // final PButtonBorderType PButtonBorderType;
  final Function()? onPressed;
  final double? horizontalMargin;
  final double? vericalMargin;
  final double? width;
  final double? height;
  final double? textSize;
  final IconData? icon;

  // final double height;
  final double? radius;

  final bool? modelIsBusy;
  final bool? checkAccountCreated;
  final String? text;
  final double? elevation;

  const CustomButton({
    Key? key,
    this.elevation = 0,
    this.icon,
    this.customButtonType = CustomButtonType.Primary,
    // this.PButtonBorderType,
    @required this.onPressed,
    this.horizontalMargin = kAppPadding,
    // this.vericalMargin = kAppPadding,
    this.vericalMargin = kWidgetMPadding,
    this.width,
    this.radius = kAppCornerMRadius,
    this.modelIsBusy = false,
    this.checkAccountCreated = false,
    @required this.text,
    this.customButtonSize = CustomButtonSize.Default,
    this.height,
    this.textSize,
    // this.height
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends ConsumerState<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: widget.vericalMargin!,
          horizontal: widget.horizontalMargin!),
      child: IgnorePointer(
        ignoring: widget.modelIsBusy!,
        child: MaterialButton(
            highlightElevation: 0,
            focusElevation: widget.elevation,
            elevation: widget.elevation,
            shape: shapeBorder,
            disabledTextColor: kWhite,
            highlightColor: Colors.transparent,
            // splashColor: kBlack.withOpacity(.1),
            splashColor: buttonColor == kWhite
                ? getTextColor.withOpacity(.2)
                : kBlack.withOpacity(.1),
            // highlightColor: buttonColor,
            color: buttonColor,
            disabledColor: buttonColor,
            // onPressed: null,
            onPressed: widget.onPressed,
            child: SizedBox(
              height: buttonHeight,
              width: buttonWidth,
              child: Center(
                child: widget.modelIsBusy!
                    ? CircularProgressIndicator(
                        color: kWhite,
                        backgroundColor: getColor,
                      )
                    : FittedBox(
                        child: widget.icon != null
                            ? Icon(
                                widget.icon,
                                color: getTextColor,
                              )
                            : Text(
                                widget.text ?? " ",
                                style: appTheme.textTheme.button!.copyWith(
                                    // fontSize: textSize,
                                    fontWeight: FontWeight.bold,
                                    // letterSpacing: 1.5,
                                    color: getTextColor),
                              ),
                      ),
              ),
            )),
      ),
    );
  }

  login() {
    // _bottomSheetService
    //     .showCustomSheet(
    //         customData: PBottomSheetCustomData(
    //         title: userDetailViewModel.isLoggedIn()
    //             ? ("create Your account")
    //             :  "login",
    //         description: "VideoConsultantProfileSubtitle",
    //         mainButtonTitle: "confirm",
    //         secondaryButtonTitle:  "cancel",
    //         variant: PBottomSheetType.FloatingBox)
    //     .then((value) {
    //   if (value?.confirmed ?? false) {
    //     // _navigationService.navigateTo(Routes.loginWithPhoneView,
    //     //     arguments: LoginWithPhoneViewArguments(isFirstTime: false));
    //   }
    // });
  }

  double get textSize {
    if (widget.textSize != null) return widget.textSize!;

    switch (widget.customButtonSize) {
      case CustomButtonSize.Default:
        return 17.5;
      case CustomButtonSize.Small:
        return 12;
      case CustomButtonSize.XSmall:
        return 10;
      case CustomButtonSize.Large:
        return 14;
      case CustomButtonSize.XLarge:
        return 20;
      default:
        return 17.5;
    }
  }

  double get buttonHeight {
    if (widget.height != null) return widget.height!;
    switch (widget.customButtonSize) {
      case CustomButtonSize.Default:
        return 44;
      case CustomButtonSize.Small:
        return 25;
      case CustomButtonSize.XSmall:
        return 20;
      case CustomButtonSize.Large:
        return 40;
      case CustomButtonSize.XLarge:
        return 75;
      default:
        return 44;
    }
  }

  double get buttonWidth {
    if (widget.width != null) return widget.width!;
    switch (widget.customButtonSize) {
      case CustomButtonSize.Default:
        return double.infinity;
      case CustomButtonSize.Small:
        return 50;
      case CustomButtonSize.XSmall:
        return 25;
      case CustomButtonSize.Large:
        return 125;
      case CustomButtonSize.XLarge:
        return 150;
      default:
        return double.infinity;
    }
  }

  ShapeBorder get shapeBorder {
    switch (widget.customButtonType) {
      case CustomButtonType.ErrorWithOutline:
        return OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius!),
            borderSide: BorderSide(
              color: getColor,
              width: 1,
            ));
      case CustomButtonType.PrimaryWithOutline:
        return OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius!),
            borderSide: BorderSide(
              color: getColor,
              width: 1,
            ));
      case CustomButtonType.SubmitWithOutline:
        return OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius!),
            borderSide: BorderSide(
              color: getColor,
              width: 1,
            ));
      case CustomButtonType.WarningWithOutline:
        return OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius!),
            borderSide: BorderSide(
              color: getColor,
              width: 1,
            ));
      case CustomButtonType.SecondaryWithOutline:
        return OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius!),
            borderSide: BorderSide(
              color: getColor,
              width: 1,
            ));
      case CustomButtonType.Default:
        return OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius!),
            borderSide: BorderSide(
              color: kWhite,
              width: 1,
            ));
      case CustomButtonType.DefaultWithOutline:
        return OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius!),
            borderSide: BorderSide(
              color: getColor,
              width: 1,
            ));

      default:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius!),
        );
    }
  }

  Color get getTextColor {
    switch (widget.customButtonType) {
      case CustomButtonType.SubmitWithOutline:
        return getColor;
      case CustomButtonType.PrimaryWithOutline:
        return getColor;
      case CustomButtonType.ErrorWithOutline:
        return getColor;
      case CustomButtonType.WarningWithOutline:
        return getColor;
      case CustomButtonType.SecondaryWithOutline:
        return getColor;
      case CustomButtonType.Default:
        return kBlack;
      case CustomButtonType.DefaultWithOutline:
        return kBlack;
      case CustomButtonType.Warning:
        return kBlack;

      default:
        return kWhite;
    }
  }

  Color get buttonColor {
    switch (widget.customButtonType) {
      case CustomButtonType.Submit:
        return getColor;
      case CustomButtonType.Primary:
        return getColor;
      case CustomButtonType.Secondary:
        return getColor;
      case CustomButtonType.Warning:
        return getColor;
      case CustomButtonType.Error:
        return getColor;

      case CustomButtonType.Disabled:
        return getColor;
      case CustomButtonType.DefaultWithOutline:
        return Colors.transparent;

      default:
        return kWhite;
    }
  }

  Color get getColor {
    switch (widget.customButtonType) {
      case CustomButtonType.Submit:
        return kSuccessColor;
      case CustomButtonType.SubmitWithOutline:
        return kSuccessColor;
      case CustomButtonType.Error:
        return kErrorColor;
      case CustomButtonType.ErrorWithOutline:
        return kErrorColor;
      case CustomButtonType.Primary:
        return kPrimaryColor;
      case CustomButtonType.PrimaryWithOutline:
        return kPrimaryColor;
      case CustomButtonType.Secondary:
        return kSecondaryColor;
      case CustomButtonType.SecondaryWithOutline:
        return kSecondaryColor;
      case CustomButtonType.Warning:
        return kWarningColor;
      case CustomButtonType.WarningWithOutline:
        return kWarningColor;
      case CustomButtonType.Disabled:
        return kDarkGrey;
      case CustomButtonType.Default:
        return kBlack;
      case CustomButtonType.DefaultWithOutline:
        return kBlack.withOpacity(.75);
      default:
        return kPrimaryColor;
    }
  }
}
