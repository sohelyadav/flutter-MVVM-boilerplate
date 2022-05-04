import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter_mvvm_boilerplate/resources/demins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  Function(String?)? onSaved;
  Function(String?)? onChange;
  Function(String?)? onFieldSubmitted;
  String? Function(String?)? validator;
  Function()? onFocusChange;
  Function()? onTap;
  GlobalKey<FormState>? formState;
  TextInputType? keyboardType;
  TextStyle? style;
  Color? fillColor;
  bool? filled;
  int? maxlength;
  int? maxLine;
  bool? autofocus;
  String? label;
  String? counterText;
  String? prefixText;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? errorText;
  bool? enabled;
  bool? obscure;
  double? verticalPadding;
  double? horizontalPadding;
  TextCapitalization textCapitalization;
  String? initialValue;
  String? hintText;
  TextEditingController? controller;
  List<TextInputFormatter>? inputFormatters;
  CustomTextFormField(
      {Key? key,
      this.hintText,
      this.onSaved,
      this.onFieldSubmitted,
      this.style,
      this.fillColor,
      this.filled,
      this.maxLine,
      this.suffixIcon,
      this.prefixIcon,
      this.autofocus = false,
      this.validator,
      this.errorText,
      this.textCapitalization = TextCapitalization.none,
      this.onChange,
      this.keyboardType = TextInputType.text,
      this.maxlength,
      this.obscure = false,
      this.label = "",
      this.counterText = "",
      this.prefixText = "",
      this.inputFormatters = const [],
      this.enabled = true,
      @required this.formState,
      this.onFocusChange,
      this.onTap,
      this.verticalPadding = 0.0,
      this.horizontalPadding = 0.0,
      this.initialValue,
      this.controller})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() {
    return _CustomTextFormFieldState();
  }
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  FocusNode focusNode = FocusNode();

  AutovalidateMode? _autovalidateMode;
  @override
  void initState() {
    _autovalidateMode = AutovalidateMode.disabled;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formState,
      child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: widget.verticalPadding!,
              horizontal: widget.horizontalPadding!),
          child: FocusScope(
            child: Focus(
              focusNode: focusNode,
              onFocusChange: (focus) async {
                if (!focus) {
                  if (widget.onFocusChange != null)
                    await widget.onFocusChange!();
                  widget.formState?.currentState?.validate();
                }

                _autovalidateMode = AutovalidateMode.onUserInteraction;
              },
              child: GestureDetector(
                onTap: () async {
                  if (widget.onTap != null) await widget.onTap!.call();
                  widget.formState?.currentState?.validate();
                },
                child: TextFormField(
                    autofocus: widget.autofocus!,
                    enableSuggestions: true,
                    onChanged: (input) {
                      if (widget.onChange != null) widget.onChange!(input);
                      // widget.controller.text = input;
                      setState(() {});
                    },
                    onFieldSubmitted: widget.onFieldSubmitted,
                    maxLines: widget.obscure! ? (widget.maxLine ?? 1) : 1,
                    obscureText: widget.obscure!,
                    controller: widget.controller,
                    initialValue: widget.initialValue,
                    enabled: widget.enabled,
                    keyboardType: widget.keyboardType,
                    inputFormatters: widget.inputFormatters,
                    maxLength: widget.maxlength,
                    autovalidateMode: _autovalidateMode,
                    validator: widget.validator,
                    style: widget.style != null
                        ? widget.style
                        : textFormFieldHeight,
                    textCapitalization: widget.textCapitalization,
                    onSaved: widget.onSaved,
                    decoration: InputDecoration(
                      fillColor: widget.fillColor,
                      filled: widget.filled,
                      prefixIcon: widget.prefixIcon,
                      suffixIcon: widget.onTap != null
                          ? widget.suffixIcon == null
                              ? Icon(
                                  Icons.expand_more,
                                  color: kDarkGrey,
                                )
                              : widget.suffixIcon
                          : widget.suffixIcon,
                      hintText: widget.hintText,
                      counterText: widget.counterText,
                      prefixText: widget.prefixText,
                      errorText: widget.errorText,
                      labelText: widget.label,
                    )),
              ),
            ),
          )),
    );
  }
}
