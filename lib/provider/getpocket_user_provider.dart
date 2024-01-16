import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/entities/pocket.dart';
import 'package:tugasbesar_2172008/provider/getpocket_provider.dart';
import 'package:tugasbesar_2172008/usecase/getpocket.dart';
import 'package:tugasbesar_2172008/usecase/getpocket_param.dart';


part 'getpocket_user_provider.g.dart';

@Riverpod(keepAlive: true)
class GetPocketUser extends _$GetPocketUser {
  @override
  Future<Pocket?> build() async => null;


  Future<void> getpocket(int id) async {
    state = const AsyncLoading();
    GetPocket showpocket = ref.read(getpocketProvider);

    var pocket = await showpocket(GetPocketParam(id: id));
    state = AsyncData(pocket);
   
    
  }
}
