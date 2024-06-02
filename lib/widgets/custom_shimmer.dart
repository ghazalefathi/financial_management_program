import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class CustomShimmerWidget extends StatelessWidget {
  const CustomShimmerWidget({
    super.key,
    this.width,
    this.height,
    this.radius,
  });

  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(seconds: 1),
      baseColor: Theme.of(context).cardColor.withOpacity(.1),
      highlightColor: Theme.of(context).cardColor.withOpacity(.3),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(radius ?? 5)),
      ),
    );
  }
}
