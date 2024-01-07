import 'package:tugasbesar_2172008/data/repositories/user_repository.dart';
import 'package:tugasbesar_2172008/usecase/money_param.dart';
import 'package:tugasbesar_2172008/usecase/usecase.dart';

class Money implements Usecase<void, MoneyParam> {
  final UserRepository userRepository;

  Money({required this.userRepository});

  @override
  Future<void> call(MoneyParam params) async {
    // autentikasi menggunakan params.email & params.password
     await userRepository.updateMoney(params.money, params.email);
  }
}
