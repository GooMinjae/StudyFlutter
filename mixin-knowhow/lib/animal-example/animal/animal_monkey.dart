//import 'package:mixin_knowhow/animal-example/ability-mixin/fly_mixin.dart';

import 'package:mixin_knowhow/animal-example/ability-mixin/fly_mixin.dart';
import 'package:mixin_knowhow/animal-example/ability-abstract-class/animal_walkable_inherite.dart';
import 'package:mixin_knowhow/animal-example/skill/skill_use_stick.dart';

class Monkey extends WalkableAnimal {
  late UseStick useStick = UseStick('Maple'); // late 사용

  // UseStick? _useStick;
  //
  // UseStick get useStick {
  //   _useStick ??= UseStick('Maple');
  //   //??= equals with
  //   //if (_useStick == null) _useStick = UseStick('Maple');
  //   return _useStick!;
  // }
}
