import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/remote/network_services.dart';
import '../src/admin/requests/repo/admin_requests_repo.dart';
import '../src/admin/attendance/repo/attendance_repo.dart';
import '../src/admin/summary/repo/summary_repo.dart';
import '../src/login/repo/login_repo.dart';

part 'repo_di.g.dart';

@Riverpod(keepAlive: false)
LoginRepo loginRepository(Ref ref) {
  final networkServices = ref.read(networkServicesProvider);
  return LoginRepoImpl(networkServices);
}

@Riverpod(keepAlive: false)
AdminRequestsRepo adminRequestsRepository(Ref ref) {
  final networkServices = ref.read(networkServicesProvider);
  return AdminRequestsRepoImpl(networkServices);
}

@Riverpod(keepAlive: false)
SummaryRepo summaryRepository(Ref ref) {
  final networkServices = ref.read(networkServicesProvider);
  return SummaryRepoImpl(networkServices);
}

@Riverpod(keepAlive: false)
AttendanceRepo attendanceRepository(Ref ref) {
  final networkServices = ref.read(networkServicesProvider);
  return AttendanceRepoImpl(networkServices);
}
