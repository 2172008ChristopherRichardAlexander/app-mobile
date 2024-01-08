
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/provider/user_repository_provider.dart';
import 'package:tugasbesar_2172008/usecase/history.dart';

part 'history_provider.g.dart';

@riverpod
HistoryRecord history(HistoryRef ref) =>
    HistoryRecord(userRepository: ref.read(userRepositoryProvider));
