import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/entity/product_post/vo_product_post.dart';
import 'package:fast_app_base/entity/product_post/vo_simple_product_post.dart';
import 'package:fast_app_base/screen/post_detail/provider/product_post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../common/widget/w_vertical_line.dart';
import 'w_post_content.dart';
import 'w_user_profile_widget.dart';

class PostDetailScreen extends ConsumerWidget {
  final SimpleProductPost? simpleProductPost;
  final int id;

  const PostDetailScreen(
    this.id, {
    super.key,
    this.simpleProductPost,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productPost = ref.watch(productPostProvider(id));

    /// productPost의 객체 type: async value (nullable)
    /// Future -> await 로 해야하지만,
    /// watch를 통해서 가져오면 built함수가 async 함수가 아님에도
    /// Future 데이터를 sync하게 사용가능

    // data가 있을 때, 로딩 중 일때, 에러가 났을 때
    return productPost.when(
        data: (data) => _PostDetial(
              data.simpleProductPost,
              productPost: data,
            ),
        error: (error, trace) => '404 Error'.text.make(),
        loading: () => simpleProductPost != null
            ? _PostDetial(simpleProductPost!)
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}

// controller 사용하기 위해서는 StateFulWidget 사용해야하고,
// 대신에 HookWidget 사용함
class _PostDetial extends HookWidget {
  final SimpleProductPost simpleProductPost;
  final ProductPost? productPost;
  static const bottomMenuHeight = 100.0;
  // const _PostDetial(필수                 {필수 아님 -> named parameter});
  const _PostDetial(this.simpleProductPost, {this.productPost, super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    return Material(
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: bottomMenuHeight),
            child: Column(
              children: [
                _ImagePager(
                    pageController: pageController,
                    simpleProductPost: simpleProductPost),
                UserProfileWidget(
                    simpleProductPost.product.user, simpleProductPost.address),
                PostContent(
                    simpleProductPost: simpleProductPost,
                    productPost: productPost)
              ],
            ),
          ),
          const _AppBar(),
          Align(
            alignment: Alignment.bottomCenter,
            child: PostDetailBottomMenu(simpleProductPost.product),
          )
        ],
      ),
    );
  }
}

class PostDetailBottomMenu extends StatelessWidget {
  final Product product;
  const PostDetailBottomMenu(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _PostDetial.bottomMenuHeight,
      child: Column(children: [
        const Line(),
        Expanded(
          child: Row(
            children: [
              Image.asset(
                '$basePath/detail/heart_on.png',
                height: 25,
              ).pOnly(left: 20),
              const Width(20),
              const VerticalLine().pSymmetric(v: 15),
              const Width(20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        product.price.toWon().text.size(17).bold.make(),
                        Width(12),
                        Image.asset(
                          '$basePath/notification/notification_icon_01.png',
                          height: 22,
                        ),
                        'pay'.text.orange400.bold.size(14).make()
                      ],
                    ),
                    '가격 제안하기'.text.orange400.underline.make()
                  ],
                ),
              ),
              RoundButton(
                text: '채팅하기',
                onTap: () {},
                bgColor: const Color(0xFFFB923C),
                borderRadius: 10,
              ),
              const Width(10)
            ],
          ),
        )
      ]),
    );
  }
}

class _ImagePager extends StatelessWidget {
  const _ImagePager({
    super.key,
    required this.pageController,
    required this.simpleProductPost,
  });

  final PageController pageController;
  final SimpleProductPost simpleProductPost;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceWidth,
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            children: simpleProductPost.product.images
                .map((url) => CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.fill,
                    ))
                .toList(),
          ),
          // flutter pub add smooth_page_indicator
          Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: pageController,
                count: simpleProductPost.product.images.length,
                effect: const JumpingDotEffect(
                  verticalOffset: 10,
                  dotColor: Colors.white54,
                  activeDotColor: Colors.black45,
                ),
              ))
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60 + context.statusBarHeight,
      child: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Nav.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert, color: Colors.white)),
        ],
      ),
    );
  }
}
