import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/utils/constants/api_consts.dart';
import 'package:rick_and_morty/features/main/data/character_model.dart';

class CharacterUseCase {
  final Dio dio;

  CharacterUseCase({required this.dio});

  Future<CharacterModel> getCharacter(
      String? query, String? status, String? gender) async {
    final Response response = await dio.get(ApiConsts.characters,
        queryParameters: {"name": query, "status": status, "gender": gender});
    return CharacterModel.fromJson(response.data);
  }
}
