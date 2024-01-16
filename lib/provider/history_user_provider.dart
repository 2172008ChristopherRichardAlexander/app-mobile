import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/entities/history.dart';
import 'package:tugasbesar_2172008/provider/history_provider.dart';
import 'package:tugasbesar_2172008/usecase/history.dart';
import 'package:tugasbesar_2172008/usecase/history_param.dart';

part 'history_user_provider.g.dart';

@Riverpod(keepAlive: true)
class HistoryUser extends _$HistoryUser {
  @override
  Future<List<History?>> build() async {
    return []; 
  }

  Future<List<History?>> history(String emails) async {
    HistoryRecord history = ref.read(historyProvider);
    List<History?> listHistory = await history(HistoryParam(email: emails));
    state = AsyncData(listHistory);
    return listHistory;
  }
}
