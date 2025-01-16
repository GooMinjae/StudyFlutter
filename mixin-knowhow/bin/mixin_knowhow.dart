import 'package:mixin_knowhow/animal-example/animal/animal_monkey.dart';
import 'package:mixin_knowhow/animal-example/animal/duplicated_mixin.dart';
import 'package:mixin_knowhow/realworld-example/mock-framework/buildcontext.dart';
import 'package:mixin_knowhow/realworld-example/mock-framework/tap_widget.dart';
import 'package:mixin_knowhow/realworld-example/purchase/s_buy_gem.dart';
import 'package:mixin_knowhow/realworld-example/purchase/s_subscribe.dart';

void main(List<String> arguments) async {
  // final bird = ProblemBird();
  // bird.changeWing();
  // bird.fly(); // Fly2Mixin 으로 가져옴 (FlyMixin - override)

  // final monkey = Monkey();
  // monkey.useStick.hit();

  // final animal = Bird();
  // animal.walk();
  // animal.fly();
  // animal.useStick.hit();

  // final screen = BuyGemScreen();
  // final widget = screen.createState().build(BuildContext());
  // if (widget is Tap) {
  //   widget.onTap();
  // }

  // print('');
// ====Buy Gem Button Tapped====
// domain: buy gem tap: Gem_1250
// native: inAppPurchase start: Gem_1250

// native: inAppPurchase success: Gem_1250
// api: request buy gem start: Gem_1250
// api: request buy gem success: Gem_1250
// domain: buy gem success: Gem_1250
// ====Buy Gem success====

  final subscriptionScreen = SubscriptionScreen();
  final subscriptionWidget =
      subscriptionScreen.createState().build(BuildContext());
  if (subscriptionWidget is Tap) {
    subscriptionWidget.onTap();
  }

  print('');
// ====Subscribe Button Tapped====
// domain: subscription tap: subscribe_1month
// native: inAppPurchase start: subscribe_1month

// native: inAppPurchase success: subscribe_1month
// api: request subscribe start: subscribe_1month
// api: request subscribe success: subscribe_1month
// domain: subscription success: subscribe_1month
// ====Subscribe success====

  // final likeScreen = PostScreen('1234');
  // final likeScreenWidget = likeScreen.createState().build(BuildContext());
  // await likeScreenWidget.onTap();
  // await likeScreenWidget.onTap();
  // await likeScreenWidget.onTap();
  // await likeScreenWidget.onTap();

  //print('');

  // final globalDataExistScreen = GlobalDataExistScreen();
  // final globalDataExistWidget = globalDataExistScreen.createState().build(BuildContext());
  // await globalDataExistWidget.onTap();
}
