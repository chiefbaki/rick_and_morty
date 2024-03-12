import 'package:rick_and_morty/features/main/data/character_model.dart';

abstract class CharacterRep {
  Future<CharacterModel> getCharacter(String? query, String? status, String? gender);
  
}
