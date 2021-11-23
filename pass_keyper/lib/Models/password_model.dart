import 'package:hive/hive.dart';
part 'password_model.g.dart';

//used for creating custom model/datatype for hive(key,value) pair
@HiveType(typeId: 0)
class PassWordManager extends HiveObject {
  @HiveField(0)
  late String accountName;
  @HiveField(1)
  late String emailId;
  @HiveField(2)
  late String passWord;
  @HiveField(3)
  late String hints;
  @HiveField(4)
  late int colorTag;
  @HiveField(5)
  late DateTime createdDate;
}
