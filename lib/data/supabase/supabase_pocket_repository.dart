import 'package:supabase/supabase.dart' as data;
import 'package:tugasbesar_2172008/data/repositories/pocket_repository.dart';
import 'package:tugasbesar_2172008/entities/pocket.dart';

import 'package:tugasbesar_2172008/provider/showpocket_user_provider.dart';

class SupabasePocketRepository implements PocketRepository {
  final ShowPocketUser username;
  final ShowPocketUser name;
  final ShowPocketUser password;
  SupabasePocketRepository(
      {required this.username, required this.name, required this.password});
  final supabase = data.SupabaseClient(
      'https://tpjniryfelhtqnjuiexl.supabase.co/',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwam5pcnlmZWxodHFuanVpZXhsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA1MzU0MzUsImV4cCI6MjAxNjExMTQzNX0.b2p-2n1ajX4qeQFAS0g21XOeJyyKBr95ZL7aM307BVU');
  @override
  Future<List<Pocket>> showPocket(String emailUser) async {
    await Future.delayed(const Duration(seconds: 2));

    final response =
        await supabase.from('pocket').select('*').eq('email', emailUser);

    List<Pocket> pocketList = [];

    for (var entry in response) {
      final id = entry['id'];
      final email = entry['email'] as String;
      final balance = entry['balance'] as int;
      final title = entry['title'] as String;

      final pocketEntry = Pocket(id:id, email: email, title: title, balance: balance);
      pocketList.add(pocketEntry);
    }

    return pocketList;
  }

  @override
  Future<Pocket?> getPocket(int idUser) async {
  await Future.delayed(const Duration(seconds: 2));

  final response = await supabase.from('pocket').select('*').eq('id', idUser);

  if (response != null && response.isNotEmpty) {
    final Map<String, dynamic> pocketData = response[0];
    
    final int id = pocketData['id'] is int
        ? pocketData['id']
        : int.tryParse(pocketData['id'].toString()) ?? 0;

    final String email = pocketData['email'] as String;
    
    final int balance = pocketData['balance'] is int
        ? pocketData['balance']
        : int.tryParse(pocketData['balance'].toString()) ?? 0;

    final String title = pocketData['title'] as String;

    return Pocket(id: id, email: email, balance: balance, title: title);
  }

  return null;
}
}
