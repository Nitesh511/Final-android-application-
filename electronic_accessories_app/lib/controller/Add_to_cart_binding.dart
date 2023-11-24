import 'package:electronic_accessories_app/controller/Add_to_cart.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddtocartCounterController());
  }
}
