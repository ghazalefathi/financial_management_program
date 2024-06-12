import 'dart:async';
import 'package:financial_management_program/controllers/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import '../models/money_model.dart';
import '../models/task_model.dart';
import '../widgets/MySncakBar.dart';

class publicController extends GetxController {
  RxInt selectedBottomNavgiation = 0.obs;
  RxBool hasTextFeild = false.obs;
  RxInt groupValue = 0.obs;
  var selectedDate = 'تاریخ'.obs;
  Rx<MoneyModel> selectedTransaction = MoneyModel().obs;
  TextEditingController transactionTitleController = TextEditingController();
  TextEditingController transactionPriceController = TextEditingController();
  RxList<MoneyModel> listTransactions = <MoneyModel>[].obs;
  Box<MoneyModel> hiveBox = Hive.box<MoneyModel>('moneyModelBox');
  RxInt selectedIndexForEdit = 0.obs;
//! task
  RxList<TaskModel> listTasks = <TaskModel>[].obs;
  TextEditingController txtController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  Rx<TaskModel> selectedTask = TaskModel().obs;
  RxInt selectedIndexForEditTask = 0.obs;
  Box<TaskModel> hiveBoxTask = Hive.box<TaskModel>('open');
  void loadListTasks() {
    listTasks.clear();
    hiveBoxTask.values.forEach((element) {
      listTasks.add(element);
    });
  }

  void addTasks() {
    hiveBoxTask.add(TaskModel());
    String txtTitle = titleController.text.trim();
    String txtText = txtController.text.trim();
    if (txtText.length >= 1 && txtText.length >= 1) {
      TaskModel task = TaskModel(
        title: txtTitle,
        txt: txtText,
      );
      listTasks.add(task);
      hiveBoxTask.add(task);
      // txtController.text = '';
      // titleController.text = '';
    }
    print('save to hive');
  }

  void removeTask({required int index}) {
    listTasks.removeAt(index);
    hiveBoxTask.deleteAt(index);
    Get.back();
  }

  //! transaction
  void runSplash() {
    Timer(Duration(seconds: 3), () {
      Get.toNamed('/home');
      //! for show list
      loadlistTransactions();
      loadListTasks();
    });
  }

  void loadlistTransactions() {
    listTransactions.clear();
    hiveBox.values.forEach((element) {
      listTransactions.add(element);
    });
  }

  void addTransaction() {
    hiveBox.add(MoneyModel());
    String txtPrice = transactionPriceController.text.trim();
    String txtTitle = transactionTitleController.text.trim();
    if (txtPrice.length > 1 && txtTitle.length > 1) {
      MoneyModel m = MoneyModel(
          date: selectedDate.value,
          isReceived: groupValue.value == 1 ? true : false,
          price: transactionPriceController.text,
          title: transactionTitleController.text);
      listTransactions.add(m);
      hiveBox.add(m);

      transactionPriceController.text = '';
      transactionTitleController.text = '';
      Get.toNamed('/home');
    } else {
      showMessage(
          isError: true,
          message: 'لطفا مطمعن شوید تمام فیلد هارا به درستی پر کردید.');
    }
  }

  void remove({required int index}) {
    listTransactions.removeAt(index);
    //! remove in hive
    hiveBox.deleteAt(index);
    Get.back();
  }

  void showMessage({bool? isError = true, required String message}) {
    if (isError == true) {
      MySnackBar(
          message,
          Colors.amber,
          Icon(
            Icons.warning_rounded,
            color: Colors.amber,
          ));
    } else {
      MySnackBar(
          message,
          Colors.green,
          Icon(
            Icons.warning_rounded,
            color: Colors.green,
          ));
    }
  }

  void dateTime({required BuildContext context}) async {
    await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1403),
      lastDate: Jalali(1404),
    ).then((value) {
      if (value != null) {
        selectedDate.value =
            '${value.formatter.yyyy}/ ${value.formatter.mm} / ${value.formatter.dd}';
      }
    });
  }
}
