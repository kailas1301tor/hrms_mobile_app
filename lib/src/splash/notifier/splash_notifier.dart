import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/local/sembast_services.dart';
import '../../../res/constants/app_constants.dart';

part 'splash_notifier.g.dart';

@riverpod
class SplashNotifier extends _$SplashNotifier {
  @override
  void build() {}

  Future<void> initialize() async {
    if (!ref.mounted) return;
    final sembast = ref.read(sembastServicesProvider);
    await sembast.initialize();
    if (!ref.mounted) return;
    await loadInitialValues();
  }

  Future<void> loadInitialValues() async {
    if (!ref.mounted) return;
    final sembast = ref.read(sembastServicesProvider);
    AppConstants.accessToken = await sembast.getAccessToken() ?? '';
    AppConstants.refreshToken = await sembast.getRefreshToken() ?? '';
  }
}
