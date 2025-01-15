import 'package:firebase_messaging/firebase_messaging.dart';

class FcmManager {
  static void requestPermission() {
    FirebaseMessaging.instance.requestPermission();
  }

  static void initialize() async {
    // 테스트 메세지 전송 기능 사용 시 필요한 token 받아올 수 있음
    final token = await FirebaseMessaging.instance.getToken();
    // print(token);
  }
}
