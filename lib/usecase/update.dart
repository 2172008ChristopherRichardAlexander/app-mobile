import 'package:tugasbesar_2172008/data/repositories/user_repository.dart';
import 'package:tugasbesar_2172008/usecase/transfer_param.dart';
import 'package:tugasbesar_2172008/usecase/update_param.dart';

import 'usecase.dart';

class Update implements Usecase<void, UpdateParam> {
  final UserRepository userRepository;

  Update({required this.userRepository});

  @override
  Future<void> call(UpdateParam params) async {
    // autentikasi menggunakan params.email & params.password
    await userRepository.editUser(params.email,params.name,params.address,params.phone);
  }
}
