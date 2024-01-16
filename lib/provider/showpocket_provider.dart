
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/provider/usershowpocket_provider.dart';
import 'package:tugasbesar_2172008/usecase/showpocket.dart';

part 'showpocket_provider.g.dart';

@riverpod
ShowPocket showpocket(ShowpocketRef ref) =>
    ShowPocket(pocketRepository : ref.read(userShowPocketRepositoryProvider));
