import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tugasbesar_2172008/pages/home.dart';
import 'package:tugasbesar_2172008/provider/user_data_provider.dart';

class GetMoney {
  final money = TextEditingController();
}

Future<void> fetchData(BuildContext context, WidgetRef ref) async {
  String email = ref.watch(userDataProvider).value?.email ?? '';
  String password = ref.watch(userDataProvider).value?.password ?? '';
  await ref.read(userDataProvider.notifier).login(email, password);
}

final moneyDataProvider = Provider((ref) => GetMoney());

class RequestPage extends ConsumerWidget {
  const RequestPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController emailUser =
        TextEditingController(text: ref.watch(userDataProvider).value?.email);
    int moneyUser = ref.watch(userDataProvider).value!.balance;
    final moneyData = ref.read(moneyDataProvider);
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
                        'Request Money',
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
                      controller: moneyData.money,
                      decoration: const InputDecoration(
                        labelText: 'Enter a number',
                        prefixIcon: Icon(Icons.money),
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
                        final money = moneyData.money.text;
                        int? intMoney = int.tryParse(money);
                        int? sumMoney = intMoney! + moneyUser;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                        await fetchData(context, ref);
                        final email = emailUser.text;
                        await ref
                            .read(userDataProvider.notifier)
                            .money(sumMoney, email);
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
