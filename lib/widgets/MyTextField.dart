import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/colors.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    required this.hint,
    this.controller,
    this.borderRadius,
    this.inputType,
    this.maxLength,
    this.textAlign,
    this.action,
    this.onchangedAction,
    this.focusNode,
    this.maxLines = 1,
    this.textDirection,
    this.isPassword,
    this.isEnabled,
    this.hintColor,
    this.hintFontSize,
    this.width,
    this.height,
    this.prefixIcon,
    this.hasBorder = false,
    this.txtColor,
    this.suffixIcon,
    this.cursorColor,
    this.onActionClicked,
    this.fillColor,
    this.strokeColor,
    this.fontSize,
    this.paddingTop,
    this.paddingBottom,
    this.paddingLeft,
    this.paddingRight,
    this.autofocus,
    this.suggest,
    super.key,
  });
  final String hint;
  final double? borderRadius;
  final double? hintFontSize;
  final double? width;
  final double? height;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;
  final double? fontSize;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final int? maxLength;
  final Color? txtColor;
  final TextAlign? textAlign;
  final TextInputAction? action;
  final Function(String text)? onchangedAction;
  final Function(String text)? onActionClicked;
  final FocusNode? focusNode;
  final int? maxLines;
  final TextDirection? textDirection;
  final bool? isPassword;
  final bool? isEnabled;
  final bool? hasBorder;
  final bool? autofocus;
  final bool? suggest;
  final Color? hintColor;
  final Color? cursorColor;
  final Color? strokeColor;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 55,
      child: TextField(
        enableSuggestions: suggest ?? false,
        autocorrect: suggest ?? false,
        autofocus: autofocus ?? false,
        enabled: isEnabled,
        obscureText: isPassword == true,
        focusNode: focusNode,
        textInputAction: action,
        maxLines: maxLines,
        style: TextStyle(
          
          color: txtColor ?? cW,
        ),
        textDirection: textDirection ?? textDirection,
        keyboardType: inputType,
        onSubmitted: onActionClicked,
        controller: controller,
        onChanged: onchangedAction,
        cursorColor: cursorColor ?? cW,
        textAlign: textAlign ?? TextAlign.right,
        inputFormatters: addlist(maxLength, inputType),
        decoration: InputDecoration(
          fillColor: fillColor,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          isCollapsed: true,
          contentPadding: EdgeInsets.only(
            left: paddingLeft ?? 20,
            right: paddingRight ?? 20,
            top: paddingTop ?? 20,
            bottom: paddingBottom ?? 20,
          ),
          hintText: hint,
          hintStyle: TextStyle(
              height: 1,
              color: hintColor,
              fontSize: hintFontSize ?? 15,
              fontFamily: 'IranSans'),
          enabledBorder: hasBorder == false
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? 10,
                  ),
                  borderSide: BorderSide(color: Colors.transparent, width: 0))
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? 10,
                  ),
                  borderSide: strokeColor == null
                      ? BorderSide.none
                      : BorderSide(color: strokeColor!, width: 1)),
          focusedBorder: hasBorder == false
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? 10,
                  ),
                  borderSide: BorderSide(color: Colors.transparent, width: 0))
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 5),
                  borderSide: strokeColor == null
                      ? BorderSide.none
                      : BorderSide(color: strokeColor!, width: 1)),
          disabledBorder: hasBorder == false
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? 10,
                  ),
                  borderSide: BorderSide(color: Colors.transparent, width: 0))
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? 10,
                  ),
                  borderSide: strokeColor == null
                      ? BorderSide.none
                      : BorderSide(color: strokeColor!, width: 1)),
        ),
      ),
    );
  }
}

List<TextInputFormatter> addlist(int? length, TextInputType? txtinput) {
  List<TextInputFormatter> a = [];
  if (length != null) {
    a.add(LengthLimitingTextInputFormatter(length));
  }
  if (txtinput == TextInputType.number) {
    a.add(FilteringTextInputFormatter.digitsOnly);
  }

  return a;
}
