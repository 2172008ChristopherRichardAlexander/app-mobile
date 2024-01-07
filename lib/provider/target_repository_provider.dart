import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tugasbesar_2172008/data/repositories/target_repository.dart';
import 'package:tugasbesar_2172008/data/supabase/supabase_target_repository.dart';
import 'package:tugasbesar_2172008/provider/target_user_provider.dart';

part 'target_repository_provider.g.dart';

final TargetUser target=TargetUser();
@riverpod
TargetRepository targetRepository(TargetRepositoryRef ref) =>
    SupabaseTargetRepository(username: target, name: target, password: target);
