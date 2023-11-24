import 'package:electronic_accessories_app/controller/Favourite_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavCounterController());
  }
}
