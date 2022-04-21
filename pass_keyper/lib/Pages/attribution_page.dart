import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Attribution_Page extends StatelessWidget {
  const Attribution_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () =>
                  launch("https://www.flaticon.com/free-icons/fingerprint"),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black45,
                ),
                child: const Text(
                  'ICON OF FINGER-PRINT:\n\n <a href="https://www.flaticon.com/free-icons/fingerprint" title="fingerprint icons">Fingerprint icons created by LAFS - Flaticon</a>',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
