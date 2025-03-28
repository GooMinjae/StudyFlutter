import 'package:mixin_knowhow/realworld-example/mock-framework/buildcontext.dart';
import 'package:mixin_knowhow/realworld-example/purchase/request_purchase_interface.dart';
import 'package:mixin_knowhow/realworld-example/purchase/object/o_purchased_item.dart';

// mixin 사용하지 않는 구조
class SubscribeManager implements RequestPurchaseInterface {
  @override
  Future<bool> requestPurchase(
      PurchasedItem purchasedItem, BuildContext context) async {
    return true;
  }
}
