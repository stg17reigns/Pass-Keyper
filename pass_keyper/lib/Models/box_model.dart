import 'package:hive/hive.dart';
import 'package:pass_keyper/Models/password_model.dart';

class Boxes {
  static Box<PassWordManager> getAccounts() =>
      Hive.box<PassWordManager>('Passwords');
  static Box<int> getBadge() => Hive.box<int>('Badge');
}
