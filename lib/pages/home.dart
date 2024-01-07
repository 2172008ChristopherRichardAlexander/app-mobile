import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tugasbesar_2172008/pages/history.dart';
// import 'package:tugasbesar_2172008/pages/navbar.dart';
import 'package:tugasbesar_2172008/pages/requestpage.dart';
import 'package:tugasbesar_2172008/pages/sendpage.dart';
import 'package:tugasbesar_2172008/provider/user_data_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 154, 0),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    'Hello ${ref.watch(userDataProvider).value?.name}!',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.topLeft,
              child: const Text('No Rek: 0123123'),
            ),
            const SizedBox(height: 25),
            Container(
              width: 250,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 193, 0),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Text("Balance: "),
                  Text(
                    NumberFormat.currency(locale: 'id')
                        .format(ref.watch(userDataProvider).value?.balance?? 0),
                    style: const TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 30),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        width: 200,
                        height: 90,
                        padding: const EdgeInsets.all(35),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 193, 0),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(child: Text('PROMO')),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        width: 200,
                        height: 90,
                        padding: const EdgeInsets.all(35),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 193, 0),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(child: Text('PROMO')),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        width: 200,
                        height: 90,
                        padding: const EdgeInsets.all(35),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 193, 0),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(child: Text('PROMO')),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SendPage()),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 255, 193, 0),
                          ),
                          child: const Center(
                            child: Image(
                              image: AssetImage('lib/assets/images/cash.png'),
                            ),
                          ),
                        ),
                        const Text('Send',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RequestPage()),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 255, 193, 0),
                          ),
                          child: const Center(
                            child: Image(
                              image:
                                  AssetImage('lib/assets/images/request.png'),
                            ),
                          ),
                        ),
                        const Text('Request',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HistoryPage()),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 255, 193, 0),
                          ),
                          child: const Center(
                            child: Image(
                              image:
                                  AssetImage('lib/assets/images/history.png'),
                            ),
                          ),
                        ),
                        const Text('History',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(),
            // const Expanded(child: NavbarPage())
          ],
        ),
      ),
    );
  }
}
