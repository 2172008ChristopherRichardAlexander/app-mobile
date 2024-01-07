
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/provider/user_repository_provider.dart';
import 'package:tugasbesar_2172008/usecase/transfer.dart';

part 'transfer_provider.g.dart';

@riverpod
Transfer transfer( TransferRef ref) =>
    Transfer(userRepository: ref.read(userRepositoryProvider));
