import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tugasbesar_2172008/entities/history.dart';
import 'package:tugasbesar_2172008/provider/history_user_provider.dart';
import 'package:tugasbesar_2172008/provider/user_data_provider.dart';

class HistoryPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String email = ref.watch(userDataProvider).value?.email ?? '';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('History Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<List<History?>>(
            future: fetchHistoryData(email, context, ref),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data == null) {
                return Center(child: Text('No data available'));
              } else {
                List<History?> historyList = snapshot.data!;
                if (historyList.isEmpty) {
                  return Center(child: Text('No data available'));
                }
                return Container(
                 
                  width: 4000,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Amount')),
                      DataColumn(label: Text('Description')),
                    ],
                    headingRowColor:
                        MaterialStateColor.resolveWith((states) => Colors.orange),
                    dataRowColor:
                        MaterialStateColor.resolveWith((states) => Colors.grey[200]!),
                    headingTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    dataTextStyle: TextStyle(color: Colors.black),
                    rows: List.generate(
                      historyList.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(
                            Text(
                              historyList[index]?.amount?.toString() ?? '',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataCell(
                            Text(
                              historyList[index]?.description ?? '',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  // Replace this with your logic to fetch history data
  Future<List<History?>> fetchHistoryData(
      String email, BuildContext context, WidgetRef ref) async {
    return await ref.read(historyUserProvider.notifier).history(email);
  }
}
