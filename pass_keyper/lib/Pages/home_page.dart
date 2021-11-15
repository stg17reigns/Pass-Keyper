import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:pass_keyper/Controllers/navbar_controller.dart';
import 'package:pass_keyper/Services/home_bindings.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indexhandler = Get.find<NavBarConteroller>();
    return Obx(() {
      return Scaffold(
        body: Column(
          children: [
            Container(), //scrollable accounts
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomNavigationBar(
            currentIndex: indexhandler.index.value,
            onTap: (navindex) {
              return indexhandler.incIndex(navindex);
            }, //change pages
            isFloating: true,
            elevation: 1,
            iconSize: 30,
            selectedColor: Colors.teal,
            unSelectedColor: Colors.red[200],
            borderRadius: const Radius.circular(20),
            items: [
              CustomNavigationBarItem(
                badgeCount: indexhandler.index.value,
                showBadge: true, //imp use
                icon: const Icon(Icons.home),
                title: const Text(
                  'Home',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.new_label),
                title: const Text(
                  'New Article',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.login_rounded),
                title: const Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
