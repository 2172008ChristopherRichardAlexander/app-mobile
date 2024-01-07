import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tugasbesar_2172008/provider/user_data_provider.dart';

class EditProfilePage extends ConsumerWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController email =
        TextEditingController(text: ref.watch(userDataProvider).value?.email);
    TextEditingController name =
        TextEditingController(text: ref.watch(userDataProvider).value?.name);
    TextEditingController phone =
        TextEditingController(text: ref.watch(userDataProvider).value?.phone);
    TextEditingController address =
        TextEditingController(text: ref.watch(userDataProvider).value?.address);
    //TextEditingController password = TextEditingController(text: ref.watch(userDataProvider).value?.email);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 154, 0),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 40, bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const CircleAvatar(
                radius: 70,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.people),
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffB81736),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffB81736),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: phone,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.call),
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffB81736),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: address,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    prefixIcon: Icon(Icons.home),
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffB81736),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 40,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffB81736),
                      Color.fromARGB(255, 187, 120, 32),
                    ],
                  ),
                ),
                child: TextButton(
                  onPressed: () async {},
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 40,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffB81736),
                      Color.fromARGB(255, 187, 120, 32),
                    ],
                  ),
                ),
                child: TextButton(
                  onPressed: () async {},
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
