import 'package:fast_app_base/data/network/result/daangnApi.dart';
import 'package:fast_app_base/entity/product_post/vo_product_post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ** notification_provider 와 같은 기능이지만 다른 형태 **
// **daangnApi.dart 에서 형태가 getNotification(), getPost() 차이 **
// FutureProviderFamily<결과값, id의 type>
final productPostProvider =
    //   FutureProviderFamily<ProductPost, int>((ref, id) async {
    // // FutureProviderFamily: Api를 통해 데이터 주고 받고, 전달까지 한 후에 저장까지
    // return await DaangnApi.getPost(id);

    AutoDisposeFutureProviderFamily<ProductPost, int>((ref, id) async {
  return await DaangnApi.getPost(id);
});
