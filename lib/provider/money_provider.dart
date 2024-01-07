
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/provider/user_repository_provider.dart';
import 'package:tugasbesar_2172008/usecase/money.dart';

part 'money_provider.g.dart';

@riverpod
Money money(MoneyRef ref) =>
    Money(userRepository: ref.read(userRepositoryProvider));
