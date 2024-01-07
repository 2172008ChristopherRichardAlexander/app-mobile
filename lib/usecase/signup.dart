import 'package:tugasbesar_2172008/data/repositories/user_repository.dart';
import 'package:tugasbesar_2172008/usecase/signup_param.dart';

import 'usecase.dart';

class SignUp implements Usecase<void, SingupParam> {
  final UserRepository userRepository;

  SignUp({required this.userRepository});

  @override
  Future<void> call(SingupParam params) async {
    // autentikasi menggunakan params.email & params.password
    await userRepository.addUser(params.email, params.password, params.name);
  }
}
