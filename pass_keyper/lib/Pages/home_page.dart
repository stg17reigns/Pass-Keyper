import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:pass_keyper/Controllers/navbar_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indexhandler = Get.find<NavBarConteroller>();
    return Obx(() {
      return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
              child: Container(
                height: MediaQuery.of(context).size.height / 13,
                alignment: Alignment.center,
                // decoration: BoxDecoration(
                //   color: Colors.purple,
                //   borderRadius: BorderRadius.circular(20),
                // ),
                child: const Text(
                  'Pass-Kryper',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
              child: Container(
                  height: MediaQuery.of(context).size.height / 1.4,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            color: Colors.red[200],
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text('$index'),
                              ),
                              title: Text(
                                'Facebook $index',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          )
                        ],
                      );
                    },
                  )),
            ), //scrollable accounts
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
            strokeColor: Colors.redAccent,
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
