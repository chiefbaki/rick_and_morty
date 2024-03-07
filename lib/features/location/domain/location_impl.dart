import 'package:rick_and_morty/features/location/data/location_model.dart';
import 'package:rick_and_morty/features/location/data/location_rep.dart';
import 'package:rick_and_morty/features/location/domain/location_usecase.dart';

class LocationImpl implements LocationRep {
  final LocationUseCase useCase;
  LocationImpl({required this.useCase});
  @override
  Future<LocationModel> getLocation() {
    return useCase.getModel();
  }
}
