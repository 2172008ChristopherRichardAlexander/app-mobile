
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/provider/userhistory_provider.dart';
import 'package:tugasbesar_2172008/usecase/history.dart';

part 'history_provider.g.dart';

@riverpod
HistoryRecord history(HistoryRef ref) =>
    HistoryRecord(historyRepository: ref.read(historyrepositoryProvider));
