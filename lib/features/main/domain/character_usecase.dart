import 'package:dio/dio.dart';
import 'package:rick_and_morty/features/main/data/character_model.dart';

class CharacterUseCase {
  final Dio dio;

  CharacterUseCase({required this.dio});

  Future<CharacterModel> getCharacter(String? query) async {
    final Response response = await dio.get("https://rickandmortyapi.com/api/character/", queryParameters: {
      "name": query
    });
    return CharacterModel.fromJson(response.data);
  }

  // Future<List<Results>> getUserList({String? query}) async {
  //   final Response response = await dio.get(
  //       "https://rickandmortyapi.com/api/character/",
  //       queryParameters: {"status": query});
  //   final CharacterModel model = CharacterModel.fromJson(response.data);
  //   // List<Results> results = model.results ?? [];
  //   // if (query?.replaceAll(" ", "") != null) {
  //   //   results = results
  //   //       .where((element) =>
  //   //           element.name!.toLowerCase().contains(query!.toLowerCase()))
  //   //       .toList();
  //   //   print(query);
  //   //   return results;
  //   // }
    
  //   return model.results ?? [];
  // }
}
