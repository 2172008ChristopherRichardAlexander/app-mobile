import 'package:tugasbesar_2172008/entities/person.dart';
import 'package:tugasbesar_2172008/entities/history.dart';

abstract interface class UserRepository {
  Future<Person?> getUser(String email, String password);
  Future<void> addUser(String email, String password, String name);
  Future<void> updateMoney(int money, String email);
  Future<Person?> getUserByEmail(String email);
  Future<void> transfer(String emailUser,String emailTarget,int moneyUser,int moneyTarget, int amount);
  Future<History?> showHistory(String emailUser);
  // Future<Person> editUser(String email, String password,String name);
}
