import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:financial_management_program/controllers/public_controller.dart';
import 'package:financial_management_program/controllers/task_controller.dart';
import 'package:financial_management_program/widgets/MyTextButton.dart';
import 'package:financial_management_program/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../widgets/dialog/remove_and_edit_task.dart';
import '../../widgets/empty_widget.dart';
import '../../widgets/home_widget.dart';

class HomeScreen extends GetView<publicController> {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              elevation: 1,
              backgroundColor: cY,
              shape: CircleBorder(),
              child: Icon(
                Icons.add,
                color: cW,
                size: 20,
              ),
              onPressed: () {
                if (controller.selectedBottomNavgiation.value == 0) {
                  Get.toNamed('/add-transaction');
                  controller.selectedDate.value = 'تاریخ';
                } else {
                  
                  Get.toNamed('/add-task');
                }
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar(
                  inactiveColor: cB,
                  activeColor: cY.withOpacity(.5),

                  icons: [
                    Icons.home,
                    Icons.task,
                  ],
                  activeIndex: controller.selectedBottomNavgiation.value,
                  gapLocation: GapLocation.center,
                  notchSmoothness: NotchSmoothness.sharpEdge,
                  onTap: (index) {
                    controller.selectedBottomNavgiation.value = index;
                  },

                  //other params
                )),
            body: Obx(
              () => controller.selectedBottomNavgiation.value == 0
                  ? HomeSection()
                  : TodoSection(),
            )));
  }
}

class HomeSection extends StatefulWidget {
  HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  publicController pubControllere = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => pubControllere.listTransactions.isEmpty
        ? EmptyWidget()
        : Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: MyText(
                  text: 'تراکنش‌ها',
                  fontFamily: 'Cinema',
                  size: 30,
                  padding: EdgeInsets.only(top: 20, right: 15),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Obx(() => ListView.builder(
                        itemCount: pubControllere.listTransactions.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => HomeWidget(
                          index: index,
                          color: pubControllere
                                      .listTransactions[index].isReceived ==
                                  true
                              ? cg
                              : cR,
                          priceColor: pubControllere
                                      .listTransactions[index].isReceived ==
                                  true
                              ? cg
                              : cR,
                          bottom: pubControllere
                                      .listTransactions[index].isReceived ==
                                  true
                              ? 0
                              : 12,
                          date: pubControllere.listTransactions[index].date,
                          title: pubControllere.listTransactions[index].title,
                          price: pubControllere.listTransactions[index].price,
                          icon: pubControllere
                                      .listTransactions[index].isReceived ==
                                  true
                              ? Icons.add
                              : Icons.minimize,
                          // isReceived: index % 2,
                        ),
                      )))
            ],
          ));
  }
}

class TodoSection extends GetView<publicController> {
  const TodoSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: MyText(
            text: 'تسک ها',
            fontFamily: 'Cinema',
            size: 30,
            padding: EdgeInsets.only(top: 20, right: 15),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: Obx(() => controller.listTasks.isEmpty
                ? EmptyWidget(
                    title: 'تسکی یافت نشد',
                  )
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.listTasks.length,
                    itemBuilder: (context, index) {
                      return TodoWidget(
                        title: '${controller.listTasks[index].title}',
                        txt: '${controller.listTasks[index].txt}',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => DialogRemoveAndEditTaskItem(
                              index: index,
                            ),
                          );
                        },
                      );
                    },
                  )))
      ],
    );
  }
}

class TodoWidget extends StatelessWidget {
  final String? title;
  final String? txt;
  final Function()? onTap;
  const TodoWidget({
    super.key,
    this.onTap,
    this.title,
    this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return MyTextButton(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(color: cW, boxShadow: [bs1]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 10,
            ),
            MyText(
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              text: '${title}',
              fontWeight: FontWeight.bold,
              color: cB,
            ),
            SizedBox(
              height: 10,
            ),
            MyText(
              color: cB,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              text: '${txt}',
              textOverflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
