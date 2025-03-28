import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/animated_width_collapse.dart';
import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button_riverpod.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/tab/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../write/s_write.dart';

class FloatingDaangnButton extends ConsumerWidget {
  // 불변의 변수 사용
  // const FloatingDaangnButton({super.key});
  // static const duration = Duration(milliseconds: 300); // 간단한 작업이니 const 포기

  FloatingDaangnButton({super.key});
  final duration = 300.ms;
  static const height = 100.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isExpanded = ref.watch(floatingButtonIsExpandedProvider);
    // final isSmall = ref.watch(floatingButtonIsSmallProvider);
    final floatingButtonState = ref.watch(floatingButtonStateProvider);
    final isExpanded = floatingButtonState.isExpanded;
    final isHided = floatingButtonState.isHided;
    final isSmall = floatingButtonState.isSmall;

    return AnimatedOpacity(
      opacity: isHided ? 0 : 1,
      duration: duration,
      child: Stack(
        children: [
          IgnorePointer(
            // background 영역에 의해 터치 안됨 현상 방지
            ignoring: !isExpanded,
            child: AnimatedContainer(
              duration: duration,
              color: isExpanded
                  ? Colors.black.withOpacity(0.4)
                  : Colors.transparent,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AnimatedOpacity(
                  opacity: isExpanded ? 1 : 0,
                  duration: duration,
                  child: Column(
                    children: [
                      Container(
                        width: 160,
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.only(right: 15, bottom: 5),
                        decoration: BoxDecoration(
                            color: context.appColors.floatingActionLayer,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _floatItem(
                                  'part_time', '$basePath/fab/fab_01.png'),
                              _floatItem('lecture', '$basePath/fab/fab_02.png'),
                              _floatItem(
                                  'agriculture', '$basePath/fab/fab_03.png'),
                              _floatItem('profit', '$basePath/fab/fab_04.png'),
                              _floatItem('car', '$basePath/fab/fab_05.png'),
                            ]),
                      ),
                      Tap(
                        onTap: () {
                          Nav.push(WriteScreen());
                          // context.go('/');
                        },
                        child: Container(
                          width: 160,
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(right: 15, bottom: 10),
                          decoration: BoxDecoration(
                              color: context.appColors.floatingActionLayer,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _floatItem('sell_my_thing',
                                    '$basePath/fab/fab_06.png'),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
                Tap(
                  onTap: () {
                    // final currentTab = ref.read(currentTabProvider);
                    // switch (currentTab) {
                    //   case TabItem.home:
                    //   case TabItem.localLife:
                    //   case TabItem.nearMe:
                    //   case TabItem.chat:
                    //   case TabItem.my:
                    // }
                    ref.read(floatingButtonStateProvider.notifier).toggleMenu();
                    // ref.read(floatingButtonIsSmallProvider.notifier).state =
                    //     !isSmall;
                  },
                  child: AnimatedContainer(
                    duration: duration,
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                        color: isExpanded
                            ? context.appColors.floatingActionLayer
                            : Color(0xffff791f),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      AnimatedRotation(
                          child: Icon(Icons.add),
                          turns: isExpanded ? 0.125 : 0,
                          duration: duration),
                      AnimatedWidthCollapse(
                          visible: !isSmall,
                          child: '글쓰기'.text.make(),
                          duration: duration)
                    ]),
                  ),
                ).pOnly(
                    bottom: MainScreenState.buttonNavigationBarHeight +
                        context.viewPaddingBottom +
                        10,
                    right: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}

_floatItem(String title, String imagePath) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        imagePath,
        width: 30,
      ),
      const Width(8),
      title.tr().text.make()
    ],
  );
}
