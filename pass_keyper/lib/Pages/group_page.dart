import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:pass_keyper/Controllers/group_controller.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);

//make controller for this page
  @override
  Widget build(BuildContext context) {
    TextEditingController accName = TextEditingController();
    TextEditingController emailId = TextEditingController();
    TextEditingController passWord = TextEditingController();
    TextEditingController hintMy = TextEditingController();
    //bool obsecuretext = true;
    final obsecuretextController = Get.find<GroupController>();
    Color myColor = Colors.red;
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
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
                Obx(() {
                  return TextField(
                    obscuringCharacter: '\$',
                    controller: passWord,
                    decoration: InputDecoration(
                      hintText: 'eg: Password',
                      suffixIcon: InkWell(
                        onTap: () {
                          // print('change');
                          // print('$accName' + '$passWord');
                          //print(obsecuretextController.obsecuretext.value);
                          obsecuretextController.obsecuretext.value == true
                              ? obsecuretextController.obsecuretext.value =
                                  false
                              : obsecuretextController.obsecuretext.value =
                                  true;
                        },
                        child: obsecuretextController.obsecuretext.value == true
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
                    obscureText: obsecuretextController
                        .obsecuretext.value, //make obscure off button
                    textCapitalization: TextCapitalization.words,
                  );
                }),
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
                        child: Text('Change Color as per Priority'),
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
                        Get.defaultDialog(title: 'Select Color');
                        ColorPicker(
                          pickerColor: myColor,
                          onColorChanged: (color) => myColor = color,
                        );
                        return print('change color');
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: myColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
