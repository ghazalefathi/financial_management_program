import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'my_text_widget.dart';

class EmptyWidget extends StatelessWidget {
  final String ? title;
  const EmptyWidget({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/bg_transaction.png',
            width: 300,
            height: 300,
          ),
        ),
        MyText(
          text: title ?? 'تراکنشی یافت نشد',
          fontFamily: 'Cinema',
          size: 26,
          color: cB,
        )
      ],
    );
  }
}
