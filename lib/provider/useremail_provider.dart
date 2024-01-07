
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/provider/user_repository_provider.dart';
import 'package:tugasbesar_2172008/usecase/useremail.dart';

part 'useremail_provider.g.dart';

@riverpod
UserEmail useremail(UseremailRef ref) =>
    UserEmail(userRepository: ref.read(userRepositoryProvider));
