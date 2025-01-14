import 'package:fast_app_base/screen/notification/provider/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'vo/notification_dummies.dart';
import 'w_notification_item.dart';

class NotificationFrament extends ConsumerWidget {
  const NotificationFrament({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(notificationProvider);

    return list == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView(
            children: [
              ...list
                  .map((e) => NotificationItemWidget(
                        notification: e,
                        onTap: () {},
                      ))
                  .toList()
            ],
          );
  }
}
