import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    this.width,
    this.margin,
    this.height,
    this.onTap,
    this.bgColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.padding,
    this.boxShadow,
    required this.child,
    super.key,
  });

  final Function()? onTap;
  final Widget child;
  final Color? bgColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final double? borderWidth;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxShadow? boxShadow;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  margin,
      decoration: BoxDecoration(
          color: bgColor,
          boxShadow: boxShadow == null ? [] : [boxShadow!],
          borderRadius:borderRadius ?? BorderRadius.circular(5) ,
          border: Border.all(
              width: borderWidth ?? 0,
              color: borderColor ?? Colors.transparent)),
      width: width,
      height: height,
      child: CupertinoButton(
          borderRadius: borderRadius ?? BorderRadius.circular(5) ,
          padding: padding,
          onPressed: onTap,
          child: child),
    );
  }
}
