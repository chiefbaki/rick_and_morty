part of 'location_cubit_cubit.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationSuccess extends LocationState {
  final LocationModel? model;
  LocationSuccess({this.model});
}

final class LocationError extends LocationState {
  final String error;
  LocationError({required this.error});
}
