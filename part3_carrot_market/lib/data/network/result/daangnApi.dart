import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/data/network/result/api_error.dart';
import 'package:fast_app_base/data/simple_result.dart';
import 'package:fast_app_base/entity/dummies.dart';
import 'package:fast_app_base/screen/notification/vo/notification_dummies.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

import '../../../entity/product_post/vo_product_post.dart';

class DaangnApi {
  // <SimpleResult<성공, 에러>>
  static Future<SimpleResult<List<DaangnNotification>, ApiError>>
      getNotification() async {
    await sleepAsync(300.ms);
    return SimpleResult.success(notificationList);
  }

  // static Future<SimpleResult<ProductPost, ApiError>> getPost(int id) async {
  //   await sleepAsync(300.ms);
  //   return SimpleResult.success(ProductPost(
  //     simpleProductPost: post1,
  //     content: '깨끗하게 잘 쓰던 물건이에요'
  //         '잘쓰면 좋겠습니다'
  //         '감사합니다.',
  //   ));
  // }
  static Future<ProductPost> getPost(int id) async {
    await sleepAsync(300.ms);
    return ProductPost(
      simpleProductPost: post1,
      content: '깨끗하게 잘 쓰던 물건이에요\n'
          '잘쓰면 좋겠습니다\n'
          '감사합니다.',
    );
  }
}
