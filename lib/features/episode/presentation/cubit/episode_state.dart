part of 'episode_cubit.dart';

@immutable
sealed class EpisodeState {}

final class EpisodeInitial extends EpisodeState {}

final class EpisodeLoading extends EpisodeState {}

final class EpisodeSuccess extends EpisodeState {
  final EpisodeModel model;
  EpisodeSuccess({required this.model});
}

final class EpisodeError extends EpisodeState {
  final String error;
  EpisodeError({required this.error});
}
