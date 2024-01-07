import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
      appBar: AppBar(
        title: const Text('Transfer Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Person: "),
            Text(
              ref.watch(targetUserProvider).value!.name,
              style: const TextStyle(fontSize: 25),
            ),
            const Text("Balance: "),
            Text(
              NumberFormat.currency(locale: 'id')
                  .format(ref.watch(userDataProvider).value?.balance ?? 0),
              style: const TextStyle(fontSize: 25),
            ),
            TextFormField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Enter number',
              ),
              controller: moneyData.money,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final money = moneyData.money.text;
                int? intMoney = int.tryParse(money);
                final userEmail = emailUser.text;
                final targetEmail = emailTarget.text;
                await ref.read(userDataProvider.notifier).transfer(
                    userEmail, targetEmail, moneyUser, moneyTarget, intMoney!);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
