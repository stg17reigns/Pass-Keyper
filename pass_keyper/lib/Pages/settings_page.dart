import 'package:flutter/material.dart';
import 'package:email_launcher/email_launcher.dart';
import 'package:get/get.dart';

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
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange,
                ),
                child: InkWell(
                  onTap: () {
                    Get.defaultDialog(
                      title: 'Coming Soon!',
                      middleText: 'Please wait. Sorry for Inconvenience',
                    );
                  },
                  child: const Center(
                    child: Text(
                      'Set AppLock',
                      style: TextStyle(
                        fontSize: 20,
                      ),
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
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.teal,
                ),
                child: InkWell(
                  onTap: () {
                    Get.toNamed('/passwordgenerator');
                  },
                  child: const Center(
                    child: Text(
                      'Password Generator',
                      style: TextStyle(
                        fontSize: 20,
                      ),
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
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.purple,
                ),
                child: InkWell(
                  onTap: () {
                    Get.toNamed('/licences');
                  },
                  child: const Center(
                    child: Text(
                      'Licences',
                      style: TextStyle(
                        fontSize: 20,
                      ),
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
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey,
                ),
                child: InkWell(
                  onTap: () {
                    Get.defaultDialog(
                      title: 'Coming Soon!',
                      middleText: 'Please wait. Sorry for Inconvenience',
                    );
                  },
                  child: const Center(
                    child: Text(
                      'Share App',
                      style: TextStyle(
                        fontSize: 20,
                      ),
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
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.indigoAccent,
                ),
                child: InkWell(
                  onTap: () async {
                    Email email = Email(
                        to: ['statsapp.qa8kf@dralias.com'],
                        subject: 'Feedback',
                        body: 'Write Your Problem.');
                    await EmailLauncher.launch(email);
                    print("Email Send");
                  },
                  child: const Center(
                    child: Text(
                      'Send Feedback',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
