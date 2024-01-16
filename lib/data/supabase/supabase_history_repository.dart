import 'package:tugasbesar_2172008/data/repositories/history_repository.dart';
import 'package:supabase/supabase.dart' as data;
import 'package:tugasbesar_2172008/provider/history_user_provider.dart';

import '../../entities/history.dart';

class SupabaseHistoryRepository implements HistoryRepository {
  final HistoryUser username;
  final HistoryUser name;
  final HistoryUser password;
  SupabaseHistoryRepository(
      {required this.username, required this.name, required this.password});
  final supabase = data.SupabaseClient(
      'https://tpjniryfelhtqnjuiexl.supabase.co/',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwam5pcnlmZWxodHFuanVpZXhsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA1MzU0MzUsImV4cCI6MjAxNjExMTQzNX0.b2p-2n1ajX4qeQFAS0g21XOeJyyKBr95ZL7aM307BVU');
  @override
  Future<List<History>> showHistory(String emailUser) async {
    await Future.delayed(const Duration(seconds: 2));

    final response =
        await supabase.from('history').select('*').eq('email', emailUser);

    List<History> historyList = [];

    for (var entry in response) {
      final email = entry['email'] as String;
      final amount = entry['amount'] as int;
      final description = entry['description'] as String;

      final historyEntry =
          History(email: email, description: description, amount: amount);
      historyList.add(historyEntry);
    }

    return historyList;
  }
}
