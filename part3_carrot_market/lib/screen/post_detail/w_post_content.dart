import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/entity/product_post/vo_product_post.dart';
import 'package:fast_app_base/entity/product_post/vo_simple_product_post.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostContent extends StatelessWidget {
  final SimpleProductPost simpleProductPost;
  final ProductPost? productPost;

  const PostContent(
      {super.key, required this.simpleProductPost, this.productPost});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          simpleProductPost.title.text.bold.size(20).make(),
          timeago
              .format(simpleProductPost.createdTime,
                  locale: context.locale.languageCode)
              .text
              .size(10)
              .color(context.appColors.lessImportantColor)
              .make(),
          if (productPost == null)
            const Center(
              child: CircularProgressIndicator(),
            )
          else
            productPost!.content.text.make().pOnly(top: 20, bottom: 60)
        ],
      ).pSymmetric(h: 15),
    );
  }
}
