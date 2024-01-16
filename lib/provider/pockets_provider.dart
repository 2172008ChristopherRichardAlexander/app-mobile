
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/provider/user_repository_provider.dart';
import 'package:tugasbesar_2172008/usecase/pockets.dart';

part 'pockets_provider.g.dart';

@riverpod
Pockets pockets(PocketsRef ref) =>
    Pockets(userRepository: ref.read(userRepositoryProvider));
