import 'package:financial_management_program/constants/utlis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'my_text_widget.dart';

class dateilTransactionWidget extends StatelessWidget {
  final String? title;
  final String? price;
  const dateilTransactionWidget({
    this.price,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          MyText(
            text: '$title',
            textDirection: TextDirection.rtl,
          ),
          MyText(
            textDirection: TextDirection.rtl,
            text: '${price} تومان'.toReadable(),
          )
        ],
      ),
    );
  }
}
