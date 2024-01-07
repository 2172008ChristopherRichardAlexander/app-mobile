import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tugasbesar_2172008/pages/transferpage.dart';
import 'package:tugasbesar_2172008/provider/target_user_provider.dart';
import 'package:tugasbesar_2172008/provider/user_data_provider.dart';

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
      appBar: AppBar(
        title: const Text('Send Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Balance: "),
            Text(
              NumberFormat.currency(locale: 'id')
                  .format(ref.watch(userDataProvider).value?.balance??0),
              style: const TextStyle(fontSize: 25),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter an email',
              ),
              controller: userEmailData.userEmail,
            ),
            const SizedBox(
                height: 20), // Add some space between TextField and button
            ElevatedButton(
              onPressed: () async {
                final email = userEmailData.userEmail.text;
                await ref.read(targetUserProvider.notifier).useremail(email);
                
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
