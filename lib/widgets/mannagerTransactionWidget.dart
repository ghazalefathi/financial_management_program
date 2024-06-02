import 'package:financial_management_program/constants/utlis.dart';
import 'package:flutter/widgets.dart';

import 'my_text_widget.dart';

class mannagerTransactionWidget extends StatelessWidget {
  final String? suffixTtitle;
  final String? suffixPrice;
  final String? prefixPrice;
  final String? prefixTtitle;
  const mannagerTransactionWidget({
    this.suffixTtitle,
    this.suffixPrice,
    this.prefixPrice,
    this.prefixTtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            child: MyText(
                size: 15,
                text: '${suffixTtitle}  : ${suffixPrice} تومان'.toReadable()),
          ),
          Expanded(
            child: MyText(
                size: 15,
                text: ' ${prefixTtitle} : ${prefixPrice} تومان'.toReadable()),
          ),
        ],
      ),
    );
  }
}
