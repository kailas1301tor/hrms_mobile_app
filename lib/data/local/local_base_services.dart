// Base class for local data services
abstract class LocalBaseServices {
  Future<void> initialize();

  Future<void> getUserData();

  Future<void> insertUserData();

  Future<void> deleteUserData();

  Future<void> saveTokens({
    String? accessToken,
    String? refreshToken,
  });

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<bool> clearSembastDb();

  Future<void> saveUser({bool? isNewUser});

  Future<bool> isNewUser();

  Future<void> updateOnboardedStatus(bool value);

  Future<bool> getOnboardedStatus();

  Future<void> setLastReminderShown(String mealLabel, DateTime time);

  Future<DateTime?> getLastReminderShown(String mealLabel);
}
