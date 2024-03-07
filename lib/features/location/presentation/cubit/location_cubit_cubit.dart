import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/location/data/location_model.dart';
import 'package:rick_and_morty/features/location/data/location_rep.dart';

part 'location_cubit_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required this.repository}) : super(LocationInitial());

  Future<void> getLocationData() async {
    emit(LocationLoading());
    try {
      final LocationModel model = await repository.getLocation();
      emit(LocationSuccess(model: model));
    } catch (e) {
      emit(LocationError(error: e.toString()));
    }
  }

  final LocationRep repository;
}
