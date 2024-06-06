import 'package:financial_management_program/constants/colors.dart';
import 'package:financial_management_program/controllers/public_controller.dart';
import 'package:financial_management_program/widgets/MyTextButton.dart';
import 'package:financial_management_program/widgets/MyTextField.dart';
import 'package:financial_management_program/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTransactionScreen extends StatelessWidget {
  AddTransactionScreen({super.key});

  final controller = Get.find<publicController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: MyTextButton(
              onTap: () {
                Get.back();
                controller.transactionPriceController.text = '';
                controller.transactionTitleController.text = '';
              },
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: cB,
              )),
          title: Align(
            alignment: Alignment.topRight,
            child: MyText(
              text: 'تراکنش جدید',
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
                        size: 17,
                        padding: EdgeInsets.only(left: 10),
                      ),
                      Expanded(
                          child: MyTextField(
                              controller: controller.transactionTitleController,
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
                        size: 17,
                        padding: EdgeInsets.only(left: 10),
                      ),
                      Expanded(
                          child: MyTextField(
                              controller: controller.transactionPriceController,
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
                    onTap: () {
                      controller.dateTime(context: context);
                    },
                    child: Obx(() => MyText(
                          text: '${controller.selectedDate.value}',
                          size: 17,
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
                                size: 17,
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
                                size: 17,
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
                  controller.addTransaction();
                },
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                padding: EdgeInsets.zero,
                height: 50,
                width: Get.width,
                bgColor: cY,
                child: MyText(
                  text: 'ثبت',
                  size: 17,
                  fontWeight: FontWeight.bold,
                  padding: EdgeInsets.only(bottom: 5),
                  color: cB,
                ))
          ],
        ),
      ),
    );
  }
}
