import 'package:tugasbesar_2172008/data/repositories/pocket_repository.dart';
import 'package:tugasbesar_2172008/entities/pocket.dart';
import 'package:tugasbesar_2172008/usecase/getpocket_param.dart';
import 'package:tugasbesar_2172008/usecase/usecase.dart';

class GetPocket implements Usecase<Pocket?, GetPocketParam> {
  final PocketRepository pocketRepository;

  GetPocket({required this.pocketRepository});

  @override
  Future<Pocket?> call(GetPocketParam params) async {
    // autentikasi menggunakan params.email & params.password
    return await pocketRepository.getPocket(params.id);
  }
}
