  import 'package:tugasbesar_2172008/entities/pocket.dart';
 abstract interface class PocketRepository {

  Future<List<Pocket?>> showPocket(String emailUser);
  Future<Pocket?> getPocket(int id);
 }