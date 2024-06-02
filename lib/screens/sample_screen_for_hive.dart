// import 'package:financial_management_program/models/user.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// import '../widgets/my_text_widget.dart';

// class SampleScreenForHive extends StatelessWidget {
//   const SampleScreenForHive({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       floatingActionButton: FloatingActionButton(
//         child: MyText(
//           text: 'read',
//         ),
//         onPressed: () {
//           //! add
//           // Hive.box<User>('userBox').add(User(
//           //     address: 'iran',
//           //     age: 21,
//           //     city: 'tehran',
//           //     firstName: 'ghazale',
//           //     lastName: 'fathi'));
//           // Hive.box<User>('userBox').add(User(
//           //     address: 'iran',
//           //     age: 22,
//           //     city: 'Gorgan',
//           //     firstName: 'edris',
//           //     lastName: 'mazhari'));
//           // Hive.box<User>('userBox').add(User(
//           //     address: 'iran',
//           //     age: 50,
//           //     city: 'c',
//           //     firstName: 'a',
//           //     lastName: 'b'));
//           // print('saved');
//           //! read
//           Hive.box<User>('userBox').values.forEach((element) {
//             print('**********************');
//             print(element.firstName);
//             print(element.lastName);
//             print(element.address);
//             print(element.age);
//             print('**********************');
//           });

//           //! update
//           // Hive.box<User>('userBox').putAt(
//           //     2,
//           //     User(
//           //         firstName: 'akbar',
//           //         address: 'London',
//           //         age: 25,
//           //         city: 'b',
//           //         lastName: '4525'));
//           // print('update');
//         },
//       ),
//     ));
//   }
// }
