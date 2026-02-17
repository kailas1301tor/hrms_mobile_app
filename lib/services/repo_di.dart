import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../src/home/repo/home_repo.dart';
import '../data/remote/network_services.dart';

part 'repo_di.g.dart';

@Riverpod(keepAlive: false)
HomeRepo homeRepository(Ref ref) {
  final networkServices = ref.read(networkServicesProvider);
  return HomeRepoImpl(networkServices);
}
