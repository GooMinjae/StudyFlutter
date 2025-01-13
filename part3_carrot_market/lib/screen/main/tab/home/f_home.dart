import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/entity/dummies.dart';
import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button.dart';
import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'w_product_post_item.dart';

class HomeFragment extends ConsumerStatefulWidget {
  const HomeFragment({super.key});

  @override
  ConsumerState<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends ConsumerState<HomeFragment> {
  final scrollController = ScrollController();
  String title = '감쟈동';
  bool isOpened = false;

  @override
  void initState() {
    // TODO: implement initState
    scrollController.addListener(() {
      // final isSmall = ref.read(floatingButtonIsSmallProvider);
      // if (scrollController.position.pixels > 100 && !isSmall) {
      //   ref.read(floatingButtonIsSmallProvider.notifier).state = true;
      // } else if (scrollController.position.pixels < 100 && isSmall) {
      //   ref.read(floatingButtonIsSmallProvider.notifier).state = false;
      // }
      final floatingButtonState = ref.watch(floatingButtonStateProvider);
      // final isSmall = floatingButtonState.isSmall;

      if (scrollController.position.pixels > 100 &&
          !floatingButtonState.isSmall) {
        ref.read(floatingButtonStateProvider.notifier).changeButtonSize(true);
      } else if (scrollController.position.pixels < 100 &&
          floatingButtonState.isSmall) {
        ref.read(floatingButtonStateProvider.notifier).changeButtonSize(false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          // automaticallyImplyLeading: false,
          title: PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                title = value;
                isOpened = false;
              });
            },
            onCanceled: () {
              setState(() {
                isOpened = false;
              });
            },
            onOpened: () {
              setState(() {
                isOpened = true;
              });
            },
            itemBuilder: (BuildContext context) => ["핑구동", "철이동"]
                // [
                //   PopupMenuItem(
                //     child: "핑구동".text.make(),
                //     value: "핑구동",
                //   ),
                //   PopupMenuItem(
                //     child: "철이동".text.make(),
                //     value: "철이동",
                //   )
                // ],
                .map((e) => PopupMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title),
                AnimatedRotation(
                  turns: isOpened ? -0.5 : 0.0, // 0.5 = 180도 회전
                  duration: 300.ms,
                  child: const Icon(Icons.expand_more),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: FloatingDaangnButton.height),
            controller: scrollController,
            itemBuilder: (context, index) => ProductPostItem(postList[index]),
            itemCount: postList.length,
            separatorBuilder: (context, index) =>
                const Line().pSymmetric(h: 15),
          ),
        ),
      ],
    );
  }
}
