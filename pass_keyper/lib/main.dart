import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pass_keyper/Models/box_model.dart';
import 'package:pass_keyper/Models/password_model.dart';
import 'package:pass_keyper/Pages/edit_page.dart';
import 'package:pass_keyper/Pages/group_page.dart';
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
      title: 'My Pass Keyper',
      debugShowCheckedModeBanner: false,
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
        )
      ],
    );
  }
}
