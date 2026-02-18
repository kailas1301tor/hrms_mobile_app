import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/home_state.dart';

part 'home_notifier.g.dart';

@Riverpod(keepAlive: false)
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    return const HomeState();
  }

  Future<void> fetchData() async {
    // Fetch tours
  }
}
