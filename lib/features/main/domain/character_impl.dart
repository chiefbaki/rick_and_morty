import 'package:rick_and_morty/features/main/data/character_model.dart';
import 'package:rick_and_morty/features/main/data/character_rep.dart';
import 'package:rick_and_morty/features/main/domain/character_usecase.dart';

class CharacterImpl implements CharacterRep {
  final CharacterUseCase useCase;
  CharacterImpl({required this.useCase});
  @override
  Future<CharacterModel> getCharacter(String? query) async {
    return useCase.getCharacter(query);
  }

  // @override
  // Future<List<Results>> getUserList({String? query}) async {
  //   return useCase.getUserList();
  // }
  
}
