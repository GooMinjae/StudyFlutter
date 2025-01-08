import 'dart:async';

import 'package:fast_app_base/common/common.dart';

void main() {
  // Stream 기본 개념
  /// Future - 한번의 데이터를 가져옴
  /// Stream - 여러번의 데이터를 받을 수 있음

  // Stream 생성과 수행
  /// 1. async*
  countStream(10).listen((event) {
    print(event);
  });

  /// 2. streamController
  final controller = StreamController<int>();
  final stream = controller.stream;
  stream.listen((event) {
    print(event);
  });

  addDataToTheSink(controller);

  // Stream 데이터 변환
  countStream(4).map((event) => '$event 초가 지났습니다.').listen((event) {
    print(event);
  });

  // 위젯에서 Stream Data 표현

  // Stream 데이터 관찰 2 - BroadcastStream

  final broadCastStream = countStream(5).asBroadcastStream();

  broadCastStream.listen((event) {
    print(event);
  });
  Future.delayed(2.seconds, () {
    broadCastStream.listen((event) {
      print(event);
    });
  }); // 여러번 가능

  // 2개의 위젯에서 하나의 BroadcastStream Data 표현

  // Stream Error Handling -- 여러 형태로 사용 가능함
  countStream(5).listen((event) {
    print(event);
  }).onError((e, trace) {
    print(e.toString());
  });
}

void addDataToTheSink(StreamController<int> controller) async {
  for (int i = 1; i <= 4; i++) {
    controller.sink.add(i);
    await sleepAsync(1.seconds);
  }
}

Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    if (i == 2) {
      yield* Stream.error(Exception("error"));
    }
    yield i;
    await sleepAsync(1.seconds);
  }
}
