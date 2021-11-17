import 'package:hive/hive.dart';
import 'package:pass_keyper/Models/password_model.dart';
import 'package:pass_keyper/Pages/group_page.dart';

class Boxes {
  static Box<PassWordManager> getAccounts() =>
      Hive.box<PassWordManager>('Passwords');
}
