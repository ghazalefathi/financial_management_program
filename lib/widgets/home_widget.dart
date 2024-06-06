import 'package:financial_management_program/constants/utlis.dart';
import 'package:financial_management_program/controllers/public_controller.dart';
import 'package:financial_management_program/widgets/MyTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import 'dialog/remove_and_edit_transaction_item.dart';
import 'my_text_widget.dart';

class HomeWidget extends GetView<publicController> {
  final String? title;
  final String? price;
  final Color? color;
  final Color? priceColor;
  final int index;
  final double? bottom;
  final IconData? icon;
  const HomeWidget({
    this.price,
    this.priceColor,
    this.bottom,
    this.icon,
    this.color,
    required this.index,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyTextButton(
      padding: EdgeInsets.zero,
      onTap: () {
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => DialogRemoveAndEditTransactionItem(
            index: index,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          textDirection: TextDirection.ltr,
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.only(bottom: bottom!),
                child: Icon(
                  icon,
                  color: cW,
                ),
              ),
            ),
            MyText(
                color: cB,
                fontWeight: FontWeight.bold,
                size: 18,
                text: '$title'),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MyText(
                    size: 18,
                    fontWeight: FontWeight.bold,
                    color: priceColor,
                    textDirection: TextDirection.rtl,
                    text: '${price} تومان'.toReadable()),
                SizedBox(
                  height: 10,
                ),
                MyText(color: cB, text: '1400/12/5'),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
