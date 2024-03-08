import 'package:flutter/material.dart';


class LocationProvider extends ChangeNotifier {
  String? status;
  String? name;
  String? species;
  String? gender;
  String? img;
  void getModel(
      {required String nameM,
      required String statusM,
      required String speciesM,
      required String genderM,
      required String imgM}) {
    status = statusM;
    name = nameM;
    species = speciesM;
    gender = genderM;
    img = genderM;
  }
  
}
