
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/provider/user_repository_provider.dart';
import 'package:tugasbesar_2172008/usecase/signup.dart';
part 'singup_provider.g.dart';
@riverpod
SignUp signup(SignupRef ref) =>
    SignUp(userRepository: ref.read(userRepositoryProvider));
