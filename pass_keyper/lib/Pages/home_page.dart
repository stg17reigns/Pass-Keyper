import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pass_keyper/Models/box_model.dart';
import 'package:pass_keyper/Controllers/navbar_controller.dart';
import 'package:pass_keyper/Models/password_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  get builder => null;
  Widget? _tabFunctions(int index) {
    switch (index) {
      case 0:
        Get.toNamed('/home');
        break;
      case 1:
        Get.toNamed('/group');
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
    return Obx(() {
      return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
              child: Container(
                height: MediaQuery.of(context).size.height / 15,
                alignment: Alignment.center,
                child: const Text(
                  'Pass Keyper',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Boxes.getBadge().get('Badge_No.') == 0
                  ? Center(
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.purple,
                                blurRadius: 10,
                                offset: Offset(10, -10),
                              ),
                              BoxShadow(
                                color: Colors.teal,
                                blurRadius: 10,
                                offset: Offset(5, -10),
                              ),
                            ],
                            color: Colors.red[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Empty!! Try Making\n New Account',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.4,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/Bg.png'),
                              fit: BoxFit.cover,
                              opacity: 0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ValueListenableBuilder<Box<PassWordManager>>(
                          valueListenable: Boxes.getAccounts().listenable(),
                          builder: (context, box, _) {
                            final accounts =
                                box.values.toList().cast<PassWordManager>();
                            return scrollerWidget(accounts);
                          },
                        ),
                      ),
                    ),
            ), //scrollable accounts
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(3, 1, 3, 5),
          child: CustomNavigationBar(
            currentIndex: indexhandler.index.value,
            onTap: (navindex) {
              return _tabFunctions(navindex);
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
                badgeCount: Boxes.getBadge().get('Badge_No.') == null
                    ? 0
                    : Boxes.getBadge().get('Badge_No.')!.toInt(),
                showBadge: true, //imp use
                icon: const Icon(Icons.home),
                title: const Text(
                  'Home',
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.new_label),
                title: const Text(
                  'New Account',
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.settings),
                title: const Text(
                  'Settings',
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget scrollerWidget(List<PassWordManager> accounts) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      itemCount: accounts.length,
      itemBuilder: (context, index) {
        final account = accounts[index];
        return Column(
          children: [
            InkWell(
              onTap: () {
                // ignore: avoid_print
                //go in detail page of account
                Get.toNamed('/edit', parameters: {
                  'index': index.toString(),
                  'acc': account.accountName,
                  'email': account.emailId,
                  'pass': account.passWord,
                  'hint': account.hints,
                  'color': account.colorTag.toString()
                });
                return print(index);
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(63, 51, 81, 1),
                  //color: Colors.red[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  //this list will have 1 demo list not null
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(31, 29, 54, 1),
                    child: Text('${index + 1}'),
                  ),
                  title: Text(
                    '${account.accountName}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: CircleAvatar(
                    radius: 10,
                    backgroundColor: Color(account.colorTag),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            )
          ],
        );
      },
    );
  }
}
