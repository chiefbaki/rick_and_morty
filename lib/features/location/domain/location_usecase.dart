import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/utils/constants/api_consts.dart';
import 'package:rick_and_morty/features/location/data/location_model.dart';

class LocationUseCase {
  final Dio dio;

  LocationUseCase({required this.dio});

  Future<LocationModel> getModel(String? query) async {
    final Response response = await dio.get(ApiConsts.location, queryParameters: {
      "name": query
    });
    return LocationModel.fromJson(response.data);
  }
}
