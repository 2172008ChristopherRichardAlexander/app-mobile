import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/data/repositories/history_repository.dart';
import 'package:tugasbesar_2172008/data/supabase/supabase_history_repository.dart';
import 'package:tugasbesar_2172008/provider/history_user_provider.dart';

part 'userhistory_provider.g.dart';

final HistoryUser history = HistoryUser();
@riverpod
HistoryRepository historyrepository(HistoryrepositoryRef ref) =>
    SupabaseHistoryRepository(username: history, name: history, password: history);
