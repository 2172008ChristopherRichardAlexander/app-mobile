import 'package:tugasbesar_2172008/data/repositories/pocket_repository.dart';
import 'package:tugasbesar_2172008/entities/pocket.dart';
import 'package:tugasbesar_2172008/usecase/showpocket_param.dart';
import 'usecase.dart';

class ShowPocket implements Usecase<List<Pocket?>, ShowPocketsParam> {
  final PocketRepository pocketRepository;

  ShowPocket({required this.pocketRepository});

  @override
  Future<List<Pocket?>> call(ShowPocketsParam params) async {
    // autentikasi menggunakan params.email & params.password
     return await pocketRepository.showPocket(params.email);
  }
}
