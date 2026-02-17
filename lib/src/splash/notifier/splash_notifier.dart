import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/local/sembast_services.dart';
import '../../../res/constants/app_constants.dart';

part 'splash_notifier.g.dart';

@riverpod
class SplashNotifier extends _$SplashNotifier {
  @override
  void build() {}

  Future<void> initialize() async {
    final sembastServices = await ref.read(sembastServicesProvider.future);
    await sembastServices.initialize();
    await loadInitialValues();
  }

  Future<void> loadInitialValues() async {
    final sembastServices = await ref.read(sembastServicesProvider.future);
    AppConstants.accessToken = await sembastServices.getAccessToken() ?? '';
    AppConstants.refreshToken = await sembastServices.getRefreshToken() ?? '';
    _isNewUserFlag = await sembastServices.isNewUser();
    _hasOnboarded = await sembastServices.getOnboardedStatus();
  }

  bool? _isNewUserFlag;
  bool? _hasOnboarded;

  bool get isNewUser => _isNewUserFlag ?? true;
  bool get hasOnboarded => _hasOnboarded ?? false;
}
