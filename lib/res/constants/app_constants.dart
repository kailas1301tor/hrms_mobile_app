class AppConstants {
  static const String currency = "AED";
  // static const String baseURL = "https://hrms-project-mob-test.onrender.com";
  static const String baseURL = "https://hrm.leptisgroups.com/api";

  static String api = "/api";

  static String accessToken = "";

  static String refreshToken = "";

  static String currentRoute = "";

  static String version = "/v1";

  static String user = "/user";

  static String auth = "/auth";

  static String general = "/general";

  static String prefix = "/api";

  // Add your API endpoints here
  static String login = "$prefix$auth/login";
  static String adminRequestsPending = "$prefix/requests/admin/pending";
  static String get adminRequestAction => "$prefix/requests";
  static String myRequests = "$prefix/requests/my-requests";
  static String leaveTypes = "$prefix/masters/leave-types";
  static String createRequest = "$prefix/requests";
  static String mobileStats = "$prefix/dashboard/mobile-stats";
  static String pendingApprovals = "$prefix/dashboard/pending-approvals";
  static String attendance = "$prefix/attendance";
  static String branches = "$prefix/branches";
  static String logout = "$prefix$auth/logout";
  static String refresh = "$prefix$auth/refresh";
}
