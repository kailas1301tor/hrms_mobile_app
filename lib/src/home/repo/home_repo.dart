import 'package:either_dart/either.dart';
import 'package:hrms_mobile/data/remote/network_base_services.dart';
import 'package:hrms_mobile/src/home/model/tour_model.dart';
import 'package:hrms_mobile/src/home/model/trip_model.dart';
import '../../../data/remote/network_services.dart';
import '../../../res/constants/app_constants.dart';

abstract class HomeRepo {
  Future<Either<ResponseError, List<TourModel>>> getTours();
  Future<Either<ResponseError, List<TripModel>>> getTrips();
}

class HomeRepoImpl implements HomeRepo {
  final NetworkServices _networkServices;

  HomeRepoImpl(this._networkServices);

  @override
  Future<Either<ResponseError, List<TourModel>>> getTours() async {
    return _networkServices
        .safe(_networkServices.getRequest(endPoint: AppConstants.tours))
        .then((response) {
          return response.fold((error) => Left(error), (success) async {
            try {
              final List<dynamic> data = success.data;
              final tours = data.map((e) => TourModel.fromJson(e)).toList();
              return Right(tours);
            } catch (e) {
              return Left(
                ResponseError(
                  key: ApiErrorTypes.jsonParsing,
                  message: 'Failed to parse tours: $e',
                ),
              );
            }
          });
        });
  }

  @override
  Future<Either<ResponseError, List<TripModel>>> getTrips() async {
    return _networkServices
        .safe(_networkServices.getRequest(endPoint: AppConstants.trips))
        .then((response) {
          return response.fold((error) => Left(error), (success) async {
            try {
              final List<dynamic> data = success.data;
              final trips = data.map((e) => TripModel.fromJson(e)).toList();
              return Right(trips);
            } catch (e) {
              return Left(
                ResponseError(
                  key: ApiErrorTypes.jsonParsing,
                  message: 'Failed to parse trips: $e',
                ),
              );
            }
          });
        });
  }
}
