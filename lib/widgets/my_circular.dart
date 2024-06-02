import 'package:flutter/material.dart';
import 'package:flutter_circular_progress_indicator/flutter_circular_progress_indicator.dart';
import '../constants/colors.dart';

class MyCircualrProgress extends StatelessWidget {
  const MyCircualrProgress({this.color, this.size, super.key});
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return CircularProgressInd().normalCircular(
        width: size ?? 20,
        height: size ?? 20,
        valueColor: color ?? cB,
        isSpining: true);
  }
}
