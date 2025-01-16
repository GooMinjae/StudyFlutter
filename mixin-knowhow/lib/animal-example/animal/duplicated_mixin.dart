import 'package:mixin_knowhow/animal-example/ability-mixin/fly2_mixin.dart';
import 'package:mixin_knowhow/animal-example/ability-mixin/fly_mixin.dart';
import 'package:mixin_knowhow/animal-example/animal/animal.dart';

// FlyMixin, Fly2Mixin - fly() 매서드 이름 동일
// -> field 이름은 _로
class ProblemBird extends Animal with FlyMixin, Fly2Mixin {}
