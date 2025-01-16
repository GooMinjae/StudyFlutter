import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/common.dart';

class FcmManager {
  static void requestPermission() {
    FirebaseMessaging.instance.requestPermission();
  }

  static void initialize(WidgetRef ref) async {
    /// Foreground
    ///
    FirebaseMessaging.onMessage.listen((message) async {
      final title = message.notification?.title;
      if (title == null) {
        return;
      }
      ref.read(floatingButtonStateProvider.notifier).hideButton();
      App.navigatorKey.currentContext?.showSnackbar(title);
      await sleepAsync(4.seconds);
      ref.read(floatingButtonStateProvider.notifier).showButton();
      debugPrint(message.toString());
    });

    /// Background
    ///
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      App.navigatorKey.currentContext!.go(message.data['deeplink']);
    });

    ///
    /// Not running -> initial launch
    ///
    // final firstMessage = await FirebaseMessaging.instance.getInitialMessage();
    // if (firstMessage != null) {
    //   await sleepUntil(() =>
    //       App.navigatorKey.currentContext != null &&
    //       App.navigatorKey.currentContext!.mounted);
    //   final context = App.navigatorKey.currentContext;
    //   if (context != null && context.mounted) {
    //     context.go(firstMessage.data['deeplink']);
    //   }
    // }

    // 테스트 메세지 전송 기능 사용 시 필요한 token 받아올 수 있음
    final token = await FirebaseMessaging.instance.getToken();
    // print(token);
    FirebaseMessaging.instance.onTokenRefresh.listen((event) {
      /// API로 token 전송
    });
  }
}
