import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:pass_keyper/Controllers/radio_controller.dart';

class PassGeneratorFn {
  final lowercase = 'abcdefghijklmnopqrstuvwxyz';
  final uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final specialCharList = '!@#\$%&*';
  final numberDataList = '0123456789';

  final passGenController = Get.find<RadioController>();

  String passGeneratedFn(String textVal) {
    String outputString = '';
    if (textVal != '') {
      final randomIndex = Random().nextInt(10);
      outputString += textVal.substring(randomIndex, textVal.length);
      outputString += textVal.substring(0, randomIndex);
      //print(outputString);
    }
    if (passGenController.specialChar.value == 1) {
      outputString += specialCharList[Random().nextInt(specialCharList.length)];
      outputString += specialCharList[Random().nextInt(specialCharList.length)];
    }
    if (passGenController.numberData.value == 1) {
      outputString += numberDataList[Random().nextInt(numberDataList.length)];
      outputString += numberDataList[Random().nextInt(numberDataList.length)];
    }
    if (passGenController.capitalAlpha.value == 1) {
      outputString += uppercase[Random().nextInt(uppercase.length)];
      outputString += uppercase[Random().nextInt(uppercase.length)];
    }
    if (passGenController.smallAlpha.value == 1) {
      outputString += lowercase[Random().nextInt(lowercase.length)];
      outputString += lowercase[Random().nextInt(lowercase.length)];
    }
    return outputString;
  }
}
