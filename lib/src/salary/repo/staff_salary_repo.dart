import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../data/remote/network_services.dart';
import '../../../../res/constants/app_constants.dart';

import '../../../data/remote/network_base_services.dart';
import '../../home/model/staff_payslip_response.dart';

abstract class StaffSalaryRepo {
  Future<Either<ResponseError, List<StaffPayslipResponse>>> getSalaryHistory({
    int? year,
    int? month,
  });
  Future<Either<ResponseError, String>> downloadPayslip({
    required String id,
    required String fileName,
  });

  Future<Either<ResponseError, String>> saveFileToDevice({
    required String filePath,
    required String fileName,
  });
}

class StaffSalaryRepoImpl implements StaffSalaryRepo {
  final NetworkServices services;

  StaffSalaryRepoImpl(this.services);

  @override
  Future<Either<ResponseError, String>> saveFileToDevice({
    required String filePath,
    required String fileName,
  }) async {
    try {
      Directory? directory;
      if (Platform.isAndroid) {
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      } else {
        directory = await getApplicationDocumentsDirectory();
      }

      if (directory != null) {
        final newPath = "${directory.path}/$fileName.pdf";
        final file = File(filePath);
        await file.copy(newPath);
        return Right(newPath);
      } else {
        return Left(
          ResponseError(
            key: ApiErrorTypes.unknown,
            message: "Unable to find storage directory",
          ),
        );
      }
    } catch (e) {
      return Left(
        ResponseError(key: ApiErrorTypes.unknown, message: e.toString()),
      );
    }
  }

  @override
  Future<Either<ResponseError, String>> downloadPayslip({
    required String id,
    required String fileName,
  }) async {
    try {
      final dir = await getTemporaryDirectory();
      final savePath = "${dir.path}/$fileName.pdf";

      return services
          .downloadFile(
            endPoint: "${AppConstants.prefix}/payroll/download/$id",
            fileName: savePath,
          )
          .then((response) {
            if (response.statusCode == 200) {
              return Right(savePath);
            } else {
              return Left(
                ResponseError(
                  key: ApiErrorTypes.unknown,
                  message: "Download failed",
                ),
              );
            }
          });
    } catch (e) {
      return Left(
        ResponseError(key: ApiErrorTypes.unknown, message: e.toString()),
      );
    }
  }

  @override
  Future<Either<ResponseError, List<StaffPayslipResponse>>> getSalaryHistory({
    int? year,
    int? month,
  }) {
    String endPoint = "${AppConstants.prefix}/payroll/my-payslips";
    final queryParams = <String>[];

    if (year != null) {
      queryParams.add("year=$year");
    }
    if (month != null) {
      queryParams.add("month=$month");
    }

    if (queryParams.isNotEmpty) {
      endPoint += "?${queryParams.join('&')}";
    }

    return services
        .safe(services.getRequest(endPoint: endPoint))
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
}
