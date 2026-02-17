class AppConstants {
  // Use localhost for iOS Simulator, 10.0.2.2 for Android Emulator
  static const String baseURL = "http://localhost:3000";

  static String api = "/api";

  static String accessToken = "";

  static String refreshToken = "";

  static String currentRoute = "";

  static String version = "/v1";

  static String user = "/user";

  static String general = "/general";

  static String prefix = "$api$version";

  // Add your API endpoints here
  static String login = "$prefix$user/login";
  static String register = "$prefix$user/register";
  static String profile = "$prefix$user/profile";

  // Local API endpoints
  static String tours = "/tours";
  static String trips = "/trips";
}
