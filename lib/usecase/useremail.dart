import 'package:tugasbesar_2172008/data/repositories/user_repository.dart';
import 'package:tugasbesar_2172008/entities/person.dart';
import 'package:tugasbesar_2172008/usecase/useremail_param.dart';

import 'usecase.dart';

class UserEmail implements Usecase<Person?, UserEmailParam> {
  final UserRepository userRepository;

  UserEmail({required this.userRepository});

  @override
  Future<Person?> call(UserEmailParam params) async {
    // autentikasi menggunakan params.email & params.password
    return await userRepository.getUserByEmail(params.email);
  }
}
