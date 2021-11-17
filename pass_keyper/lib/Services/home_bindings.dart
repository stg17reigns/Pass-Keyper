import 'package:get/get.dart';
import 'package:pass_keyper/Controllers/group_controller.dart';
import 'package:pass_keyper/Controllers/navbar_controller.dart';
import 'package:pass_keyper/Pages/home_page.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavBarConteroller());
    Get.put(GroupController());
  }
}
