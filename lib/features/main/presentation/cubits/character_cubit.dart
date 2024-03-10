import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/main/data/character_model.dart';
import 'package:rick_and_morty/features/main/data/character_rep.dart';
import 'package:rick_and_morty/features/main/presentation/cubits/character_state.dart';


class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit({required this.repository}) : super(CharacterInitial());

  Future<void> getDataCharacter(String? query) async {
    emit(CharacterLoading());
    try {
      final CharacterModel model = await repository.getCharacter(query);
      emit(CharacterSuccess(model: model));
    } catch (e) {
      emit(CharacterError(error: e.toString()));
    }
  }

  // Future<void> getCharacterResults(String query) async {
  //   emit(CharacterLoading());
  //   try {
  //     final List<Results> model = await repository.getUserList();
  //     emit(CharacterSuccess(results: model));
  //   } catch (e) {
  //     emit(CharacterError(error: e.toString()));
  //   }
  // }

  final CharacterRep repository;
}
