import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/utils/constants/api_consts.dart';
import 'package:rick_and_morty/features/character/data/character_model.dart';

class CharacterUseCase {
  final Dio dio;

  CharacterUseCase({required this.dio});

  Future<CharacterModel> getCharacter() async {
    final Response response = await dio.get(ApiConsts.characters);
    return CharacterModel.fromJson(response.data);
  }
}
