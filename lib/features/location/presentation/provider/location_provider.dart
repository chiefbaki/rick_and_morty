import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/character/data/character_model.dart';

class LocationProvider extends ChangeNotifier {
  CharacterModel? model;
  void setModel(CharacterModel model) {
    model = this.model ?? CharacterModel();
  }

  CharacterModel get getCharacterModel => model ?? CharacterModel();
}
