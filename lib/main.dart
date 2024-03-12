import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/di_container/locator.dart';
import 'package:rick_and_morty/firebase_options.dart';
import 'package:rick_and_morty/internal/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  runApp(const MyApp());
}
