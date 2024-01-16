import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/entities/pocket.dart';
import 'package:tugasbesar_2172008/provider/getpocket_provider.dart';
import 'package:tugasbesar_2172008/provider/showpocket_provider.dart';
import 'package:tugasbesar_2172008/usecase/getpocket.dart';
import 'package:tugasbesar_2172008/usecase/getpocket_param.dart';
import 'package:tugasbesar_2172008/usecase/showpocket.dart';
import 'package:tugasbesar_2172008/usecase/showpocket_param.dart';

part 'showpocket_user_provider.g.dart';

@Riverpod(keepAlive: true)
class ShowPocketUser extends _$ShowPocketUser {
  @override
  Future<List<Pocket?>> build() async {
    return [];
  }

  Future<List<Pocket?>> showPocket(String emails) async {
    ShowPocket showpocket = ref.read(showpocketProvider);
    List<Pocket?> listPocket =
        await showpocket(ShowPocketsParam(email: emails));
    state = AsyncData(listPocket);
    return listPocket;
  }
}
