import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass_keyper/Controllers/navbar_controller.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);
  Widget? _tabFunctions(int index) {
    switch (index) {
      case 0:
        Get.toNamed('/home');
        break;
      case 1:
        Get.toNamed('/home');
        break;
      case 2:
        Get.toNamed('/settings');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final indexhandler = Get.find<NavBarConteroller>();
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
              child: Text(
            'helo',
            style: TextStyle(fontSize: 30, color: Colors.black),
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/home');
          return;
        },
        child: const Icon(
          Icons.done,
          size: 25,
          color: Colors.black,
        ),
      ),
    );
  }
}