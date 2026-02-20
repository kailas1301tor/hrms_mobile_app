import 'package:either_dart/either.dart';
import 'package:hrms_mobile/data/remote/network_base_services.dart';
import 'package:hrms_mobile/data/remote/network_services.dart';
import 'package:hrms_mobile/res/constants/app_constants.dart';
import 'package:hrms_mobile/src/admin/requests/model/submit_action_response.dart';
import 'package:hrms_mobile/src/track/model/advance_my_requests_response.dart';
import 'package:hrms_mobile/src/track/model/leave_my_requests_response.dart';
import 'package:hrms_mobile/src/track/model/leave_type_response.dart';
import 'package:hrms_mobile/src/track/model/loan_my_requests_response.dart';
import 'package:hrms_mobile/utils/helpers/type_converters.dart';

abstract class TrackRepo {
  Future<Either<ResponseError, LeaveTypeResponse>> getLeaveTypes();

  Future<Either<ResponseError, LeaveMyRequestsResponse>> getMyLeaveRequests({
    int page = 1,
    int limit = 10,
  });

  Future<Either<ResponseError, AdvanceMyRequestsResponse>>
      getMyAdvanceRequests({
    int page = 1,
    int limit = 10,
  });

  Future<Either<ResponseError, LoanMyRequestsResponse>> getMyLoanRequests({
    int page = 1,
    int limit = 10,
  });

  Future<Either<ResponseError, SubmitActionResponse>> createRequest(
    Map<String, dynamic> body,
  );
}

class TrackRepoImpl implements TrackRepo {
  final NetworkServices services;

  TrackRepoImpl(this.services);

  @override
  Future<Either<ResponseError, LeaveTypeResponse>> getLeaveTypes() {
    return services
        .safe(services.getRequest(endPoint: AppConstants.leaveTypes))
        .thenRight(services.checkHttpStatus)
        .thenRight(services.parseJson)
        .mapRight((json) {
      if (json is List) {
        return LeaveTypeResponse.fromJsonArray(json);
      }
      return LeaveTypeResponse.fromJson(convertToMap(json));
    });
  }

  @override
  Future<Either<ResponseError, SubmitActionResponse>> createRequest(
    Map<String, dynamic> body,
  ) {
    return services
        .safe(services.postRequest(
          endPoint: AppConstants.createRequest,
          parameters: body,
        ))
        .thenRight(services.checkHttpStatus)
        .thenRight(services.parseJson)
        .mapRight(
            (json) => SubmitActionResponse.fromJson(convertToMap(json)));
  }

  @override
  Future<Either<ResponseError, LeaveMyRequestsResponse>> getMyLeaveRequests({
    int page = 1,
    int limit = 10,
  }) {
    final queryParams = <String, dynamic>{
      'status': 'PENDING',
      'type': 'LEAVE',
      'page': page,
      'limit': limit,
    };
    return services
        .safe(services.getRequest(
          endPoint: AppConstants.myRequests,
          queryParameters: queryParams,
        ))
        .thenRight(services.checkHttpStatus)
        .thenRight(services.parseJson)
        .mapRight(
            (json) => LeaveMyRequestsResponse.fromJson(convertToMap(json)));
  }

  @override
  Future<Either<ResponseError, AdvanceMyRequestsResponse>>
      getMyAdvanceRequests({
    int page = 1,
    int limit = 10,
  }) {
    final queryParams = <String, dynamic>{
      'status': 'PENDING',
      'type': 'SALARY',
      'subType': 'salary_advance',
      'page': page,
      'limit': limit,
    };
    return services
        .safe(services.getRequest(
          endPoint: AppConstants.myRequests,
          queryParameters: queryParams,
        ))
        .thenRight(services.checkHttpStatus)
        .thenRight(services.parseJson)
        .mapRight(
            (json) => AdvanceMyRequestsResponse.fromJson(convertToMap(json)));
  }

  @override
  Future<Either<ResponseError, LoanMyRequestsResponse>> getMyLoanRequests({
    int page = 1,
    int limit = 10,
  }) {
    final queryParams = <String, dynamic>{
      'status': 'PENDING',
      'type': 'SALARY',
      'subType': 'loan',
      'page': page,
      'limit': limit,
    };
    return services
        .safe(services.getRequest(
          endPoint: AppConstants.myRequests,
          queryParameters: queryParams,
        ))
        .thenRight(services.checkHttpStatus)
        .thenRight(services.parseJson)
        .mapRight(
            (json) => LoanMyRequestsResponse.fromJson(convertToMap(json)));
  }
}
