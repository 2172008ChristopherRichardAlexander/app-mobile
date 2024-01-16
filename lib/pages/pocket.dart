import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tugasbesar_2172008/pages/home.dart';
import 'package:tugasbesar_2172008/provider/getpocket_user_provider.dart';
import 'package:tugasbesar_2172008/provider/pockets_provider.dart';
import 'package:tugasbesar_2172008/provider/user_data_provider.dart';

class AddPocket {
  final balance = TextEditingController();
  final title = TextEditingController();
}

final addPocketProvider = Provider((ref) => AddPocket());

class PocketDetailPage extends ConsumerWidget {
  const PocketDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController balance =
        TextEditingController(text: ref.watch(getPocketUserProvider).value!.balance.toString());
    TextEditingController title =
        TextEditingController(text: ref.watch(getPocketUserProvider).value?.title);

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
                                builder: (context) => const HomePage()),
                          );
                        },
                      ),
                      const Text(
                        'Your Pocket',
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
                      controller: balance,
                      readOnly: true,
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
                      controller: title,
                      readOnly: true,
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
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
