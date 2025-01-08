import 'dart:io';

import 'package:fast_app_base/common/cli_common.dart';

void main() async {
  // List, Iterable
  final List list = ['blue', 'yellow', 'red'];
  final iterator = list.iterator;
  print(iterator.current);
  // iterator.moveNext();
  // print(iterator.current);
  while (iterator.moveNext()) {
    print(iterator.current);
  }

  // sync*로  Iterable 만들기
  for (final message in countIterable(5)) {
    // iterable
    print(message);
  }

  await for (final message in countStream(5)) {
    // await for : stream
    print(message);
  }
}
//// Generator

/// sync
Iterable<String> countIterable(int to) sync* {
  for (int i = 1; i <= to; i++) {
    // sleep(1.seconds); // 사용 지양 - 스레드 완전 멈춰서 대기
    yield i.toString();
  }
  yield 'dd';
  // yield*를 통해서 Iterable & Stream 연장시키기
  yield* ['a', 'b', 'c'];
}

///async
// async*로 Stream 만들기
Stream<String> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    await sleepAsync(1.seconds);
    yield i.toString();
  }
  yield 'dd';
  // yield* ['a', 'b', 'c']; // error
  yield* countStream(to);
}
