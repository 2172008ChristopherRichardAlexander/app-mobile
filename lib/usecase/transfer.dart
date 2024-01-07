import 'package:tugasbesar_2172008/data/repositories/user_repository.dart';
import 'package:tugasbesar_2172008/usecase/transfer_param.dart';

import 'usecase.dart';

class Transfer implements Usecase<void, TransferParam> {
  final UserRepository userRepository;

  Transfer({required this.userRepository});

  @override
  Future<void> call(TransferParam params) async {
    // autentikasi menggunakan params.email & params.password
    await userRepository.transfer( params.emailUser, params.emailTarget, params.moneyUser, params.moneyTarget, params.amount);
  }
}
