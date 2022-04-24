import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class AuthMe extends StatefulWidget {
  const AuthMe({Key? key}) : super(key: key);

  @override
  _AuthMeState createState() => _AuthMeState();
}

class _AuthMeState extends State<AuthMe> {
  LocalAuthentication auth = LocalAuthentication();

  bool? _cancheckbio;
  List<BiometricType>? _availablebio;
  String _authStatus = "Not Authenticated";

  Future<void> _checkbio() async {
    bool cancheckbio = false;
    try {
      cancheckbio = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _cancheckbio = cancheckbio;
    });
  }

  Future<void> _getavailablebio() async {
    List<BiometricType> availablebio = [];
    try {
      availablebio = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _availablebio = availablebio;
    });
  }

  Future<void> _authbio() async {
    bool authen = false;
    try {
      authen = await auth.authenticate(
        localizedReason: 'Please Authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _authStatus = authen ? "Authenticated" : "Not Authenticated";
    });
    //delay for show status
    if (_authStatus == "Authenticated") {
      Future.delayed(Duration(seconds: 10));
      Get.toNamed('/home');
    }
    print("Cancelled");
  }

  @override
  void initState() {
    _checkbio();
    _getavailablebio();
    _authbio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("AUTH ME");
    print(MediaQuery.of(context).size.width);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.asset(
            'assets/login.png',
            //color: const Color.fromARGB(255, 187, 68, 108),
          ),
        ),
        // Text('Devices has BIOMETRICS: $_cancheckbio'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 86, 90, 88),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(
                    child: Text(
                      'Authentication Status:',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      '$_authStatus',
                      style: TextStyle(
                          color: _authStatus == "Authenticated"
                              ? const Color.fromARGB(255, 147, 235, 150)
                              : Colors.red),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        IconButton(
          iconSize: 70,
          onPressed: _authbio,
          icon: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Color.fromARGB(233, 248, 250, 234),
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              'assets/fingerprint.png',
              color: Color.fromARGB(255, 184, 34, 144),
            ),
          ),
        ),
      ],
    ));
  }
}
