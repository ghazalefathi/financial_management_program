import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/money_model.dart';
import '../widgets/MySncakBar.dart';

class publicController extends GetxController {
  RxInt selectedBottomNavgiation = 0.obs;
  RxBool hasTextFeild = false.obs;
  RxInt groupValue = 0.obs;
  RxString date = 'تاریخ'.obs;
  Rx<MoneyModel> selectedTransaction = MoneyModel().obs;
  TextEditingController transactionTitleController = TextEditingController();
  TextEditingController transactionPriceController = TextEditingController();
  RxList<MoneyModel> listTransactions = <MoneyModel>[].obs;
  //! تعریف هایو برای استفاده
  Box<MoneyModel> hiveBox = Hive.box<MoneyModel>('moneyModelBox');
  //! Functions
  //! 2
  RxInt selectedIndexForEdit = 0.obs;

  void runSplash() {
    Timer(Duration(seconds: 3), () {
      Get.toNamed('/home');
      //! for show list
      loadlistTransactions();
    });
  }

  //! for load list in hive 1
  void loadlistTransactions() {
    listTransactions.clear();
    hiveBox.values.forEach((element) {
      listTransactions.add(element);
    });
  }

  //! add in hive 2
  void addTransaction() {
    hiveBox.add(MoneyModel());
    String txtPrice = transactionPriceController.text.trim();
    String txtTitle = transactionTitleController.text.trim();
    if (txtPrice.length > 1 && txtTitle.length > 1) {
      MoneyModel m = MoneyModel(
          date: date.value,
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
}
