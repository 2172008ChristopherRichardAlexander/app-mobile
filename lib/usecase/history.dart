import 'package:tugasbesar_2172008/data/repositories/history_repository.dart';
import 'package:tugasbesar_2172008/entities/history.dart';
import 'package:tugasbesar_2172008/usecase/history_param.dart';
import 'usecase.dart';

class HistoryRecord implements Usecase<List<History?>, HistoryParam> {
  final HistoryRepository historyRepository;

  HistoryRecord({required this.historyRepository});

  @override
  Future<List<History?>> call(HistoryParam params) async {
    // autentikasi menggunakan params.email & params.password
     return await historyRepository.showHistory(params.email);
  }
}
