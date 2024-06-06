import 'package:financial_management_program/widgets/MyTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../widgets/MyTextButton.dart';
import '../widgets/my_text_widget.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: MyTextButton(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: cB,
            )),
        title: Align(
          alignment: Alignment.topRight,
          child: MyText(
            text: 'تسک جدید',
            fontFamily: 'Cinema',
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  
                  Image.asset(
                    'assets/images/add_task.png',
                    height: 300,
                    width: 300,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      SizedBox.square(
                        dimension: 70,
                        child: MyText(
                          text: 'عنوان',
                          size: 15,
                          padding: EdgeInsets.only(left: 10),
                        ),
                      ),
                      Expanded(
                          child: MyTextField(
                              controller: new TextEditingController(),
                              fillColor: cW,
                              txtColor: cB,
                              hasBorder: true,
                              strokeColor: cBlueDark,
                              borderRadius: 5,
                              hint: '')),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      SizedBox.square(
                        dimension: 70,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: MyText(
                            text: 'توضیحات',
                            padding: EdgeInsets.only(left: 10),
                          ),
                        ),
                      ),
                      Expanded(
                          child: MyTextField(
                              height: 150,
                              controller: new TextEditingController(),
                              fillColor: cW,
                              txtColor: cB,
                              maxLines: 10,
                              hasBorder: true,
                              strokeColor: cBlueDark,
                              borderRadius: 5,
                              hint: '')),
                    ],
                  ),
                ],
              ),
            ),
            MyTextButton(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 55,
                bgColor: cY,
                width: Get.width,
                onTap: () {},
                child: MyText(
                  text: 'ثبت',
                  color: cB,
                  fontWeight: FontWeight.bold,
                  size: 17,
                ))
          ],
        ),
      ),
    ));
  }
}
