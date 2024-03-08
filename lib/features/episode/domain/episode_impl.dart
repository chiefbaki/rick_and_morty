import 'package:rick_and_morty/features/episode/data/episode_model.dart';
import 'package:rick_and_morty/features/episode/data/episode_rep.dart';
import 'package:rick_and_morty/features/episode/domain/episode_usecase.dart';

class EpisodeImpl implements EpisodeRep {
  final EpisodeUseCase useCase;
  EpisodeImpl({required this.useCase});

  @override
  Future<EpisodeModel> getEpisode() {
    return useCase.getEpisode();
  }
}
