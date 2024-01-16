import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tugasbesar_2172008/pages/home.dart';
import 'package:tugasbesar_2172008/provider/pockets_provider.dart';
import 'package:tugasbesar_2172008/provider/user_data_provider.dart';

class AddPocket {
  final email = TextEditingController();
  final balance = TextEditingController();
  final title = TextEditingController();
}

final addPocketProvider = Provider((ref) => AddPocket());

class PocketPage extends ConsumerWidget {
  const PocketPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String emailData = ref.watch(userDataProvider).value?.email ?? '';
    final pocketData = ref.read(addPocketProvider);
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
              height: 450,
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
                                builder: (context) =>  HomePage()),
                          );
                        },
                      ),
                      const Text(
                        'New Pocket',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 184, 133, 23),
                        ),
                      ),
                      
                      const SizedBox(width: 40), // Adjust as needed
                    ],
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      controller: pocketData.balance,
                      decoration: const InputDecoration(
                        labelText: 'Balance',
                        prefixIcon: Icon(Icons.money),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 184, 133, 23),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      controller: pocketData.title,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        prefixIcon: Icon(Icons.notes),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 184, 133, 23),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
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
                        final email = emailData;
                        final balance = pocketData.balance.text;
                        int? intMoney = int.tryParse(balance);
                        final title = pocketData.title.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  HomePage(),
                          ),
                        );
                        print(email);
                        await ref
                            .read(userDataProvider.notifier)
                            .pockets(email, intMoney!, title);
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
