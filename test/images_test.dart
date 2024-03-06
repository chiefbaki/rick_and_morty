import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.character).existsSync(), isTrue);
    expect(File(Images.divider).existsSync(), isTrue);
    expect(File(Images.earth).existsSync(), isTrue);
    expect(File(Images.earth1).existsSync(), isTrue);
    expect(File(Images.episode).existsSync(), isTrue);
    expect(File(Images.grid).existsSync(), isTrue);
    expect(File(Images.group).existsSync(), isTrue);
    expect(File(Images.img).existsSync(), isTrue);
    expect(File(Images.imgBig).existsSync(), isTrue);
    expect(File(Images.list).existsSync(), isTrue);
    expect(File(Images.location).existsSync(), isTrue);
    expect(File(Images.morty).existsSync(), isTrue);
    expect(File(Images.palette).existsSync(), isTrue);
    expect(File(Images.pass).existsSync(), isTrue);
    expect(File(Images.rick).existsSync(), isTrue);
    expect(File(Images.settings).existsSync(), isTrue);
    expect(File(Images.settingsIcon).existsSync(), isTrue);
    expect(File(Images.splash).existsSync(), isTrue);
    expect(File(Images.splashText).existsSync(), isTrue);
    expect(File(Images.user).existsSync(), isTrue);
  });
}
