import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tugasbesar_2172008/pages/home.dart';
import 'package:tugasbesar_2172008/provider/target_user_provider.dart';
import 'package:tugasbesar_2172008/provider/user_data_provider.dart';

class SendMoney {
  final money = TextEditingController();
}

final moneyDataProvider = Provider((ref) => SendMoney());

class TransferPage extends ConsumerWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moneyData = ref.read(moneyDataProvider);
    TextEditingController emailUser =
        TextEditingController(text: ref.watch(userDataProvider).value?.email);
    TextEditingController emailTarget =
        TextEditingController(text: ref.watch(targetUserProvider).value?.email);
    int moneyUser = ref.watch(userDataProvider).value?.balance ?? 0;
    int moneyTarget = ref.watch(targetUserProvider).value!.balance;
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
              height: 400,
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
                        'Transfer Page',
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
                  Text(
                    'Name: ${ref.watch(targetUserProvider).value?.name}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 184, 133, 23),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Money: ${NumberFormat.currency(locale: 'id').format(ref.watch(userDataProvider).value?.balance ?? 0)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 184, 133, 23),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      controller: moneyData.money,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                        final money = moneyData.money.text;
                        int? intMoney = int.tryParse(money);
                        final userEmail = emailUser.text;
                        final targetEmail = emailTarget.text;
                        await ref.read(userDataProvider.notifier).transfer(
                            userEmail,
                            targetEmail,
                            moneyUser,
                            moneyTarget,
                            intMoney!);
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
