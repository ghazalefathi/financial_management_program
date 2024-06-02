import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({
    this.color,
    this.size,
    this.shadows,
    this.fontFamily,
    this.textAlign = TextAlign.center,
    this.textDirection = TextDirection.ltr,
    this.textOverflow,
    this.fontWeight = FontWeight.w100,
    this.padding,
    this.maxLines,
    this.lineHeight,
    this.textDecoration = TextDecoration.none,
    required this.text,
    super.key,
  });
  final Color? color;
  final String text;
  final double? size;
  final double? lineHeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextOverflow? textOverflow;
  final List<Shadow>? shadows;
  final TextDecoration? textDecoration;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Text(
        text,
        textScaler: TextScaler.linear(1),
        maxLines: maxLines,
        overflow: textOverflow,
        textDirection: textDirection,
        textAlign: textAlign ?? TextAlign.center,
        style: TextStyle(
          fontWeight: fontWeight,
          height: lineHeight,
          color: color,
          fontSize: size ?? 14,
          shadows: shadows,
          decoration: textDecoration,
          fontFamily: fontFamily ?? 'IranSans',
          
        ),
      ),
    );
  }
}
