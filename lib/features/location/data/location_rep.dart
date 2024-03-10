import 'package:rick_and_morty/features/location/data/location_model.dart';

abstract class LocationRep{
  Future<LocationModel> getLocation(String? query);
}