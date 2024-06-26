import 'package:financial_management_program/screens/add_task_screen.dart';
import 'package:financial_management_program/screens/edit_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'constants/bindings.dart';
import 'models/money_model.dart';
import 'models/task_model.dart';
import 'screens/add_transaction_screen.dart';
import 'screens/edit_transaction_screen.dart';
import 'screens/main_screen.dart/home_screen.dart';
import 'screens/splash_screen.dart';

//! edit / add task kar nmikone /
main() async {
  await Hive.initFlutter();
  //! money
  Hive.registerAdapter(MoneyModelAdapter());
  await Hive.openBox<MoneyModel>('moneyModelBox');
  //! task
  // await Hive.initFlutter();

  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('open');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'financial-management-program',
        initialRoute: '/splash',
        initialBinding: MyBindings(),
        routes: {
          '/splash': (context) => SplashScreen(),
          '/home': (context) => HomeScreen(),
          '/add-transaction': (context) => AddTransactionScreen(),
          '/edit-transaction': (context) => EditTransactionScreen(),
          '/add-task': (context) => AddTaskScreen(),
          '/edit-task': (context) => EditTaskScreen(),
        });
  }
}
