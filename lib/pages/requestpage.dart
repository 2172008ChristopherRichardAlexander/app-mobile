import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tugasbesar_2172008/provider/user_data_provider.dart';

class GetMoney {
  final money = TextEditingController();
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
      appBar: AppBar(
        title: const Text('Request Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Enter a number',
              ),
              controller: moneyData.money,
            ),
            const SizedBox(
                height: 20), // Add some space between TextField and button
            ElevatedButton(
              onPressed: () async {
                final money = moneyData.money.text;
                int? intMoney = int.tryParse(money);
                int? sumMoney = intMoney! + moneyUser;
                final email = emailUser.text;
                await ref
                    .read(userDataProvider.notifier)
                    .money(sumMoney, email);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
