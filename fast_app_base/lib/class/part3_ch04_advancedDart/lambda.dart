import 'package:fast_app_base/common/dart/collection/sort_functions.dart';

class Animals {
  final int age;
  Animals(this.age);

  @override
  String toString() {
    // TODO: implement toString
    return "Animal: $age";
  }
}

main() {
  // 람다의 표현
  // (int 파라미터1, String 파라미터2) => return value
  int add(int a, int b) {
    return a + b;
  }

  // 위의 함수 lambda 표현식
  int add2(int a, int b) => a + b;

  (int a, int b) => a + b;

  final add3 = (int a, int b) => a + b;

  run(add, 1, 2);
  run(add2, 1, 2);
  run(add3, 1, 2);

  // 람다의 특징
  // 1. 익명
  // 2. 함수: class에 종속되지 않음
  // 3. 전달
  // 4. 간결성

  // list sort
  final list = [1, 5, 3, 8, 2];
  // list.sort();
  list.sort((a, b) => a == b
      ? 0
      : a > b
          ? 1
          : -1);
  print(list); // [1, 2, 3, 5, 8]

  list.sort((a, b) => a == b
      ? 0
      : a < b
          ? 1
          : -1);
  print(list); // [8, 5, 3, 2, 1]

  final listAnimals = [
    Animals(5),
    Animals(2),
    Animals(1),
    Animals(4),
    Animals(3)
  ];
  listAnimals.sort(
      byIntField<Animals>((element) => element.age)); // byIntField : 사전에 제작
  print(
      listAnimals); // 내림차순 [Animal: 5, Animal: 4, Animal: 3, Animal: 2, Animal: 1]

  listAnimals
      .sort(byIntField<Animals>((element) => element.age, reverse: true));
  print(
      listAnimals); // 오름차순 [Animal: 1, Animal: 2, Animal: 3, Animal: 4, Animal: 5]
}

void run(int Function(int a, int b) add, int a, int b) {
  final sum = add(a, b);
}
