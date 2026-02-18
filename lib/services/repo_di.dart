import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/remote/network_services.dart';
import '../src/login/repo/login_repo.dart';

part 'repo_di.g.dart';

@Riverpod(keepAlive: false)
LoginRepo loginRepository(Ref ref) {
  final networkServices = ref.read(networkServicesProvider);
  return LoginRepoImpl(networkServices);
}
