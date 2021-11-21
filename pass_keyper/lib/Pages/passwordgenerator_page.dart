import 'package:flutter/material.dart';

class PasswordGenerator extends StatelessWidget {
  const PasswordGenerator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController txt = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Generator'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 30,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(child: Text('Enter Your Password'))),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: txt,
                decoration: const InputDecoration(
                  hintText: 'Enter Sample Password',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(child: Text('Generate'))),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: 0,
                      onChanged: (x) {},
                    ),
                    Text('Select For Including     !, @, #, \$, %, &, *')
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: 0,
                      onChanged: (x) {},
                    ),
                    Text('Select For Including     0-9')
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: 0,
                      onChanged: (x) {},
                    ),
                    Text('Select For Including     A-Z')
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: 0,
                      onChanged: (x) {},
                    ),
                    Text('Select For Including     a-z')
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  height: 30,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(child: Text('Generated Password'))),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 250,
                    child: TextField(
                      controller: txt,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: 'Generated Password',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      print(txt.text);
                    },
                    icon: Icon(Icons.copy),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
