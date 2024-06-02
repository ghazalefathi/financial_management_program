import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:financial_management_program/controllers/public_controller.dart';
import 'package:financial_management_program/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../widgets/empty_widget.dart';
import '../../widgets/home_widget.dart';
import '../../widgets/mannagerTransactionWidget.dart';

class HomeScreen extends GetView<publicController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
            floatingActionButton: Obx(
              () => controller.selectedBottomNavgiation.value == 0
                  ? FloatingActionButton(
                      elevation: 1,
                      backgroundColor: cY,
                      shape: CircleBorder(),
                      child: Icon(
                        Icons.add,
                        color: cW,
                        size: 20,
                      ),
                      onPressed: () {
                        Get.toNamed('/add-transaction');
                      },
                    )
                  : SizedBox(),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar(
                  inactiveColor: cB,
                  activeColor: cY.withOpacity(.5),

                  icons: [
                    Icons.home,
                    Icons.info,
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
                  : InfoSection(),
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

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: MyText(
            text: 'مدیریت‌ ‌تراکنش‌ها',
            fontFamily: 'Cinema',
            size: 30,
            padding: EdgeInsets.only(top: 20, right: 15),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        mannagerTransactionWidget(
          prefixPrice: '5000',
          prefixTtitle: 'پرداختی امروز',
          suffixPrice: '1000',
          suffixTtitle: 'دریافتی امروز',
        ),
        SizedBox(
          height: 20,
        ),
        mannagerTransactionWidget(
          prefixPrice: '5000',
          prefixTtitle: 'پرداختی  ماه',
          suffixPrice: '1000',
          suffixTtitle: 'دریافتی  ماه',
        ),
        SizedBox(
          height: 20,
        ),
        mannagerTransactionWidget(
          prefixPrice: '5000',
          prefixTtitle: 'پرداختی امسال',
          suffixPrice: '1000',
          suffixTtitle: 'دریافتی امسال',
        ),
      ],
    );
  }
}
