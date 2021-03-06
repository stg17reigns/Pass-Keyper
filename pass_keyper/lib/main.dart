import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pass_keyper/Models/password_model.dart';
import 'package:pass_keyper/Pages/attribution_page.dart';
import 'package:pass_keyper/Pages/auth_me.dart';
import 'package:pass_keyper/Pages/edit_page.dart';
import 'package:pass_keyper/Pages/group_page.dart';
import 'package:pass_keyper/Pages/licences_page.dart';
import 'package:pass_keyper/Pages/passwordgenerator_page.dart';
import 'package:pass_keyper/Pages/settings_page.dart';
import 'package:pass_keyper/Services/home_bindings.dart';
import 'Pages/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(PassWordManagerAdapter());
  await Hive.openBox<PassWordManager>('Passwords');
  await Hive.openBox<int>('Badge');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pass Keyper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //do something about this
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
      ),
      initialRoute: '/auth',
      getPages: [
        GetPage(
          name: '/auth',
          page: () => const AuthMe(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/settings',
          page: () => const SettingsPage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/group',
          page: () => const GroupPage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/edit',
          page: () => const EditPage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/passwordgenerator',
          page: () => const PasswordGenerator(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/licences',
          page: () => LicensesSimplePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/attribute',
          page: () => const Attribution_Page(),
        ),
      ],
    );
  }
}
