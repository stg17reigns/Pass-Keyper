import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 100,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.red,
                ),
                child: const Center(
                  child: Text(
                    'Backup',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 100,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.red,
                ),
                child: const Center(
                  child: Text(
                    'Password Generator',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 100,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.red,
                ),
                child: const Center(
                  child: Text(
                    'Licences',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 100,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.red,
                ),
                child: const Center(
                  child: Text(
                    'Share App',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 100,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.red,
                ),
                child: const Center(
                  child: Text(
                    'Send Feedback',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
