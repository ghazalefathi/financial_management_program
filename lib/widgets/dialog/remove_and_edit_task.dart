import 'package:financial_management_program/controllers/public_controller.dart';
import 'package:financial_management_program/widgets/MyTextButton.dart';
import 'package:financial_management_program/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../models/money_model.dart';

class DialogRemoveAndEditTaskItem extends GetView<publicController> {
  final int index;
  const DialogRemoveAndEditTaskItem({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    MoneyModel transaction = controller.listTransactions[index];
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: cW,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: MyTextButton(
                  padding: EdgeInsets.zero,
                  borderRadius: BorderRadius.circular(30),
                  bgColor: cR,
                  onTap: () {
                    Get.back();
                  },
                  height: 25,
                  width: 25,
                  child: Icon(
                    Icons.close,
                    color: cW,
                    size: 18,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                    child: MyText(
                        size: 13, text: 'آیا از ویرایش این آیتم مطمعن هستید؟')),
                MyTextButton(
                    width: 80,
                    onTap: () {
                      controller.selectedTransaction(transaction);
                      controller.selectedIndexForEdit(index);
                      Get.toNamed('/edit-transaction');
                    },
                    height: 35,
                    padding: EdgeInsets.zero,
                    bgColor: cg,
                    child: MyText(
                      text: 'ویرایش',
                      color: cW,
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                    child: MyText(text: 'آیا از حذف این آیتم مطمعن هستید؟ ')),
                MyTextButton(
                    width: 80,
                    onTap: () {
                      controller.remove(index: index);
                    },
                    height: 35,
                    padding: EdgeInsets.zero,
                    bgColor: cR,
                    child: MyText(
                      text: 'حذف',
                      color: cW,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
