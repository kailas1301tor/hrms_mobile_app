import 'package:either_dart/either.dart';
import 'package:hrms_mobile/data/remote/network_base_services.dart';
import 'package:hrms_mobile/data/remote/network_services.dart';
import 'package:hrms_mobile/res/constants/app_constants.dart';
import 'package:hrms_mobile/src/login/model/login_response.dart';

abstract class LoginRepo {
  Future<Either<ResponseError, LoginResponse>> login(
    String email,
    String password,
  );
}

class LoginRepoImpl extends LoginRepo {
  final NetworkServices services;

  LoginRepoImpl(this.services);

  @override
  Future<Either<ResponseError, LoginResponse>> login(
    String email,
    String password,
  ) {
    return services
        .safe(
          services.postRequest(
            endPoint: AppConstants.login,
            parameters: {"email": email, "password": password},
          ),
        )
        .thenRight(services.checkHttpStatus)
        .thenRight(services.parseJson)
        .mapRight((right) => LoginResponse.fromJson(right));
  }
}
