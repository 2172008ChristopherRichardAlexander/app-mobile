import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'user_data_provider.dart';
import '../../data/repositories/user_repository.dart';
import '../../data/supabase/supabase_user_repository.dart';

part 'user_repository_provider.g.dart';

final UserData user=UserData();

@riverpod
UserRepository userRepository(UserRepositoryRef ref) =>
    SupabaseUserRepository(username: user, name: user, password: user);
