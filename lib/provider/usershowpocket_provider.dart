import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/data/repositories/pocket_repository.dart';
import 'package:tugasbesar_2172008/data/supabase/supabase_pocket_repository.dart';
import 'package:tugasbesar_2172008/provider/showpocket_user_provider.dart';

part 'usershowpocket_provider.g.dart';

final ShowPocketUser showPocket = ShowPocketUser();
@riverpod
PocketRepository userShowPocketRepository(UserShowPocketRepositoryRef ref) =>
    SupabasePocketRepository(username: showPocket, name: showPocket, password: showPocket);
