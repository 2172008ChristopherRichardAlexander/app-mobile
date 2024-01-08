import 'package:tugasbesar_2172008/data/repositories/user_repository.dart';
import 'package:tugasbesar_2172008/entities/history.dart';
import 'package:tugasbesar_2172008/usecase/history_param.dart';
import 'usecase.dart';

class HistoryRecord implements Usecase<History?, HistoryParam> {
  final UserRepository userRepository;

  HistoryRecord({required this.userRepository});

  @override
  Future<History?> call(HistoryParam params) async {
    // autentikasi menggunakan params.email & params.password
     return await userRepository.showHistory(params.email);
  }
}
