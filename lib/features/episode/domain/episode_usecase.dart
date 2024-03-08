import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/utils/constants/api_consts.dart';
import 'package:rick_and_morty/features/episode/data/episode_model.dart';

class EpisodeUseCase {
  final Dio dio;

  EpisodeUseCase({required this.dio});

  Future<EpisodeModel> getEpisode() async {
    final Response response = await dio.get(ApiConsts.episode);
    return EpisodeModel.fromJson(response.data);
  }
}
