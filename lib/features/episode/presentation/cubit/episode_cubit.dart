import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/episode/data/episode_model.dart';
import 'package:rick_and_morty/features/episode/data/episode_rep.dart';

part 'episode_state.dart';

class EpisodeCubit extends Cubit<EpisodeState> {
  EpisodeCubit({required this.repository}) : super(EpisodeInitial());

  Future<void> getEpisodes() async {
    emit(EpisodeLoading());
    try {
      final EpisodeModel model = await repository.getEpisode();
      emit(EpisodeSuccess(model: model));
    } catch (e) {
      emit(EpisodeError(error: e.toString()));
    }
  }
 
  final EpisodeRep repository;
}
