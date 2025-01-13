import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/entity/product/product_status.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/entity/product_post/vo_product_post.dart';
import 'package:fast_app_base/entity/user/vo_address.dart';
import 'package:fast_app_base/entity/user/vo_user.dart';

String picSum(int id) {
  return 'https://picsum.photos/id/$id/150/150';
}

final user1 = User(
  id: 1,
  nickname: "정길동",
  temperature: 36.5,
  profileUrl: picSum(961),
);

final user2 = User(
  id: 2,
  nickname: "유철쿠",
  temperature: 36.5,
  profileUrl: picSum(900),
);

final user3 = User(
  id: 3,
  nickname: "감쟈",
  temperature: 36.5,
  profileUrl: picSum(1010),
);

final product1 = Product(
    user1,
    '아이폰13',
    700000,
    '깨끗하게 잘 쓰던 물건이에요'
        '잘쓰면 좋겠습니다'
        '감사합니다.',
    ProductStatus.normal,
    [
      picSum(500),
      picSum(501),
      picSum(505),
      picSum(550),
    ]);

final product2 = Product(
    user2,
    '아이폰14',
    1000000,
    '깨끗하게 잘 쓰던 물건이에요'
        '잘쓰면 좋겠습니다'
        '감사합니다.',
    ProductStatus.normal,
    [
      picSum(600),
      picSum(601),
      picSum(608),
      picSum(800),
    ]);

final product3 = Product(
    user3,
    '감자',
    100,
    '깨끗하게 잘 쓰던 물건이에요'
        '잘쓰면 좋겠습니다'
        '감사합니다.',
    ProductStatus.normal,
    [
      picSum(700),
      picSum(709),
      picSum(703),
    ]);

final post1 = ProductPost(
  product1.user,
  product1,
  '글의 내용',
  const Address('감쟈시 감쟈구 감쟈동', '감쟈동'),
  30,
  120,
  DateTime.now().subtract(30.minutes),
);

final post2 = ProductPost(
  product2.user,
  product2,
  '글의 내용',
  const Address('감쟈시 감쟈구 감쟈동', '감쟈동'),
  30,
  120,
  DateTime.now().subtract(30.days),
);

final post3 = ProductPost(
  product3.user,
  product3,
  '감쟈 감쟈',
  const Address('감쟈시 감쟈구 감쟈동', '감쟈동'),
  30,
  120,
  DateTime.now().subtract(1.days),
);

final postList = [post1, post2, post3, post1, post2, post3];
