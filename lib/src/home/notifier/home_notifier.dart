import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../services/repo_di.dart';
import '../repo/home_repo.dart';
import '../state/home_state.dart';

part 'home_notifier.g.dart';

@Riverpod(keepAlive: false)
class HomeNotifier extends _$HomeNotifier {
  late final HomeRepo homeRepo;

  @override
  HomeState build() {
    homeRepo = ref.read(homeRepositoryProvider);
    // Fetch data after build completes
    Future.microtask(() => fetchData());
    return const HomeState();
  }

  Future<void> fetchData() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    // Fetch tours
    final toursResult = await homeRepo.getTours();

    toursResult.fold(
      (error) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: error.message ?? 'Failed to load tours',
        );
      },
      (tours) {
        state = state.copyWith(tours: tours);
      },
    );

    // Fetch trips
    final tripsResult = await homeRepo.getTrips();

    tripsResult.fold(
      (error) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: error.message ?? 'Failed to load trips',
        );
      },
      (trips) {
        state = state.copyWith(isLoading: false, trips: trips);
      },
    );
  }

  Future<void> getButtonLoader() async {
    state = state.copyWith(buttonLoader: true);
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(buttonLoader: false);
  }
}
