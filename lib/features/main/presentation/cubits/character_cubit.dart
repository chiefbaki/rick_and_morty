import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/main/data/character_model.dart';
import 'package:rick_and_morty/features/main/data/character_rep.dart';
import 'package:rick_and_morty/features/main/presentation/cubits/character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit({required this.repository}) : super(CharacterInitial());

  Future<void> getDataCharacter(
      String? query, String? status, String? gender) async {
    emit(CharacterLoading());
    try {
      final CharacterModel model =
          await repository.getCharacter(query, status, gender);
      emit(CharacterSuccess(model: model));
    } catch (e) {
      emit(CharacterError(error: e.toString()));
    }
  }

  final CharacterRep repository;
}
