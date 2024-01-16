  import 'package:tugasbesar_2172008/entities/history.dart';
 abstract interface class HistoryRepository {

  Future<List<History?>> showHistory(String emailUser);
 }