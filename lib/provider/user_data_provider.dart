import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/entities/person.dart';
import 'package:tugasbesar_2172008/provider/money_provider.dart';
import 'package:tugasbesar_2172008/provider/pockets_provider.dart';
import 'package:tugasbesar_2172008/provider/singup_provider.dart';
import 'package:tugasbesar_2172008/provider/transfer_provider.dart';
import 'package:tugasbesar_2172008/usecase/login.dart';
import 'package:tugasbesar_2172008/usecase/login_param.dart';
import 'package:tugasbesar_2172008/usecase/money.dart';
import 'package:tugasbesar_2172008/usecase/money_param.dart';
import 'package:tugasbesar_2172008/usecase/pockets.dart';
import 'package:tugasbesar_2172008/usecase/pockets_param.dart';
import 'package:tugasbesar_2172008/usecase/signup.dart';
import 'package:tugasbesar_2172008/usecase/signup_param.dart';
import 'package:tugasbesar_2172008/usecase/transfer.dart';
import 'package:tugasbesar_2172008/usecase/transfer_param.dart';
import 'login_provider.dart';
part 'user_data_provider.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  Future<Person?> build() async => null;
  Future<void> login(String emails, String passwords) async {
    state = const AsyncLoading();

    Login login = ref.read(loginProvider);

    var user = await login(LoginParam(email: emails, password: passwords));
    state = AsyncData(user);
  }


  Future<void> signup(String emails, String passwords, String text) async {
    state = const AsyncLoading();

    SignUp signUp = ref.read(signupProvider);

    await signUp(SingupParam(email: emails, password: passwords, name: text));

    
  }

  Future<void> money(
    int moneys,
    String emails,
  ) async {
    Money money = ref.read(moneyProvider);

    await money(MoneyParam(money: moneys, email: emails));
  }

  Future<void> transfer(
    String emailUsers,
    String emailTargets,
    int moneyUsers,
    int moneyTargets,
    int amounts,
  ) async {
    Transfer transfer = ref.read(transferProvider);

    await transfer(TransferParam(
        emailUser: emailUsers,
        emailTarget: emailTargets,
        moneyUser: moneyUsers,
        moneyTarget: moneyTargets,
        amount: amounts));
  }
  


  Future<void> pockets(String emails,int balance, String title) async {
    state = const AsyncLoading();

    Pockets pocket = ref.read(pocketsProvider);

    await pocket(
        PocketsParam(email: emails, balance: balance, title: title));

    
  }


  Future<void> logout() async {
    // Panggil usecase logout

    state = const AsyncData(null);
  }
}
