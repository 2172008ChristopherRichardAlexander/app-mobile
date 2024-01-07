import 'package:tugasbesar_2172008/entities/person.dart';

abstract interface class TargetRepository {
  Future<Person?> getUserByEmail(String email);

}
