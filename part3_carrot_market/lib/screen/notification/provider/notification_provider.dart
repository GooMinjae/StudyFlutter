import 'package:fast_app_base/data/network/result/daangnApi.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remoteNotificationProvider = FutureProvider((ref) async {
  final result = await DaangnApi.getNotification();
  return result.successData;
});

final notificationProvider = StateProvider<List<DaangnNotification>?>((ref) {
  final list = ref.watch(remoteNotificationProvider);
  if (list.hasValue) {
    return list.requireValue;
  }
  return null;
});
