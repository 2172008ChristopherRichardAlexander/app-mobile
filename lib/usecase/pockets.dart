import 'package:tugasbesar_2172008/data/repositories/user_repository.dart';
import 'package:tugasbesar_2172008/usecase/pockets_param.dart';
import 'package:tugasbesar_2172008/usecase/usecase.dart';

class Pockets implements Usecase<void, PocketsParam> {
  final UserRepository userRepository;

  Pockets({required this.userRepository});

  @override
  Future<void> call(PocketsParam params) async {
    // autentikasi menggunakan params.email & params.password
     await userRepository.addPocket( params.balance,params.email,params.title);
  }
}
