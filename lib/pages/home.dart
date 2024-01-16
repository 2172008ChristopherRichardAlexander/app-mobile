import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tugasbesar_2172008/entities/pocket.dart';
import 'package:tugasbesar_2172008/pages/addpocket.dart';
import 'package:tugasbesar_2172008/pages/editprofile.dart';
import 'package:tugasbesar_2172008/pages/history.dart';
import 'package:tugasbesar_2172008/pages/pocket.dart';
import 'package:tugasbesar_2172008/pages/requestpage.dart';
import 'package:tugasbesar_2172008/pages/sendpage.dart';
import 'package:tugasbesar_2172008/provider/getpocket_user_provider.dart';
import 'package:tugasbesar_2172008/provider/history_user_provider.dart';
import 'package:tugasbesar_2172008/provider/showpocket_user_provider.dart';
import 'package:tugasbesar_2172008/provider/user_data_provider.dart';

Future<void> fetchData(BuildContext context, WidgetRef ref) async {
  String email = ref.watch(userDataProvider).value?.email ?? '';
  String password = ref.watch(userDataProvider).value?.password ?? '';
  await ref.read(userDataProvider.notifier).login(email, password);
}

Future<void> _refresh(BuildContext context, WidgetRef ref) async {
  fetchData(context, ref);
  return Future.delayed(const Duration(seconds: 2));
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 154, 0),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _refresh(context, ref),
          child: ListView(
            children: [
              Column(
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
                          NumberFormat.currency(locale: 'id').format(
                              ref.watch(userDataProvider).value?.balance ?? 0),
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
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              width: 200,
                              height: 90,
                              padding: const EdgeInsets.all(35),
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 255, 193, 0),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text('PROMO')),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              width: 200,
                              height: 90,
                              padding: const EdgeInsets.all(35),
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 255, 193, 0),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text('PROMO')),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
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
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 241, 235, 144),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            'Shortcut',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SendPage()),
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
                                      color: const Color.fromARGB(
                                          255, 255, 193, 0),
                                    ),
                                    child: const Center(
                                      child: Image(
                                        image: AssetImage(
                                            'lib/assets/images/cash.png'),
                                      ),
                                    ),
                                  ),
                                  const Text('Send',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RequestPage()),
                                );
                                await fetchData(context, ref);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 80,
                                    padding: const EdgeInsets.all(15),
                                    margin: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color.fromARGB(
                                          255, 255, 193, 0),
                                    ),
                                    child: const Center(
                                      child: Image(
                                        image: AssetImage(
                                            'lib/assets/images/request.png'),
                                      ),
                                    ),
                                  ),
                                  const Text('Request',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                String email =
                                    ref.watch(userDataProvider).value?.email ??
                                        '';
                                await ref
                                    .read(historyUserProvider.notifier)
                                    .history(email);
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HistoryPage()),
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
                                      color: const Color.fromARGB(
                                          255, 255, 193, 0),
                                    ),
                                    child: const Center(
                                      child: Image(
                                        image: AssetImage(
                                            'lib/assets/images/history.png'),
                                      ),
                                    ),
                                  ),
                                  const Text('History',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PocketPage(),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    padding: const EdgeInsets.all(15),
                                    margin: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color.fromARGB(
                                          255, 255, 193, 0),
                                    ),
                                    child: const Center(
                                      child: Image(
                                        image: AssetImage(
                                            'lib/assets/images/add.png'),
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Add Pocket',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 241, 235, 144),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            'Your Pocket',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        FutureBuilder<List<Pocket?>>(
                          future: fetchPocketData(
                              ref.watch(userDataProvider).value?.email ?? '',
                              context,
                              ref),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (!snapshot.hasData ||
                                snapshot.data == null ||
                                snapshot.data!.isEmpty) {
                              return Text('No pockets available');
                            } else {
                              List<Pocket?> pocketList = snapshot.data!;
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (Pocket? pocket in pocketList)
                                      GestureDetector(
                                        onTap: () async {
                                          await ref
                                              .read(getPocketUserProvider
                                                  .notifier)
                                              .getpocket(pocket!.id);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const PocketDetailPage(),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 80,
                                              width: 80,
                                              padding: const EdgeInsets.all(15),
                                              margin: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: const Color.fromARGB(
                                                    255, 255, 193, 0),
                                              ),
                                              child: const Center(
                                                child: Image(
                                                  image: AssetImage(
                                                      'lib/assets/images/money.png'),
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              pocket?.title ?? '',
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 255, 154, 0),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'QRIS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditProfilePage(),
              ),
            );
          }
        },
      ),
    );
  }
}

Future<List<Pocket?>> fetchPocketData(
    String email, BuildContext context, WidgetRef ref) async {
  return await ref.read(showPocketUserProvider.notifier).showPocket(email);
}
