import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:pass_keyper/Controllers/group_controller.dart';
import 'package:pass_keyper/Controllers/navbar_controller.dart';
import 'package:pass_keyper/Models/box_model.dart';
import 'package:pass_keyper/Models/password_model.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

//make controller for this page
  @override
  Widget build(BuildContext context) {
    TextEditingController accName = TextEditingController();
    TextEditingController emailId = TextEditingController();
    TextEditingController passWord = TextEditingController();
    TextEditingController hintMy = TextEditingController();
    Color myColor = Colors.red;
    late int index;

    Get.parameters.forEach((key, value) {
      if (key == 'index') {
        index = int.parse(value!);
      }

      if (key == 'acc') {
        accName.text = value!;
      }
      if (key == 'email') {
        emailId.text = value!;
      }
      if (key == 'pass') {
        passWord.text = value!;
      }
      if (key == 'hint') {
        hintMy.text = value!;
      }
      if (key == 'color') {
        myColor = Color(int.parse(value!));
      }
    });
    //bool obsecuretext = true;
    final groupController = Get.find<GroupController>();
    final indexhandler = Get.find<NavBarConteroller>();
    return Scaffold(
      body: Center(
        child: Container(
          height: 430,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Account Name',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: accName,
                    cursorColor: Colors.amber,
                    decoration: const InputDecoration(
                      hintText: 'eg: Facebook',
                    ),
                    textCapitalization: TextCapitalization.words,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Email Id',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'eg: My_Name@stg.com',
                    ),
                    controller: emailId,
                    cursorColor: Colors.amber,
                    textCapitalization: TextCapitalization.words,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    obscuringCharacter: '\$',
                    controller: passWord,
                    decoration: InputDecoration(
                      hintText: 'eg: Password',
                      suffixIcon: InkWell(
                        onTap: () {
                          groupController.obsecuretext.value == true
                              ? groupController.obsecuretext.value = false
                              : groupController.obsecuretext.value = true;
                        },
                        child: groupController.obsecuretext.value == true
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Colors.white,
                              ),
                      ),
                    ),
                    cursorColor: Colors.amber,
                    obscureText: groupController
                        .obsecuretext.value, //make obscure off button
                    textCapitalization: TextCapitalization.words,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Hint',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'eg: First_Special_Char_Last',
                    ),
                    controller: hintMy,
                    cursorColor: Colors.amber,
                    textCapitalization: TextCapitalization.words,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Container(
                        height: 20,
                        width: 200,
                        color: Colors.black,
                        child: const Center(
                          child: Text(
                            'Change Color as per Priority',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          // ignore: avoid_print

                          Get.defaultDialog(
                            title: 'Select Color',
                            content: Column(
                              children: [
                                ColorPicker(
                                  colorPickerWidth: 200,
                                  pickerAreaHeightPercent: 0.5,
                                  pickerAreaBorderRadius:
                                      BorderRadius.circular(10),
                                  enableAlpha: false,
                                  // ignore: deprecated_member_use
                                  showLabel: false,
                                  pickerColor: groupController.myColor.value,
                                  onColorChanged: (color) {
                                    groupController.myColor.value = color;
                                    myColor = color;
                                  },
                                ),
                              ],
                            ),
                            confirm: ElevatedButton(
                              onPressed: () {
                                print('done');
                                return Get.back();
                              },
                              child: const Text('Done'),
                            ),
                          );
                          return print('change color');
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: groupController.myColor.value,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'Save',
            onPressed: () {
              //not done until every field filed otherwise not add to hive
              final box = Boxes.getAccounts();
              final account = PassWordManager()
                ..accountName = '${accName.text}'
                ..emailId = '${emailId.text}'
                ..passWord = '${passWord.text}'
                ..hints = '${hintMy.text}'
                ..colorTag = myColor.value
                ..createdDate = DateTime.now();
              box.putAt(index, account);
              //box.clear();
              //do this at start of the page use (Getx Prefernce)
              indexhandler.badgeConuter.value = box.length;
              final badge = Boxes.getBadge();
              badge.put('Badge_No.', indexhandler.badgeConuter.value);
              print(box.get('A1')?.colorTag);
              print(Boxes.getAccounts());

              Get.toNamed('/home');
              return;
            },
            child: const Icon(
              Icons.done,
              size: 25,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            heroTag: 'Delete',
            backgroundColor: Colors.red,
            onPressed: () {
              //delete
              final box = Boxes.getAccounts();
              Boxes.getAccounts().deleteAt(index);
              indexhandler.badgeConuter.value = box.length;
              final badge = Boxes.getBadge();
              badge.put('Badge_No.', indexhandler.badgeConuter.value);
              Get.toNamed('/home');
              return;
            },
            child: const Icon(
              Icons.delete_forever_rounded,
              size: 25,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
