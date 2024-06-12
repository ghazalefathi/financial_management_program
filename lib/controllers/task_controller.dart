// import 'package:financial_management_program/models/task_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class TaskController extends GetxController {
//   RxList<TaskModel> listTasks = <TaskModel>[].obs;
//   TextEditingController txtController = TextEditingController();
//   TextEditingController titleController = TextEditingController();
//   //! for update
//   //! 1
//   Rx<TaskModel> selectedTask = TaskModel().obs;
//   //! For update section onTap
//   //2
//   RxInt selectedIndexForEdit = 0.obs;

//   //! 1
//   Box<TaskModel> hiveBox = Hive.box<TaskModel>('open');

//   //! 2
//   void loadListTasks() {
//     listTasks.clear();
//     hiveBox.values.forEach((element) {
//       listTasks.add(element);
//     });
//   }

//   //!3
//   void addTasks() {
//     hiveBox.add(TaskModel());
//     String txtTitle = titleController.text.trim();
//     String txtText = txtController.text.trim();
//     if (txtText.length >= 1 && txtText.length >= 1) {
//       TaskModel task = TaskModel(
//         title: txtTitle,
//         txt: txtText,
//       );
//       listTasks.add(task);
//       hiveBox.add(task);
//       // txtController.text = '';
//       // titleController.text = '';
//     }
//     print('save to hive');
//   }

//   void removeTask({required int index}) {
//     listTasks.removeAt(index);
//     hiveBox.deleteAt(index);
//     Get.back();
//   }


// }
