import 'dart:async';

import 'package:financial_management_program/constants/colors.dart';
import 'package:financial_management_program/controllers/public_controller.dart';
import 'package:financial_management_program/models/money_model.dart';
import 'package:financial_management_program/widgets/MyTextButton.dart';
import 'package:financial_management_program/widgets/MyTextField.dart';
import 'package:financial_management_program/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class EditTransactionScreen extends StatefulWidget {
  const EditTransactionScreen({super.key});

  @override
  State<EditTransactionScreen> createState() => _EditTransactionScreenState();
}

class _EditTransactionScreenState extends State<EditTransactionScreen> {
  final controller = Get.find<publicController>();

  late TextEditingController txtTitle;
  late TextEditingController txtPrice;

  @override
  void initState() {
    txtTitle = TextEditingController();
    txtPrice = TextEditingController();
    txtTitle.text = controller.selectedTransaction.value.title ?? '';
    txtPrice.text = controller.selectedTransaction.value.price ?? '';
    Timer(Duration.zero, () {
      controller.groupValue(
          controller.selectedTransaction.value.isReceived == true ? 1 : 2);
    });

    super.initState();
  }

  @override
  void dispose() {
    txtTitle.dispose();
    txtPrice.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: MyTextButton(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: cB,
              )),
          title: Align(
            alignment: Alignment.topRight,
            child: MyText(
              text: 'ویرایش‌تراکنش',
              fontFamily: 'Cinema',
              size: 30,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 200,
                      width: Get.width,
                      child: Image.asset('assets/images/financial-profit.png')),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      MyText(
                        text: 'عنوان',
                        fontFamily: 'Cinema',
                        size: 25,
                        padding: EdgeInsets.only(left: 10),
                      ),
                      Expanded(
                          child: MyTextField(
                              controller: txtTitle,
                              fillColor: cW,
                              txtColor: cB,
                              hasBorder: true,
                              strokeColor: cBlueDark,
                              borderRadius: 5,
                              hint: '')),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      MyText(
                        text: 'مبلغ',
                        fontFamily: 'Cinema',
                        size: 25,
                        padding: EdgeInsets.only(left: 10),
                      ),
                      Expanded(
                          child: MyTextField(
                              controller: txtPrice,
                              inputType: TextInputType.number,
                              fillColor: cW,
                              txtColor: cB,
                              hasBorder: true,
                              strokeColor: cBlueDark,
                              borderRadius: 5,
                              hint: '')),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextButton(
                    height: 55,
                    padding: EdgeInsets.zero,
                    bgColor: cY,
                    onTap: ()  {
                    controller.dateTime(context: context);
                    },
                    child: Obx(() => MyText(
                          text: '${controller.selectedDate.value}',
                          fontFamily: 'Cinema',
                          size: 25,
                          padding: EdgeInsets.only(bottom: 5),
                          color: cB,
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Obx(() => Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              MyText(
                                text: 'دریافتی',
                                fontFamily: 'Cinema',
                                size: 20,
                              ),
                              Radio(
                                splashRadius: 1,
                                activeColor: cY,
                                value: 1,
                                groupValue: controller.groupValue.value,
                                onChanged: (value) {
                                  controller.groupValue.value = value!;
                                  print('daryafti : ${value}');
                                },
                              ),
                            ],
                          ),
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              MyText(
                                text: 'پرداختی',
                                fontFamily: 'Cinema',
                                size: 20,
                              ),
                              Radio(
                                splashRadius: 1,
                                activeColor: cY,
                                value: 2,
                                groupValue: controller.groupValue.value,
                                onChanged: (value) {
                                  controller.groupValue.value = value!;
                                  print('pardakhti : ${value}');
                                },
                              ),
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            ),
            MyTextButton(
                onTap: () {
                  //!1
                  MoneyModel newMoneyModel = MoneyModel(
                      price: txtPrice.text,
                      title: txtTitle.text,
                      isReceived: controller.groupValue.value == 1);
                  //!3
                  controller.listTransactions[
                      controller.selectedIndexForEdit.value] = newMoneyModel;
                  controller.listTransactions.refresh();
                  //! save update in hive
                  controller.hiveBox.putAt(
                      controller.selectedIndexForEdit.value, newMoneyModel);
                  Get.toNamed('/home');
                },
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                padding: EdgeInsets.zero,
                height: 50,
                width: Get.width,
                bgColor: cY,
                child: MyText(
                  text: 'ثبت ویرایش',
                  size: 25,
                  fontFamily: 'Cinema',
                  padding: EdgeInsets.only(bottom: 5),
                  color: cB,
                ))
          ],
        ),
      ),
    );
  }
}
