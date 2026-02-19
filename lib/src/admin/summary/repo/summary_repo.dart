import 'package:either_dart/either.dart';
import 'package:hrms_mobile/data/remote/network_base_services.dart';
import 'package:hrms_mobile/data/remote/network_services.dart';
import 'package:hrms_mobile/res/constants/app_constants.dart';
import 'package:hrms_mobile/src/admin/summary/model/pending_approvals_response.dart';
import 'package:hrms_mobile/src/admin/summary/model/summary_stats_response.dart';

abstract class SummaryRepo {
  Future<Either<ResponseError, SummaryStatsResponse>> getMobileStats();
  Future<Either<ResponseError, PendingApprovalsResponse>> getPendingApprovals();
}

class SummaryRepoImpl extends SummaryRepo {
  final NetworkServices services;

  SummaryRepoImpl(this.services);

  @override
  Future<Either<ResponseError, SummaryStatsResponse>> getMobileStats() {
    return services
        .safe(services.getRequest(endPoint: AppConstants.mobileStats))
        .thenRight(services.checkHttpStatus)
        .thenRight(services.parseJson)
        .mapRight((right) => SummaryStatsResponse.fromJson(right));
  }

  @override
  Future<Either<ResponseError, PendingApprovalsResponse>>
  getPendingApprovals() {
    return services
        .safe(services.getRequest(endPoint: AppConstants.pendingApprovals))
        .thenRight(services.checkHttpStatus)
        .thenRight(services.parseJson)
        .mapRight((right) => PendingApprovalsResponse.fromJson(right));
  }
}
