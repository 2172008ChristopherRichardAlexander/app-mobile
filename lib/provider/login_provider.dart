
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/provider/user_repository_provider.dart';
import 'package:tugasbesar_2172008/usecase/login.dart';

part 'login_provider.g.dart';

@riverpod
Login login(LoginRef ref) =>
    Login(userRepository: ref.read(userRepositoryProvider));
