import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/config/settings/dio_settings.dart';
import 'package:rick_and_morty/features/main/domain/character_impl.dart';
import 'package:rick_and_morty/features/main/domain/character_usecase.dart';
import 'package:rick_and_morty/features/main/presentation/cubits/character_cubit.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerFactory<DioSettings>(() => DioSettings());
  locator.registerFactory<CharacterUseCase>(
      () => CharacterUseCase(dio: locator<DioSettings>().dio));
  locator.registerFactory<CharacterImpl>(
      () => CharacterImpl(useCase: locator<CharacterUseCase>()));
  locator.registerFactory<CharacterCubit>(
      () => CharacterCubit(repository: locator<CharacterImpl>()));
}
