import '../../src/login/model/login_response.dart';

// Base class for local data services
abstract class LocalBaseServices {
  Future<void> initialize();

  Future<void> getUserData();

  Future<void> insertUserData();

  Future<void> deleteUserData();

  Future<void> saveTokens({String? accessToken, String? refreshToken});

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<bool> clearSembastDb();

  Future<void> saveUser({bool? isNewUser});

  Future<void> saveLoginResponse(LoginResponse response);

  Future<LoginResponse?> getLoginResponse();
}
