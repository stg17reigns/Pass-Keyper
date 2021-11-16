import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pass_keyper/Services/home_bindings.dart';

import 'Pages/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
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
        )
      ],
    );
  }
}
