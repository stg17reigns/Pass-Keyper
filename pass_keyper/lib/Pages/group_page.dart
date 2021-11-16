import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:pass_keyper/Controllers/navbar_controller.dart';

//option to create group or single
class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);

//make controller for this page
  @override
  Widget build(BuildContext context) {
    bool obsecuretext = true;
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Account Name',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const TextField(
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
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      obsecuretext == true
                          ? Icons.no_encryption_gmailerrorred_outlined
                          : Icons.enhanced_encryption_outlined,
                      color: Colors.white,
                    ),
                  ),
                  cursorColor: Colors.amber,
                  onTap: () => obsecuretext == true ? false : true,
                  obscureText: obsecuretext, //make obscure off button
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
                const TextField(
                  cursorColor: Colors.amber,
                  textCapitalization: TextCapitalization.words,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                    padding: const EdgeInsets.all(30),
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
