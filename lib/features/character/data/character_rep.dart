import 'package:rick_and_morty/features/character/data/character_model.dart';

abstract class CharacterRep{
  Future<CharacterModel> getCharacter();
}