import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/entity/product_post/vo_simple_product_post.dart';
import 'package:fast_app_base/screen/post_detail/s_post_detail.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProductPostItem extends StatelessWidget {
  final SimpleProductPost post;
  const ProductPostItem(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent, // 투명한 영역도 터치 가능하도록
      onTapUp: (details) {
        Nav.pushWithRippleEffect(
            PostDetailScreen(post.id, simpleProductPost: post),
            offset:
                Offset(details.globalPosition.dx, details.globalPosition.dy),
            durationMs: 800);
      },
      // onTap: () {
      //   // 상세 페이지
      //   Nav.push(PostDetailScreen(post.id, simpleProductPost: post),
      //       durationMs: 800, navAni: NavAni.Ripple); // Nav의 여러가지 효과
      // },
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  // Hero: 같은 이미지 사용 시 이미지가 커지듯이 위젯 변화
                  // tag는 중복되면 안됨
                  tag: '${post.id}_${post.product.images[0]}',
                  child: CachedNetworkImage(
                    imageUrl: post.product.images[0],
                    width: 150,
                  ),
                ),
              ),
              Width(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    post.title.text.size(17).bold.make(),
                    Row(
                      children: [
                        post.address.simpleAddress.text
                            .color(context.appColors.lessImportantColor)
                            .make(),
                        '•'
                            .text
                            .color(context.appColors.lessImportantColor)
                            .make(),
                        timeago
                            .format(post.createdTime,
                                locale: context.locale.languageCode)
                            .text
                            .color(context.appColors.lessImportantColor)
                            .make()
                      ],
                    ),
                    post.product.price.toWon().text.bold.make(),
                  ],
                ),
              )
            ],
          ).p(15),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('$basePath/home/post_comment.png'),
                  post.chatCount.text.make(),
                  Image.asset('$basePath/home/post_heart_off.png'),
                  post.likeCount.text.make(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
