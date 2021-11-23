import 'package:flutter/material.dart';

class LicensesSimplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData.dark(),
        child: LicensePage(
          applicationName: 'Pass-Kryper',
          applicationIcon: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset('assets/boy.png', width: 60, height: 60),
          ),
          applicationVersion: '0.0.1',
          applicationLegalese: 'Copyright ${DateTime.now().year} Pass-Kryper',
        ),
      );
}
