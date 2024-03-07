import 'package:rick_and_morty/features/character/data/character_model.dart';
import 'package:rick_and_morty/features/character/data/character_rep.dart';
import 'package:rick_and_morty/features/character/domain/character_usecase.dart';

class CharacterImpl implements CharacterRep {
  final CharacterUseCase useCase;
  CharacterImpl({required this.useCase});
  @override
  Future<CharacterModel> getCharacter() async {
    return useCase.getCharacter();
  }
}
