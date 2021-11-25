import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pass_keyper/Models/password_model.dart';
import 'package:pass_keyper/Pages/edit_page.dart';
import 'package:pass_keyper/Pages/group_page.dart';
import 'package:pass_keyper/Pages/licences_page.dart';
import 'package:pass_keyper/Pages/passwordgenerator_page.dart';
import 'package:pass_keyper/Pages/settings_page.dart';
import 'package:pass_keyper/Services/home_bindings.dart';
import 'Pages/home_page.dart';
import 'Services/local_auth_api.dart';

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
    Future<bool?> buildButton() async {
      final isAuthenticated = await LocalAuthApi.authenticate();

      if (isAuthenticated) {
        return true;
      }
      exit(0);
    }

    return GetMaterialApp(
      title: 'My Pass Keyper',
      debugShowCheckedModeBanner: false,
      onInit: buildButton,
      theme: ThemeData(
        //do something about this
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
      ),
      initialRoute: '/home',
      getPages: [
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
        )
      ],
    );
  }
}
