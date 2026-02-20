import 'package:either_dart/either.dart';
import 'package:hrms_mobile/data/remote/network_base_services.dart';
import 'package:hrms_mobile/data/remote/network_services.dart';
import 'package:hrms_mobile/res/constants/app_constants.dart';
import 'package:hrms_mobile/src/hr/requests/model/leave_pending_response.dart';
import 'package:hrms_mobile/src/hr/requests/model/loan_pending_response.dart';
import 'package:hrms_mobile/src/hr/requests/model/salary_advance_pending_response.dart';
import 'package:hrms_mobile/src/hr/requests/model/submit_action_response.dart';

abstract class HrRequestsRepo {
  Future<Either<ResponseError, LeavePendingResponse>> getPendingLeave({
    int page = 1,
    int limit = 20,
  });

  Future<Either<ResponseError, SalaryAdvancePendingResponse>>
  getPendingSalaryAdvance({int page = 1, int limit = 20});

  Future<Either<ResponseError, LoanPendingResponse>> getPendingLoans({
    int page = 1,
    int limit = 20,
  });

  Future<Either<ResponseError, SubmitActionResponse>> submitAction(
    String requestId,
    Map<String, dynamic> body,
  );
}

class HrRequestsRepoImpl implements HrRequestsRepo {
  final NetworkServices services;

  HrRequestsRepoImpl(this.services);

  @override
  Future<Either<ResponseError, LeavePendingResponse>> getPendingLeave({
    int page = 1,
    int limit = 20,
  }) {
    final queryParams = <String, dynamic>{
      'type': 'LEAVE',
      'status': 'PENDING',
      'page': page,
      'limit': limit,
    };
    return services
        .safe(
          services.getRequest(
            endPoint: AppConstants.adminRequestsPending,
            queryParameters: queryParams,
          ),
        )
        .thenRight(services.checkHttpStatus)
        .thenRight(services.parseJson)
        .mapRight((right) => LeavePendingResponse.fromJson(right));
  }

  @override
  Future<Either<ResponseError, SalaryAdvancePendingResponse>>
  getPendingSalaryAdvance({int page = 1, int limit = 20}) {
    final queryParams = <String, dynamic>{
      'type': 'SALARY',
      'subType': 'salary_advance',
      'status': 'PENDING',
      'page': page,
      'limit': limit,
    };
    return services
        .safe(
          services.getRequest(
            endPoint: AppConstants.adminRequestsPending,
            queryParameters: queryParams,
          ),
        )
        .thenRight(services.checkHttpStatus)
        .thenRight(services.parseJson)
        .mapRight((right) => SalaryAdvancePendingResponse.fromJson(right));
  }

  @override
  Future<Either<ResponseError, LoanPendingResponse>> getPendingLoans({
    int page = 1,
    int limit = 20,
  }) {
    final queryParams = <String, dynamic>{
      'type': 'SALARY',
      'subType': 'loan',
      'status': 'PENDING',
      'page': page,
      'limit': limit,
    };
    return services
        .safe(
          services.getRequest(
            endPoint: AppConstants.adminRequestsPending,
            queryParameters: queryParams,
          ),
        )
        .thenRight(services.checkHttpStatus)
        .thenRight(services.parseJson)
        .mapRight((right) => LoanPendingResponse.fromJson(right));
  }

  @override
  Future<Either<ResponseError, SubmitActionResponse>> submitAction(
    String requestId,
    Map<String, dynamic> body,
  ) {
    final endPoint = '${AppConstants.adminRequestAction}/$requestId/action';
    return services
        .safe(services.putRequest(endPoint: endPoint, parameters: body))
        .thenRight(services.checkHttpStatus)
        .thenRight(services.parseJson)
        .mapRight((right) => SubmitActionResponse.fromJson(right));
  }
}
