import 'package:financial_management_program/controllers/public_controller.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(publicController());
    
  }
}
