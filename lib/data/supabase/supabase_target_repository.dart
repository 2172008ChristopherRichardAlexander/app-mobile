import 'package:tugasbesar_2172008/data/repositories/target_repository.dart';
import 'package:tugasbesar_2172008/entities/person.dart';
import 'package:tugasbesar_2172008/provider/target_user_provider.dart';

import 'package:supabase/supabase.dart' as data;

class SupabaseTargetRepository implements TargetRepository {
  final TargetUser username;
  final TargetUser name;
  final TargetUser password;
  SupabaseTargetRepository(
      {required this.username, required this.name, required this.password});
 final supabase = data.SupabaseClient(
        'https://tpjniryfelhtqnjuiexl.supabase.co/',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwam5pcnlmZWxodHFuanVpZXhsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA1MzU0MzUsImV4cCI6MjAxNjExMTQzNX0.b2p-2n1ajX4qeQFAS0g21XOeJyyKBr95ZL7aM307BVU');
  @override
  Future<Person?> getUserByEmail(String email) async {
    await Future.delayed(const Duration(seconds: 2));
   
    final response =
        await supabase.from('person').select('*').eq('email', email);

        final emails = response[0]['email'] as String;
        final passwords = response[0]['password'] as String;
        final name = response[0]['name'] as String;
        final address = response[0]['address'] as String;
        final phone = response[0]['phone'] as String;
        final balance = response[0]['balance'] as int;
        return Person(name: name, email: emails, password: passwords,address: address, phone: phone, balance: balance);
      }

  }

