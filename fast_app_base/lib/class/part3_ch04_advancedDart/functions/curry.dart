curry(Function f) => (a, {Iterable? args}) =>
    (args?.length ?? 0) > 1 ? f(a, args) : (b) => f(a, b);

main() {
  // 함수 자체를 쪼개줌
  curryMultyply(2)(3); // -> 2 * 3

  final multyply2 = curryMultyply(2);
  for (int i = 0; i < 10; i++) {
    print(multyply2(i));
  }
}

final multyply = (int a, int b) => (a * b);
final curryMultyply = curry(multyply);
