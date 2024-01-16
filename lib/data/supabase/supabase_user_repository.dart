import 'package:tugasbesar_2172008/data/repositories/user_repository.dart';
import 'package:tugasbesar_2172008/entities/person.dart';
import 'package:tugasbesar_2172008/provider/user_data_provider.dart';
import 'package:supabase/supabase.dart' as data;
import 'package:tugasbesar_2172008/entities/history.dart';

class SupabaseUserRepository implements UserRepository {
  final UserData username;
  final UserData name;
  final UserData password;
  SupabaseUserRepository(
      {required this.username, required this.name, required this.password});
  final supabase = data.SupabaseClient(
      'https://tpjniryfelhtqnjuiexl.supabase.co/',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwam5pcnlmZWxodHFuanVpZXhsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA1MzU0MzUsImV4cCI6MjAxNjExMTQzNX0.b2p-2n1ajX4qeQFAS0g21XOeJyyKBr95ZL7aM307BVU');
  @override
  Future<Person?> getUser(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    final response =
        await supabase.from('person').select('*').eq('email', email);
    if (response.isNotEmpty) {
      final userPassword = response[0]['password'] as String;
      if (userPassword == password) {
        final emails = response[0]['email'] as String;
        final passwords = response[0]['password'] as String;
        final name = response[0]['name'] as String;
        final address = response[0]['address'] as String;
        final phone = response[0]['phone'] as String;
        final balance = response[0]['balance'] as int;
        return Person(
            name: name,
            email: emails,
            password: passwords,
            address: address,
            phone: phone,
            balance: balance);
      }
      return null;
    }
    return null;
  }

  @override
  Future<void> addUser(String email, String password, String name) async {
    await Future.delayed(const Duration(seconds: 2));
    await supabase
        .from("person")
        .insert({'email': email, 'password': password, 'name': name});

    return;
  }

  @override
  Future<void> updateMoney(int money, String email) async {
    await Future.delayed(const Duration(seconds: 2));
    await supabase.from("person").update({'balance': money}).eq('email', email);
    return;
  }

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
    return Person(
        name: name,
        email: emails,
        password: passwords,
        address: address,
        phone: phone,
        balance: balance);
  }

  @override
  Future<void> transfer(String emailUser, String emailTarget, int moneyUser,
      int moneyTarget, int amount) async {
    await Future.delayed(const Duration(seconds: 2));
    int sumMoneyUser = moneyUser - amount;
    int sumMoneyTarget = moneyTarget + amount;

    updateMoney(sumMoneyUser, emailUser);
    updateMoney(sumMoneyTarget, emailTarget);
    return;
  }

 

  @override
  Future<void> addPocket(int balance, String email, String description) async {
    await Future.delayed(const Duration(seconds: 2));
    await supabase
        .from("pocket")
        .insert({'email': email, 'balance': balance, 'title': description});

    final data = await getUserByEmail(email);

    final moneyUser = data!.balance;
    final sumOfMoney = moneyUser - balance;

    updateMoney(sumOfMoney, email);
  }
}

  // @override
  // Future<Person> editUser(String email, String password, String name) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   final supabase = data.SupabaseClient(
  //       'https://tpjniryfelhtqnjuiexl.supabase.co/',
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwam5pcnlmZWxodHFuanVpZXhsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA1MzU0MzUsImV4cCI6MjAxNjExMTQzNX0.b2p-2n1ajX4qeQFAS0g21XOeJyyKBr95ZL7aM307BVU');
  //   await supabase
  //       .from("person")
  //       .insert({'email': email, 'password': password, 'name': name});

  //   return Person(email: email, password: password, name: name);
  // }

