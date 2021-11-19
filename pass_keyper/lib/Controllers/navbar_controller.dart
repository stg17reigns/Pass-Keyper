import 'package:get/get.dart';

class NavBarConteroller extends GetxController {
  var index = 0.obs;
  var badgeConuter = 0.obs; //should be persistent

  void incIndex(int navindex) {
    index.value = navindex;
    print(index);
  }
}
