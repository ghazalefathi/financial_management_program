import 'package:financial_management_program/controllers/public_controller.dart';
import 'package:financial_management_program/models/task_model.dart';
import 'package:financial_management_program/widgets/MyTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../widgets/MyTextButton.dart';
import '../widgets/my_text_widget.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreen();
}

class _EditTaskScreen extends State<EditTaskScreen> {
  final controller = Get.find<publicController>();
  //! for Update
  //!2
  late TextEditingController txt;
  late TextEditingController title;
  //! for Update
  //!3
  @override
  void initState() {
    txt = TextEditingController();
    title = TextEditingController();
    title.text = controller.selectedTask.value.title ?? '';
    txt.text = controller.selectedTask.value.txt ?? '';

    super.initState();
  }

//! forUpdate
//! 4
  @override
  void dispose() {
    title.dispose();
    txt.dispose();

    super.dispose();
  }

  // for update
  // 4
  // ست کردن های کنتلرهای جدیدی ک تعریف کردی
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
            text: 'ویرایش تسک',
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
                              //5
                              controller: title,
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
                              //5
                              controller: txt,
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
                onTap: () {
                  //! for update onTap section
                  //1
                  TaskModel newTask = TaskModel(
                    title: title.text,
                    txt: txt.text,
                  );
                  //2  لیست در کنتلرindex گرفتن
                  //save update in hive
                  //3
                  controller.hiveBoxTask.putAt(
                      controller.selectedIndexForEditTask.value, newTask);
                  Get.toNamed('/home');
                  print('yes Edit');
                },
                child: MyText(
                  text: 'ثبت ویرایش',
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
