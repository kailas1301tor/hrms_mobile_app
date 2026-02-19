import 'package:either_dart/either.dart';
import 'package:hrms_mobile/data/remote/network_base_services.dart';
import 'package:hrms_mobile/data/remote/network_services.dart';
import 'package:hrms_mobile/res/constants/app_constants.dart';
import '../model/admin_attendance_response.dart';

abstract class AttendanceRepo {
  Future<Either<ResponseError, AdminAttendanceResponse>> getAttendance({
    required String date,
    required int page,
    required int limit,
    String? status,
    String? branch,
  });
}

class AttendanceRepoImpl extends AttendanceRepo {
  final NetworkServices services;

  AttendanceRepoImpl(this.services);

  @override
  Future<Either<ResponseError, AdminAttendanceResponse>> getAttendance({
    required String date,
    required int page,
    required int limit,
    String? status,
    String? branch,
  }) {
    final Map<String, dynamic> queryParameters = {
      'date': date,
      'page': page,
      'limit': limit,
    };

    if (status != null && status != 'ALL') {
      queryParameters['status'] = status;
    }

    // Branch handling might need adjustment depending on how backend expects it
    if (branch != null && branch != 'All Branches (UAE)') {
      queryParameters['branch'] = branch;
    }

    return services
        .safe(
          services.getRequest(
            endPoint: AppConstants.attendance,
            queryParameters: queryParameters,
          ),
        )
        .thenRight(services.checkHttpStatus)
        .thenRight(services.parseJson)
        .mapRight((right) => AdminAttendanceResponse.fromJson(right));
  }
}
