import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'password_model.g.dart';

//used for creating custom model/datatype for hive(key,value) pair
@HiveType(typeId: 0)
class PassWordManager extends HiveObject {
  @HiveField(0)
  late String accountName;
  @HiveField(1)
  late String passWord;
  @HiveField(2)
  late String hints;
  @HiveField(3)
  late Color colorTag;
  @HiveField(4)
  late DateTime createdDate;
}
