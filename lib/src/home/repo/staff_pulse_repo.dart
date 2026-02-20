import 'package:either_dart/either.dart';
import '../../../../data/remote/network_base_services.dart';
import '../../../../data/remote/network_services.dart';
import '../../../../res/constants/app_constants.dart';
import '../model/staff_attendance_response.dart';
import '../model/staff_payslip_response.dart';
import '../model/staff_request_response.dart';

abstract class StaffPulseRepo {
  Future<Either<ResponseError, StaffAttendanceResponse>> getAttendance({
    required String date,
  });

  Future<Either<ResponseError, List<StaffPayslipResponse>>> getMyPayslips({
    required int month,
    required int year,
  });

  Future<Either<ResponseError, List<StaffRequestResponse>>> getMyRequests({
    int page = 1,
    int limit = 10,
    String? status,
  });
}

class StaffPulseRepoImpl extends StaffPulseRepo {
  final NetworkServices services; // Kept original type NetworkServices

  StaffPulseRepoImpl(this.services);

  @override
  Future<Either<ResponseError, StaffAttendanceResponse>> getAttendance({
    required String date,
  }) {
    final Map<String, dynamic> queryParameters = {'date': date};

    return services
        .safe(
          services.getRequest(
            endPoint: AppConstants.attendance, // Kept original endPoint
            queryParameters: queryParameters,
          ),
        )
        .thenRight(services.checkHttpStatus)
        .thenRight(services.parseJson)
        .mapRight(
          (right) => StaffAttendanceResponse.fromJson(right),
        ); // Kept original mapRight
  }

  @override
  Future<Either<ResponseError, List<StaffPayslipResponse>>> getMyPayslips({
    required int month,
    required int year,
  }) {
    final Map<String, dynamic> queryParameters = {'month': month, 'year': year};

    return services
        .safe(
          services.getRequest(
            endPoint: "${AppConstants.prefix}/payroll/my-payslips",
            queryParameters: queryParameters,
          ),
        )
        .thenRight(services.checkHttpStatus)
        .thenRight(services.parseJson)
        .mapRight((right) {
          if (right is List) {
            return right
                .map((item) => StaffPayslipResponse.fromJson(item))
                .toList();
          }
          return [];
        });
  }

  @override
  Future<Either<ResponseError, List<StaffRequestResponse>>> getMyRequests({
    int page = 1,
    int limit = 10,
    String? status,
  }) {
    final Map<String, dynamic> queryParameters = {'page': page, 'limit': limit};

    if (status != null) {
      queryParameters['status'] = status;
    }

    return services
        .safe(
          services.getRequest(
            endPoint: "${AppConstants.prefix}/requests/my-requests",
            queryParameters: queryParameters,
          ),
        )
        .thenRight(services.checkHttpStatus)
        .thenRight(services.parseJson)
        .mapRight((right) {
          if (right['data'] is List) {
            return (right['data'] as List)
                .map((item) => StaffRequestResponse.fromJson(item))
                .toList();
          }
          return [];
        });
  }
}
