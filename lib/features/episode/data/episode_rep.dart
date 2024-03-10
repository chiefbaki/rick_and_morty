import 'package:rick_and_morty/features/episode/data/episode_model.dart';

abstract class EpisodeRep{
  Future<EpisodeModel> getEpisode(String? query);
}