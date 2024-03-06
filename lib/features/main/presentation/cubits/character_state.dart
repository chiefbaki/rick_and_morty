import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/main/data/character_model.dart';

@immutable
sealed class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterSuccess extends CharacterState {
  final CharacterModel model;
  CharacterSuccess({required this.model});
}

class CharacterError extends CharacterState {
  final String error;
  CharacterError({required this.error});
}
