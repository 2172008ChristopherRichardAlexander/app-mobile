import 'package:tugasbesar_2172008/data/repositories/user_repository.dart';
import 'package:tugasbesar_2172008/entities/person.dart';
import 'login_param.dart';
import 'usecase.dart';

class Login implements Usecase<Person?, LoginParam> {
  final UserRepository userRepository;

  Login({required this.userRepository});

  @override
  Future<Person?> call(LoginParam params) async {
    // autentikasi menggunakan params.email & params.password
    return await userRepository.getUser(params.email, params.password);
  }
}
