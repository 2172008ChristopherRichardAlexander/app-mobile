import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/entities/person.dart';
import 'package:tugasbesar_2172008/provider/useremail_provider.dart';
import 'package:tugasbesar_2172008/usecase/useremail.dart';
import 'package:tugasbesar_2172008/usecase/useremail_param.dart';

part 'target_user_provider.g.dart';

@Riverpod(keepAlive: true)
class TargetUser extends _$TargetUser {
  @override
  Future<Person?> build() async => null;

  Future<void> useremail(String emails) async {
    state = const AsyncLoading();

    UserEmail useremail = ref.read(useremailProvider);

    var user = await useremail(UserEmailParam(email: emails));
    state = AsyncData(user);
  }
}
