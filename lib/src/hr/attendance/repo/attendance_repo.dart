import 'package:either_dart/either.dart';
import 'package:hrms_mobile/data/remote/network_base_services.dart';
import 'package:hrms_mobile/data/remote/network_services.dart';
import 'package:hrms_mobile/res/constants/app_constants.dart';
import '../model/hr_attendance_response.dart';

abstract class HrAttendanceRepo {
  Future<Either<ResponseError, HrAttendanceResponse>> getAttendance({
    required String date,
    required int page,
    required int limit,
    String? status,
    String? branch,
  });
}

class HrAttendanceRepoImpl extends HrAttendanceRepo {
  final NetworkServices services;

  HrAttendanceRepoImpl(this.services);

  @override
  Future<Either<ResponseError, HrAttendanceResponse>> getAttendance({
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
        .mapRight((right) => HrAttendanceResponse.fromJson(right));
  }
}
