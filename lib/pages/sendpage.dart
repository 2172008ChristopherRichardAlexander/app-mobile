import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tugasbesar_2172008/pages/home.dart';
import 'package:tugasbesar_2172008/pages/transferpage.dart';
import 'package:tugasbesar_2172008/provider/target_user_provider.dart';


class SendUser {
  final userEmail = TextEditingController();
}

final userEmailProvider = Provider((ref) => SendUser());

class SendPage extends ConsumerWidget {
  const SendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userEmailData = ref.read(userEmailProvider);
    ref.listen(
      targetUserProvider,
      (previous, next) {
        if (next.valueOrNull != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const TransferPage(),
            ),
          );
        }
      },
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 154, 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 380,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 40, bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                      ),
                      const Text(
                        'Find Person',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 184, 133, 23),
                        ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      controller: userEmailData.userEmail,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 184, 133, 23),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
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
                      onPressed: () async {
                        final email = userEmailData.userEmail.text;
                        await ref
                            .read(targetUserProvider.notifier)
                            .useremail(email);
                      },
                      child: const Text(
                        'Submit',
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
        ],
      ),
    );
  }
}
