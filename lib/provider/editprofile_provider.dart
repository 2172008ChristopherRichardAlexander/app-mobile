
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/provider/user_repository_provider.dart';
import 'package:tugasbesar_2172008/usecase/update.dart';

part 'editprofile_provider.g.dart';

@riverpod
Update updateProfile(UpdateProfileRef ref) =>
    Update(userRepository: ref.read(userRepositoryProvider));
