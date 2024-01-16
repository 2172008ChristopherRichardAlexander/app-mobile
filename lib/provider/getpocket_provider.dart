
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/provider/usershowpocket_provider.dart';
import 'package:tugasbesar_2172008/usecase/getpocket.dart';


part 'getpocket_provider.g.dart';

@riverpod
GetPocket getpocket(GetpocketRef ref) =>
    GetPocket(pocketRepository : ref.read(userShowPocketRepositoryProvider));
