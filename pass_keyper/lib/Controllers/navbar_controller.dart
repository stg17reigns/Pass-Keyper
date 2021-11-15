import 'package:get/get.dart';

class NavBarConteroller extends GetxController {
  var index = 0.obs;

  void incIndex(int navindex) {
    index.value = navindex;
    print(index);
  }
}
